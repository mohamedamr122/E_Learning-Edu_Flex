import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_eduflex/components/gradient_text.dart';
import 'package:new_eduflex/constants/constants.dart';

import '../../components/navigator_button.dart';
import '../../constants/class_color.dart';
import '../../services/upload_services.dart';
import '../layoutPages/rating_page.dart';

class UploadCourseInfo extends StatefulWidget {
  UploadCourseInfo({super.key});
  static const String routeName = 'UploadCourseInfo';

  @override
  State<UploadCourseInfo> createState() => _UploadCourseInfoState();
}

class _UploadCourseInfoState extends State<UploadCourseInfo> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  String _text = "Initial Text";
  String _text2 = "Initial Text";

  TextEditingController? _controller;
  TextEditingController? _controller2;

  bool _isEditing2 = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _text);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  final ImagePicker _picker = ImagePicker();
  String? _uploadedVideoUrl;

  Future<void> _uploadVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    print(video);
    if (video == null) return;

    try {
      Dio dio = Dio();
      String fileName = video.path.split('/').last;
      FormData formData = FormData.fromMap({
        "video": await MultipartFile.fromFile(video.path, filename: fileName),
      });

      Response response = await dio.post(
          "$apiUser/courses/{id}/sections/{sectionIndex}/videos",
          data: formData);

      if (response.statusCode == 200) {
        setState(() {
          _uploadedVideoUrl = response.data["videoUrl"];
        });
      } else {
        // Handle errors here
        print("Error uploading video: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading video: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      GradientText(text: 'Course Name'),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!.closeEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        size: 35,
                      )),
                ],
              ),
              const Divider(),
              GestureDetector(
                onTap: _uploadVideo,
                child: Container(
                  color: ColorManager.lightGray,
                  width: 297,
                  height: 55,
                  child: const Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                          color: ColorManager.mainGreen,
                          fontFamily: 'Roboto',
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _isEditing
                        ? TextField(
                            controller: _controller,
                            onSubmitted: (value) {
                              setState(() {
                                _text = value;
                                _isEditing = false;
                              });
                            },
                          )
                        : Text(
                            _text,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isEditing ? Icons.check : Icons.edit,
                      color: ColorManager.mainGreen,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isEditing) {
                          _text = _controller!.text;
                        }
                        _isEditing = !_isEditing;
                      });
                    },
                  ),
                ],
              ),
              const Divider(),
              Container(
                width: 297,
                height: 55,
                color: ColorManager.containerGrey,
                child: const Row(
                  children: [
                    Icon(
                      Icons.slow_motion_video,
                      color: ColorManager.mainGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'video 1 (5:54)',
                      style: TextStyle(
                          color: ColorManager.mainGreen,
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: ColorManager.lightGray,
                  width: 297,
                  height: 55,
                  child: const Center(
                      child: Text(
                    '+',
                    style: TextStyle(
                        color: ColorManager.mainGreen,
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _isEditing2
                        ? TextField(
                            controller: _controller2,
                            onSubmitted: (value) {
                              setState(() {
                                _text2 = value;
                                _isEditing2 = false;
                              });
                            },
                          )
                        : Text(
                            _text2,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isEditing2 ? Icons.check : Icons.edit,
                      color: ColorManager.mainGreen,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isEditing2) {
                          _text2 = _controller2!.text;
                        }
                        _isEditing2 = !_isEditing2;
                      });
                    },
                  ),
                ],
              ),
              const Divider(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: ColorManager.lightGray,
                  width: 297,
                  height: 55,
                  child: const Center(
                      child: Text(
                    '+',
                    style: TextStyle(
                        color: ColorManager.mainGreen,
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const GradientText(text: 'Course Name'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Notes!',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '1 - The video must be uploaded in MP4 format.',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '2 - Each video should be numbered in ascending order to indicate its sequence.',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '3 - The video quality should be a minimum of 480 px.',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

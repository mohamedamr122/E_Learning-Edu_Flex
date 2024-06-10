import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_eduflex/screens/upload_course_videos.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../classes/class_color.dart';
import '../components/dropbox.dart';
import '../components/navigator_button.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});
  static const String routeName = 'UploadPage';

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text:
          'Note ! \n(The appearance of the course and its information on the main page means that it has been approved) .',
      title:
          'The course data and images are being reviewed by the admin, and a response will be made within 10 to 15 minutes.',
      onConfirmBtnTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const UploadCourseVideos()),
      ),
    );
  }

  File? image;
  final imagePicker = ImagePicker();
  uploadImage() async {
    final pickImage = await imagePicker.pickImage(source: ImageSource.camera);

    image = File(pickImage!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          children: [
            Text(
              'Uploading',
              style: TextStyle(
                  color: ColorManager.mainGreen,
                  fontFamily: 'Roboto',
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              ' Form',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Note!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              'Make the course description short and add key points .!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 25,
              color: Color(0xff5C615F),
              indent: 50,
              endIndent: 50,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Course Name :  ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 186,
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 1, left: 5),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(236, 237, 237, 237),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Course description :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Form(
              child: SizedBox(
                width: 323,
                height: 98,
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(236, 241, 241, 241),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Education :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const MyDropBox(
              hintText: 'Select One',
              items: [
                DropdownMenuItem(
                  value: 'General',
                  child: Text('General'),
                ),
                DropdownMenuItem(
                  value: 'Special',
                  child: Text('Special'),
                ),
                DropdownMenuItem(
                  value: 'Graduated',
                  child: Text('Graduated'),
                ),
              ],
            ),
            const Text(
              'Stage :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const MyDropBox(
              hintText: 'Select One',
              items: [
                DropdownMenuItem(
                  value: 'Primary stage',
                  child: Text('Primary stage'),
                ),
                DropdownMenuItem(
                  value: 'Middle School',
                  child: Text('Middle School'),
                ),
                DropdownMenuItem(
                  value: 'High school',
                  child: Text('High school'),
                ),
                DropdownMenuItem(
                  value: 'University',
                  child: Text('University'),
                ),
              ],
            ),
            const Text(
              'Level :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const MyDropBox(
              hintText: 'Select One',
              items: [
                DropdownMenuItem(
                  value: 'Level One',
                  child: Text('Level One'),
                ),
                DropdownMenuItem(
                  value: 'Level Two',
                  child: Text('Level Two'),
                ),
                DropdownMenuItem(
                  value: 'Level Three',
                  child: Text('Level Three'),
                ),
              ],
            ),
            const Text(
              'Term :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const MyDropBox(
              hintText: 'Select One',
              items: [
                DropdownMenuItem(
                  value: 'first term',
                  child: Text('first term'),
                ),
                DropdownMenuItem(
                  value: 'Second term',
                  child: Text('Second term'),
                ),
              ],
            ),
            const Text(
              'Subject :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const MyDropBox(
              hintText: 'Select One',
              items: [
                DropdownMenuItem(
                  value: 'General',
                  child: Text('General'),
                ),
                DropdownMenuItem(
                  value: 'Special',
                  child: Text('Special'),
                ),
                DropdownMenuItem(
                  value: 'Graduated',
                  child: Text('Graduated'),
                ),
              ],
            ),
            const Text(
              'Course availability after purchase :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const MyDropBox(
              hintText: 'Select One',
              items: [
                DropdownMenuItem(
                  value: 'limited',
                  child: Text('limited'),
                ),
                DropdownMenuItem(
                  value: 'Unlimited',
                  child: Text('Unlimited'),
                ),
              ],
            ),
            const Text(
              'Limited period :',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const MyDropBox(
              hintText: 'Select One',
              items: [
                DropdownMenuItem(
                  value: 'A week',
                  child: Text('A week'),
                ),
                DropdownMenuItem(
                  value: '2 weeks',
                  child: Text('2 weeks'),
                ),
                DropdownMenuItem(
                  value: 'Month',
                  child: Text('Month'),
                ),
                DropdownMenuItem(
                  value: '2 month',
                  child: Text('2 month'),
                ),
                DropdownMenuItem(
                  value: '4 month',
                  child: Text('4 month'),
                ),
                DropdownMenuItem(
                  value: '6 month',
                  child: Text('6 month'),
                ),
                DropdownMenuItem(
                  value: '8 month',
                  child: Text('8 month'),
                ),
                DropdownMenuItem(
                  value: '10 month',
                  child: Text('10 month'),
                ),
                DropdownMenuItem(
                  value: 'Year ',
                  child: Text('Year '),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Key words :  ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 188,
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 1, left: 5),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(236, 237, 237, 237),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Price :',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 188,
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                      suffixText: 'LE',
                      contentPadding:
                          const EdgeInsets.only(bottom: 1, left: 5, right: 5),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(236, 240, 239, 239),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Add course photo :',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            GestureDetector(
              onTap: uploadImage,
              child: Container(
                height: 64,
                width: 148,
                margin: const EdgeInsets.only(left: 50, right: 50),
                decoration: BoxDecoration(
                  color: ColorManager.lightGray,
                  border: Border.all(
                    color: ColorManager.lightGray,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            MyNavigatorButton(
                textColor: Colors.white,
                onTap: () => showAlert(),
                height: 41,
                width: 283,
                color: ColorManager.mainGreen,
                text: 'Save')
          ],
        ),
      ),
    );
  }
}

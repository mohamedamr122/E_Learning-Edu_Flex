import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/auth_cubit.dart';
import 'package:new_eduflex/screens/layout_student_page.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../classes/class_color.dart';
import '../components/dropbox.dart';
import '../components/maintext.dart';
import '../components/navigator_button.dart';
import '../components/password.dart';
import '../components/smalltext.dart';
import '../components/textfield.dart';
import 'login_page.dart';

class StudentSignupPage extends StatefulWidget {
  const StudentSignupPage({super.key});

  @override
  State<StudentSignupPage> createState() => _StudentSignupPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController roleController = TextEditingController();
TextEditingController stageController = TextEditingController();
TextEditingController levelController = TextEditingController();

final formKey = GlobalKey<FormState>();

class _StudentSignupPageState extends State<StudentSignupPage> {
  String? educationSelected;
  String? levelSelected;
  String? gradeSelected;
  bool isDropdownVisible = false;

  showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Welcome back! Discover now!',
      title: 'You are signed up',
      onConfirmBtnTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadedState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => showAlert(),
              ),
            );
          } else if (state is RegisterFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
                backgroundColor: ColorManager.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      height: 97,
                      width: 101,
                      child: Image.asset(
                        'assets/images/splash_screen/logo1.png',
                        height: 91,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MainText(text: 'Sign Up'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              validator: (input) {
                                if (firstNameController.text.isNotEmpty) {
                                  return null;
                                } else {
                                  return 'First name must not be empty';
                                }
                              },
                              controller: firstNameController,
                              textHint: 'First Name',
                              icon: null,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MyTextField(
                              validator: (input) {
                                if (lastNameController.text.isNotEmpty) {
                                  return null;
                                } else {
                                  return 'Last name must not be empty';
                                }
                              },
                              controller: lastNameController,
                              textHint: 'Last Name',
                              icon: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MyTextField(
                          validator: (input) {
                            if (emailController.text.isNotEmpty) {
                              return null;
                            } else {
                              return 'Email must not be empty';
                            }
                          },
                          controller: emailController,
                          textHint: 'Email Address',
                          icon: null),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MyPasswordField(
                        validator: (input) {
                          if (passwordController.text.isNotEmpty) {
                            return null;
                          } else {
                            return 'Password must not be empty';
                          }
                        },
                        controller: passwordController,
                        text: 'Password',
                        color: ColorManager.lightGray,
                      ),
                    ),
                    MyPasswordField(
                      validator: (input) {
                        if (confirmPasswordController.text ==
                            passwordController.text) {
                          return null;
                        } else {
                          return 'Password not match';
                        }
                      },
                      controller: confirmPasswordController,
                      text: 'Confirm password',
                      color: ColorManager.lightGray,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: SmallText(text: 'Education'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: ColorManager.lightGray,
                        border: Border.all(
                          color: ColorManager.logGrey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField(
                        dropdownColor: ColorManager.lightGray,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        hint: const Text('Select One'),
                        items: ['General', 'Special', 'Graduated']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        value: educationSelected,
                        onChanged: (value) {
                          setState(() {
                            educationSelected = value!;
                            isDropdownVisible = true;
                          });
                        },
                      ),
                    ),
                    if (educationSelected == 'General') ...[
                      MyDropBox(
                        hintText: 'Level',
                        items: const [
                          DropdownMenuItem(
                            value: 'Primary level',
                            child: Text('Primary level'),
                          ),
                          DropdownMenuItem(
                            value: 'Middle school',
                            child: Text('Middle school'),
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
                      MyDropBox(
                        hintText: 'Grade',
                        items: const [
                          DropdownMenuItem(
                            value: 'Grade one',
                            child: Text('Grade one'),
                          ),
                          DropdownMenuItem(
                            value: 'Grade two',
                            child: Text('Grade two'),
                          ),
                          DropdownMenuItem(
                            value: 'Grade three',
                            child: Text('Grade three'),
                          ),
                        ],
                      ),
                    ],
                    MyNavigatorButton(
                      textColor: Colors.white,
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        //   BlocProvider.of<AuthCubit>(context).register(
                        //       firstName: firstNameController.text,
                        //       lastName: lastNameController.text,
                        //       email: emailController.text,
                        //       password: passwordController.text,
                        //       confirmPassword: confirmPasswordController.text,
                        //       role: roleController.text,
                        //       education: educationSelected.toString(),
                        //       stage: stageController.text,
                        //       level: levelController.text);
                        // }
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LayoutStudentPage()));
                      },
                      height: 60,
                      width: 252,
                      color: ColorManager.mainGreen,
                      text: 'Create Account',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have account?',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Color(0xff505050)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff0038C1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// state is RegisterLoadingState
//                           ? 'Loading...'
//                           :
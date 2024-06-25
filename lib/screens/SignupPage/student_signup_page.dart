import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';

import '../../constants/class_color.dart';
import '../../components/maintext.dart';
import '../../components/navigator_button.dart';
import '../../components/password.dart';
import '../../components/smalltext.dart';
import '../../components/textfield.dart';
import '../ForgotPasswordPage/verification_code_page.dart';
import '../LoginPage/login_page.dart';

class StudentSignupPage extends StatefulWidget {
  const StudentSignupPage({super.key});
  static const String routeName = 'StudentSignupPage';

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
// RegExp regex =
//     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
final GlobalKey<FormState> _formKey = GlobalKey();

class _StudentSignupPageState extends State<StudentSignupPage> {
  String? educationSelected;
  String? stageSelected;

  String? levelSelected;
  bool isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            final email = emailController.text;
            Navigator.pushNamed(context, VerificationCodePage.routeName,
                arguments: {'email': email});
          } else if (state is RegisterFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: _formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 97,
                    width: 101,
                    child: Image.asset(
                      'assets/images/splash_screen/logo1.png',
                      height: 91,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: MainText(text: 'Sign Up'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Flexible(
                          child: MyTextField(
                            obscureText: false,
                            validator: (firstName) {
                              if (firstName!.isEmpty) {
                                return 'First name is required';
                              }
                              return null;
                            },
                            controller: firstNameController,
                            textHint: 'First Name',
                            icon: null,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: MyTextField(
                            obscureText: false,
                            validator: (lastName) {
                              if (lastName!.isEmpty) {
                                return 'Last name is required';
                              }
                              return null;
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
                        obscureText: false,
                        validator: (email) {
                          if (email == null ||
                              email.isEmpty ||
                              !email.contains('@') ||
                              !email.contains('.')) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        controller: emailController,
                        textHint: 'Email Address',
                        icon: null),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MyPasswordField(
                      validator: (password) {
                        var passNonNullValue = password ?? "";
                        if (passNonNullValue.isEmpty) {
                          return ("Password is required");
                        } else if (passNonNullValue.length <= 8) {
                          return ("Password Must be more than or equal 8 characters");
                        }
                        return null;
                      },
                      controller: passwordController,
                      text: 'Password',
                      color: ColorManager.lightGray,
                    ),
                  ),
                  MyPasswordField(
                    validator: (confirmPassword) {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        return ('Password not matching');
                      }
                      return null;
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
                      decoration: const InputDecoration.collapsed(hintText: ''),
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
                  if (educationSelected == 'General' ||
                      educationSelected == 'Special') ...[
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
                        hint: const Text('Stage'),
                        items: [
                          'Primary level',
                          'Middle school',
                          'High school',
                          'University'
                        ]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        value: stageSelected,
                        onChanged: (value) {
                          setState(() {
                            stageSelected = value!;
                            isDropdownVisible = true;
                          });
                        },
                      ),
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
                        hint: const Text('level'),
                        items: [
                          'Level one',
                          'Level two',
                          'Level three',
                        ]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        value: levelSelected,
                        onChanged: (value) {
                          setState(() {
                            levelSelected = value!;
                            isDropdownVisible = true;
                          });
                        },
                      ),
                    ),
                  ],
                  MyNavigatorButton(
                    textColor: Colors.white,
                    onTap: () {
                      if (passwordController == confirmPasswordController ||
                          _formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).register(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            role: "Student",
                            education: educationSelected!,
                            stage: stageSelected,
                            level: levelSelected);
                      }
                    },
                    height: 60,
                    width: 252,
                    color: ColorManager.mainGreen,
                    text: state is RegisterLoadingState
                        ? 'Loading...'
                        : 'Create Account',
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
          );
        },
      ),
    );
  }
}

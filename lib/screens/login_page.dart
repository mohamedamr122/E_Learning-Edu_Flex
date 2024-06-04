import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/auth_cubit.dart';
import 'package:new_eduflex/screens/layout_student_page.dart';
import 'package:new_eduflex/screens/student_home_page.dart';
import '../classes/class_color.dart';
import '../components/maintext.dart';
import '../components/navigator_button.dart';
import '../components/password.dart';
import '../components/smalltext.dart';
import '../components/textfield.dart';
import 'choose_signup_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final _formlKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const StudentHomePage(),
                ),
              );
            }
            if (state is LoginFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(state.message)),
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formlKey,
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
                  MainText(
                    text: 'Log In',
                  ),
                  const SmallText(text: 'Email address'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MyTextField(
                      obscureText: false,
                      validator: (input) {
                        if (emailController.text.isNotEmpty) {
                          return null;
                        } else {
                          return 'email must not be empty';
                        }
                      },
                      textHint: 'Type your Email',
                      icon: null,
                      controller: emailController,
                    ),
                  ),
                  const SmallText(text: 'Password'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: MyPasswordField(
                      validator: (input) {
                        if (passwordController.text.isNotEmpty) {
                          return null;
                        } else {
                          return 'Password must not be empty';
                        }
                      },
                      controller: passwordController,
                      text: 'Type your password',
                      color: ColorManager.lightGray,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPassword(),
                      ));
                    },
                    child: const Text(
                      'forgot password?',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: ColorManager.forgotGray,
                      ),
                    ),
                  ),
                  MyNavigatorButton(
                    textColor: Colors.white,
                    onTap: () {
                      if (_formlKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LayoutStudentPage(),
                        ));
                      }
                    },
                    height: 52,
                    color: ColorManager.mainGreen,
                    width: 242,
                    text: state is LoginLoadingState ? 'Loading...' : 'Login',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account ?',
                          style: TextStyle(
                              color: Color(0xff707070),
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const ChooseSignUp()),
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: Color(0xff0038C1),
                                fontFamily: 'Roboto',
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

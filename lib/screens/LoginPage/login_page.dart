import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/screens/HomePage/layout_student_page.dart';
import '../../constants/class_color.dart';
import '../../components/maintext.dart';
import '../../components/navigator_button.dart';
import '../../components/password.dart';
import '../../components/smalltext.dart';
import '../../components/textfield.dart';
import '../SignupPage/choose_signup_page.dart';
import '../ForgotPasswordPage/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushNamed(context, LayoutStudentPage.routeName);
            } else if (state is LoginFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _loginFormKey,
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
                    const MainText(
                      text: 'Log In',
                    ),
                    const SmallText(text: 'Email address'),
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
                        textHint: 'Type your Email',
                        icon: null,
                        controller: emailController,
                      ),
                    ),
                    const SmallText(text: 'Password'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: MyPasswordField(
                        validator: (password) {
                          var passNonNullValue = password ?? "";
                          if (passNonNullValue.isEmpty) {
                            return ("Password is required");
                          }
                          // else if (!regex.hasMatch(passNonNullValue)) {
                          //   return ("Password should contain upper,lower,digit and Special character ");
                          // }
                          return null;
                        },
                        controller: passwordController,
                        text: 'Type your password',
                        color: ColorManager.lightGray,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, ForgotPasswordPage.routeName);
                          },
                          child: const Text('Forgot Password'),
                        ),
                      ],
                    ),
                    MyNavigatorButton(
                      textColor: Colors.white,
                      onTap: () {
                        if (_loginFormKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text);
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
                            onTap: () =>
                                Navigator.pushReplacementNamed(
                                    context, ChooseSignUpPage.routeName),
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
              ),
            );
          },
        ),
      ),
    );
  }
}

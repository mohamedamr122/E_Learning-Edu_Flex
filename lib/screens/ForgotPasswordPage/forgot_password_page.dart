import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/verification_code_forgot_password_page.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/verification_code_page.dart';
import 'package:new_eduflex/screens/LoginPage/login_page.dart';

import '../../constants/class_color.dart';
import '../../components/navigator_button.dart';
import '../../components/smalltext.dart';
import '../../components/textfield.dart';

TextEditingController emailController = TextEditingController();

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String routeName = 'ForgotPasswordPage';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
              final email = emailController.text;
              Navigator.pushNamed(
                  context, VerificationCodeForgotPasswordPage.routeName,
                  arguments: {'email': email});
            }
            if (state is ForgotPasswordFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _forgotPasswordFormKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.logGrey,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 16),
                    child: Text(
                      'enter email associated with your account and we will send and email with instructions to reset password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Roboto',
                        color: ColorManager.forgotGray,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: SmallText(text: 'Email address'),
                  ),
                  MyTextField(
                      obscureText: false,
                      validator: (email) {
                        if (email == null ||
                            email.isEmpty ||
                            !email.contains('@') ||
                            !email.contains('.')) {
                          return 'Email not valid';
                        }
                        return null;
                      },
                      controller: emailController,
                      textHint: 'Enter your Email here',
                      icon: null),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MyNavigatorButton(
                        textColor: Colors.white,
                        onTap: () {
                          final email = emailController.text;
                          if (_forgotPasswordFormKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .forgotPassword(email: email);
                          }
                        },
                        height: 52,
                        width: 242,
                        color: ColorManager.mainGreen,
                        text: state is ForgotPasswordLoadingState
                            ? 'Loading...'
                            : 'Send code'),
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

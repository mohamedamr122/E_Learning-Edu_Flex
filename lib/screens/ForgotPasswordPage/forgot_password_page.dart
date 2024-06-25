import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/verification_code_page.dart';

import '../../constants/class_color.dart';
import '../../components/navigator_button.dart';
import '../../components/smalltext.dart';
import '../../components/textfield.dart';

TextEditingController emailController = TextEditingController();

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static const String routeName = 'ForgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoadedState) {
          final emailForgot = emailController;
          Navigator.pushNamed(context, VerificationCodePage.routeName,
              arguments: {'email': emailForgot});
        }
        if (state is VerifyFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email does not exist'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Form(
            key: _formKey,
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
                        return 'Email is required';
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
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .forgotPassword(email: emailController.text);
                        }
                      },
                      height: 52,
                      width: 242,
                      color: ColorManager.mainGreen,
                      text: state is VerifyLoadingState
                          ? 'Loading...'
                          : 'Send code'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

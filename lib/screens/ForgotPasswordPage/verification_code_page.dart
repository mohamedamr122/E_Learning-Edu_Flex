import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/create_new_password_page.dart';
import 'package:new_eduflex/screens/LoginPage/login_page.dart';

import '../../constants/class_color.dart';
import '../../components/navigator_button.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});
  static const String routeName = 'VerificationCode';

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;
  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(minutes: 60), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final argsEmail =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final email = argsEmail['email']!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifySuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Verification successful')),
            );
            Navigator.pushNamed(context, LoginPage.routeName);
          } else if (state is VerifyFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ForgotPasswordLoadedState) {
            Navigator.pushNamed(context, CreateNewPasswordPage.routeName);
          } else if (state is ForgotPasswordFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Verification Code',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      color: ColorManager.logGrey,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 16),
                child: Center(
                  child: Text(
                    'The code send to your email******@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      color: ColorManager.forgotGray,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 22),
                child: Form(
                  child: OtpTextField(
                    onSubmit: (value) {
                      otpController.text = value;
                    },
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    numberOfFields: 6,
                    fillColor: ColorManager.lightGray,
                    filled: true,
                    borderColor: Colors.grey,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabled: true),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      enableResend ? _resendCode : null;
                      BlocProvider.of<AuthCubit>(context)
                          .resendOTP(email: email);
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: Color(0xff919191),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    'after $secondsRemaining minutes',
                    style: const TextStyle(
                      color: Color(0xff919191),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              MyNavigatorButton(
                  textColor: Colors.white,
                  onTap: () {
                    if (state is VerifyLoadingState) {
                      BlocProvider.of<AuthCubit>(context).verifyEmail(
                          email: email, otpCode: otpController.text);
                    } else if (state is ForgotPasswordLoadingState) {
                      BlocProvider.of<AuthCubit>(context)
                          .forgotPassword(email: email);
                    }
                  },
                  height: 52,
                  width: 242,
                  color: ColorManager.mainGreen,
                  text: 'Verify')
            ],
          );
        },
      ),
    );
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }
}

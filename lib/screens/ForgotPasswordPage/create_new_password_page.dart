import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../constants/class_color.dart';
import '../../components/navigator_button.dart';
import '../../components/password.dart';
import '../../components/smalltext.dart';
import '../LoginPage/login_page.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});
  static const String routeName = 'CreateNewPasswordPage';

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Welcome back! Discover now!',
      title: 'Your password has been changed',
      onConfirmBtnTap: () => Navigator.pushReplacementNamed(context, LoginPage.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String email = args['email'];
    final String resetPwOtp = args['resetPwOtp'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
  create: (context) => AuthCubit(),
  child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            showAlert();
          } else if (state is ResetPasswordFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
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
                    'Create new Password',
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
                padding: EdgeInsets.only(top: 8.0),
                child: SmallText(text: 'New password'),
              ),
              MyPasswordField(
                validator: (newPassword) {
                  var passNonNullValue = newPassword ?? "";
                  if (passNonNullValue.isEmpty) {
                    return ("Password is required");
                  } else if (passNonNullValue.length <= 8) {
                    return ("Password Must be more than or equal 8 characters");
                  }
                  return null;
                },
                controller: newPasswordController,
                text: 'Enter your new password',
                color: ColorManager.lightGray,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SmallText(text: 'Confirm new password'),
              ),
              MyPasswordField(
                validator: (confirmPassword) {
                  if (newPasswordController.text !=
                      confirmNewPasswordController.text) {
                    return ('Password not matching');
                  }
                  return null;
                },
                controller: confirmNewPasswordController,
                text: 'Confirm your new password',
                color: ColorManager.lightGray,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '*Password must be at least 9 characters 1 uppercase.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Color(0xffFF0000),
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: MyNavigatorButton(
                      textColor: Colors.white,
                      onTap: () {
                        BlocProvider.of<AuthCubit>(context).resetPassword(
                            email: email,
                            resetPwOtp: resetPwOtp,
                            newPassword: newPasswordController.text,
                            confirmNewPassword:
                                confirmNewPasswordController.text);
                      },
                      height: 52,
                      width: 242,
                      color: ColorManager.mainGreen,
                      text:state is ResetPasswordLoadingState ? 'Loading...' : 'Submit'),
                ),
              )
            ],
          );
        },
      ),
),
    );
  }
}

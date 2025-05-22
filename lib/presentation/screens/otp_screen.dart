import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubits/auth_cubit/phone_auth_cubit.dart';
import 'package:flutter_maps/helper/functions.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../generated/l10n.dart';
import '../widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phoneNumber});

  final phoneNumber;

  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: Column(
              children: [
                _buildIntroTexts(context),
                SizedBox(height: 75.h),
                _buildOtpFields(context),
                SizedBox(height: 55.h),
                CustomButton(
                  title: S.of(context).verify,
                  onPressed: () {
                    showProgressIndicator(context);
                    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
                    // Navigator.pushReplacementNamed(context, finishScreen);
                  },
                  width: 110,
                ),
                _buildPhoneVirificationBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneVirificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      // امته يعمل ليسن
      listenWhen: (previous, current) {
        // هيلسن لما الاستيت تتغير
        return previous != current;
      },
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }

        if (state is PhoneOTPVerified) {
          Navigator.pop(context); // من اللودينج
          Navigator.pushReplacementNamed(
            // عشان مايرجعش تانى لل login
            context,
            finishScreen,
          );
        }
        if (state is PhoneAuthFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  Widget _buildIntroTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).verify_your_phone,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 25),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: S.of(context).login_disc,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                height: 1.4,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: phoneNumber,
                  style: TextStyle(color: ProjectColors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOtpFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        obscureText: false,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: ProjectColors.blue,
          inactiveColor: ProjectColors.blue,
          inactiveFillColor: Colors.white,
          activeFillColor: ProjectColors.lightBlue,
          selectedColor: ProjectColors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,

        onCompleted: (submittedCode) {
          otpCode = submittedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}

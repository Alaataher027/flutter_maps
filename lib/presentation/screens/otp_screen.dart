import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/colors.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:flutter_maps/generated/l10n.dart';
import 'package:flutter_maps/presentation/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

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
                    Navigator.pushNamed(context, finishScreen);
                  },
                  width: 110,
                ),
              ],
            ),
          ),
        ),
      ),
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

      onCompleted: (code) {
        //otpCode = code;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    ),
  );
}

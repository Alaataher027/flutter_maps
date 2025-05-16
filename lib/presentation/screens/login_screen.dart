import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:flutter_maps/presentation/widgets/custom_button.dart';
import 'package:flutter_maps/presentation/widgets/phoneFormField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> phoneFormKey = GlobalKey();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: phoneFormKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntroTexts(context),
                  SizedBox(height: 110.h),
                  Phoneformfield(
                    onSaved: (value) {
                      phoneNumber = value ?? '';
                    },
                  ),
                  SizedBox(height: 110.h),
                  CustomButton(
                    title: S.of(context).next,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        otpScreen,
                        arguments: phoneNumber,
                      );
                    },
                    width: 110,
                  ),
                ],
              ),
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
          S.of(context).login_title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 25),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            S.of(context).login_disc,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }
}




// Padding(
//   padding: EdgeInsetsDirectional.only(start: 16),
// )

// ↪ بدلاً من:

// Padding(
//   padding: EdgeInsets.only(
//     left: isArabic() ? 0 : 16,
//     right: isArabic() ? 16 : 0,
//   ),
// )
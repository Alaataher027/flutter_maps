import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/colors.dart';
import 'package:flutter_maps/presentation/widgets/phoneFormField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntroTexts(context),
                SizedBox(height: 110.h),
                // _buildPhoneFormField(context),
                Phoneformfield(
                  onSaved: (value) {
                    phoneNumber = value ?? '';
                  },
                ),
                SizedBox(height: 110.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(110, 50),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      S.of(context).next,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
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
      children: [
        Text(
          S.of(context).login_title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 12),
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

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
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
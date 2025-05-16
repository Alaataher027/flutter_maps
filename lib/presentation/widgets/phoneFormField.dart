import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

class Phoneformfield extends StatefulWidget {
  const Phoneformfield({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<Phoneformfield> createState() => _PhoneformfieldState();
}

class _PhoneformfieldState extends State<Phoneformfield> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ProjectColors.lghtGrey),
            ),
            child: Text(
              "${generateCountryFlag()} +20",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        SizedBox(width: 11.w),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ProjectColors.blue),
            ),
            child: TextFormField(
              autofocus: true,
              style: TextStyle(fontSize: 14.sp, letterSpacing: 2),
              decoration: InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Phone Number!";
                } else if (value.length < 11) {
                  return "Too short for a phone number!";
                }
                return null;
              },
              onSaved: widget.onSaved,
            ),
          ),
        ),
      ],
    );
  }
}

String generateCountryFlag() {
  String countryCode = 'eg';
  return countryCode.toUpperCase().replaceAllMapped(
    RegExp(r'[A-Z]'),
    (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
  );
}

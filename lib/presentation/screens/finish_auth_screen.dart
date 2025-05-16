import 'package:flutter/material.dart';
import 'package:flutter_maps/generated/l10n.dart';
import 'package:flutter_maps/presentation/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FinishAuthScreen extends StatelessWidget {
  const FinishAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(
            left: 32.h,
            right: 32.h,
            top: 150.h,
            bottom: 88.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/check_mark.svg',
                height: 126.h,
                width: 121.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 35.h),
              Text(
                S.of(context).almost_done,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CustomButton(
                title: S.of(context).done,
                width: double.infinity,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

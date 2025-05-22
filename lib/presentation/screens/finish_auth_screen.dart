import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/strings.dart';
import '../../generated/l10n.dart';
import '../widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FinishAuthScreen extends StatelessWidget {
  const FinishAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ).copyWith(top: 50.h, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.h),
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
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),

              CustomButton(
                title: S.of(context).done,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, mapScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

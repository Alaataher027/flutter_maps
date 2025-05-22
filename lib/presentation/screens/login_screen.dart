import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubits/auth_cubit/phone_auth_cubit.dart';
import 'package:flutter_maps/helper/functions.dart';
import '../../constants/strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/phoneFormField.dart';
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
                      // BlocProvider.of<PhoneAuthCubit>(
                      //   context,
                      // ).SubmitPhoneNumber(phoneNumber!);
                      showProgressIndicator(context);
                      _register(context);
                    },
                    width: 110,
                  ),

                  _buildPhoneNumberSubmitedBloc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!phoneFormKey.currentState!.validate()) { /// if not valid
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      phoneFormKey.currentState!.save();
    }
    BlocProvider.of<PhoneAuthCubit>(context).SubmitPhoneNumber(phoneNumber!);
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

  Widget _buildPhoneNumberSubmitedBloc() {
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

        if (state is PhoneNumberSubmitted) {
          Navigator.pop(context); // من اللودينج
          Navigator.pushReplacementNamed(context, otpScreen, arguments: phoneNumber);
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
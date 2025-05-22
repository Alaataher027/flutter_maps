import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubits/auth_cubit/phone_auth_cubit.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';
import 'presentation/screens/finish_auth_screen.dart';
import 'presentation/screens/otp_screen.dart';

import 'constants/strings.dart';
import 'presentation/screens/login_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
    AppRouter() {
      phoneAuthCubit = PhoneAuthCubit();
    }
  Route? generateRoute(RouteSettings settings) {
    

    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child: LoginScreen(),
              ),
        );
      case otpScreen:
        final phoneNumber = settings.arguments;
        return CupertinoPageRoute(
          builder:
              (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child: OtpScreen(phoneNumber: phoneNumber),
              ),
        );
      case finishScreen:
        return CupertinoPageRoute(builder: (_) => FinishAuthScreen());
      case mapScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child: MapScreen(),
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text("No route defined for ${settings.name}"),
                ),
              ),
        );
    }
  }
}

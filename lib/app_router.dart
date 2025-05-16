import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/screens/finish_auth_screen.dart';
import 'package:flutter_maps/presentation/screens/otp_screen.dart';

import 'constants/strings.dart';
import 'presentation/screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case otpScreen:
        return CupertinoPageRoute(builder: (_) => OtpScreen(phoneNumber: ""));
      case finishScreen:
        return CupertinoPageRoute(builder: (_) => FinishAuthScreen());
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

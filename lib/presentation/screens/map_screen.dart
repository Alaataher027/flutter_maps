import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubits/auth_cubit/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:flutter_maps/generated/l10n.dart';
import 'package:flutter_maps/presentation/widgets/custom_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: CustomButton(
            onPressed: () async {
              await phoneAuthCubit.logOut();
              Navigator.pushReplacementNamed(context, loginScreen);
            },
            title: S.of(context).log_out,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

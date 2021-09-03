import 'package:banking_app/bloc/splash/splash_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Cubit<SplashState> {

  SplashBloc(BuildContext context) : super(SplashState()) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil('/form_page', (Route<dynamic> route) => false);
    });
  }

}
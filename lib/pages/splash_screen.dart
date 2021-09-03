import 'package:banking_app/bloc/splash/splash_bloc.dart';
import 'package:banking_app/bloc/splash/splash_state.dart';
import 'package:banking_app/bloc/utils/text_strings.dart';
import 'package:banking_app/pages/base_pages/base_stateless_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends BaseStatelessPage {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget layout(BuildContext context, double widthPx, double heightPx) {

    return BlocProvider(
      create: (_) => SplashBloc(context),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, splashState) {
          return Material(
            child: Container(
                color: Theme.of(context).primaryColorDark,
                child: SafeArea(
                  minimum: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(TextStrings.WEB_SITE_NAME,
                      style: TextStyle(
                          color: Colors.black87, fontSize: 35, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
            ),
          );
        }
      ),
    );
  }
}
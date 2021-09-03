import 'package:flutter/material.dart';

abstract class BaseStatelessPage extends StatelessWidget {

  @protected static var _mediaQuery;

  BaseStatelessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);

    return layout(context, _mediaQuery.size.width, _mediaQuery.size.height);
  }

  Widget layout(BuildContext context, double widthPx, double heightPx);
}
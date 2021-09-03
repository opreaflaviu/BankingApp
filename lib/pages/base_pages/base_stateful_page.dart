import 'package:flutter/material.dart';

abstract class BaseStatefulPage extends StatefulWidget {
  BaseStatefulPage({Key? key}) : super(key: key);
}

abstract class BaseStatefulPageState<T extends BaseStatefulPage> extends State<T> {

  @protected var _mediaQuery;

  @override
  Widget build(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);

    return layout(context, _mediaQuery.size.width, _mediaQuery.size.height);
  }

  Widget layout(BuildContext context, double widthPx, double heightPx);
}

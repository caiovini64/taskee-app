import 'package:flutter/material.dart';

class LayoutUtils {
  BuildContext context;
  LayoutUtils(this.context);
  bool isLargeScreen() => MediaQuery.of(context).size.width > 600;
  double resizeWidget(double valor) => isLargeScreen() ? valor * 1.6 : valor;
}

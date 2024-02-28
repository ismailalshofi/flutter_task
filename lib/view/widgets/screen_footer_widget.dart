import 'package:flutter/material.dart';

class ScreenFooter extends StatelessWidget {
  final List<Widget> children;
  const ScreenFooter({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
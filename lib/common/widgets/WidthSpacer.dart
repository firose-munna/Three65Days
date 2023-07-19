import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
    );
  }
}

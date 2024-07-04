import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Image.asset(
        'assets/images/logo/logo_purple.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

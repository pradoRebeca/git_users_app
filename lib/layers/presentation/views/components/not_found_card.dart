import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotFoundCard extends StatelessWidget {
  const NotFoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: SvgPicture.asset(
        'assets/images/not_found.svg',
        fit: BoxFit.contain,
      ),
    );
  }
}

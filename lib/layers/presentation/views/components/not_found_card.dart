import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotFoundCard extends StatelessWidget {
  const NotFoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
      child: SvgPicture.asset(
        'assets/images/search.svg',
        fit: BoxFit.contain,
      ),
    );
  }
}

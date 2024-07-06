import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
          child: SvgPicture.asset(
            'assets/images/folders.svg',
            fit: BoxFit.contain,
          ),
        ),
        TextButton(
            onPressed: () => Get.toNamed('/'),
            child: const Text('Search users'))
      ],
    );
  }
}

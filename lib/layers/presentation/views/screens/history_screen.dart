import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/views/components/logo_image.dart';
import 'package:git_users_app/layers/presentation/views/components/tittle_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TittleCard(title: 'History'),
          leading: const LogoImage(),
          actions: [
            IconButton(
              onPressed: () => Get.back(),
              color: Theme.of(context).colorScheme.onPrimary,
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: const Column(
          children: [],
        ));
  }
}

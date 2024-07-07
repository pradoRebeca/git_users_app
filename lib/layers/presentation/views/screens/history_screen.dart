import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/controller/history_controller_impl.dart';
import 'package:git_users_app/layers/presentation/views/components/divider_line.dart';
import 'package:git_users_app/layers/presentation/views/components/empty_card.dart';
import 'package:git_users_app/layers/presentation/views/components/history_card.dart';
import 'package:git_users_app/layers/presentation/views/components/logo_image.dart';
import 'package:git_users_app/layers/presentation/views/components/tittle_card.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final historyController = Get.find<HistoryControllerImpl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TittleCard(title: 'History'),
          leading: const LogoImage(),
          actions: [
            IconButton(
              icon: Icon(Icons.search,
                  color: Theme.of(context).colorScheme.primary),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: DividerLine(),
              ),
              Expanded(
                child: Obx(
                  () {
                    if (historyController.histories.isEmpty) {
                      return const Center(
                        child: EmptyCard(),
                      );
                    }

                    return ListView.builder(
                      itemCount: historyController.histories.length,
                      itemBuilder: (context, index) => HistoryCard(
                          historyDto: historyController.histories[index]),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

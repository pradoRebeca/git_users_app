import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/controller/search_controller.dart';
import 'package:git_users_app/layers/presentation/views/components/divider_line.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_bottom_sheet.dart';
import 'package:git_users_app/layers/presentation/views/components/logo_image.dart';
import 'package:git_users_app/layers/presentation/views/components/profile_card.dart';
import 'package:git_users_app/layers/presentation/views/components/search_input.dart';
import 'package:git_users_app/layers/presentation/views/components/tittle_card.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchUserController searchUserController =
      Get.find<SearchUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const TittleCard(title: 'Search users',),
        leading: const LogoImage(),
        actions: [
          IconButton(
            icon: Icon(Icons.history,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () => Get.toNamed('/history'),
          ),
          IconButton(
            icon:
                Icon(Icons.tune, color: Theme.of(context).colorScheme.primary),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const FilterBottomSheet(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                child: SearchInput(
                  onSearchClick: (String search) async {
                    await searchUserController.getUsers(search);
                  },
                )),
            const DividerLine(),
            Expanded(
                child: Obx(
              () => ListView.builder(
                itemCount: searchUserController.users.length,
                itemBuilder: (context, index) => ProfileCard(
                  user: searchUserController.users[index],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/presentation/controller/search_controller.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_button.dart';
import 'package:git_users_app/layers/presentation/views/components/profile_card.dart';
import 'package:git_users_app/layers/presentation/views/components/quantity_users_card.dart';
import 'package:git_users_app/layers/presentation/views/components/search_input.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchUserController searchUserController =
      Get.find<SearchUserController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SearchInput(
                onSearchClick: (String search) async {
                  await searchUserController.getUsers(search);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => QuantityUsersCard(
                      quantityUsers: searchUserController.users.length),
                ),
                const FilterButton()
              ],
            ),
          ),
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
    );
  }
}

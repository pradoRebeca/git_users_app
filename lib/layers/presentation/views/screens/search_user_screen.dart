import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/controller/search_controller.dart';
import 'package:git_users_app/layers/presentation/views/components/chip_filter.dart';
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

  void search(QuerySearchDto query) {
    searchUserController.search(query);
  }

  void onClear() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const TittleCard(
          title: 'Search users',
        ),
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
                builder: (context) => FilterBottomSheet(
                  onPressed: (QuerySearchDto query) => search(query),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SearchInput(
                  onSearchClick: (String query) =>
                      search(QuerySearchDto(query: query)),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 15),
              child: SizedBox(
                height: 40,
                child: Obx(
                  () => ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      if (searchUserController.location.value != null)
                        ChipFilter(
                          icon: Icons.location_on_outlined,
                          label: searchUserController.location.value!,
                        ),
                      if (searchUserController.language.value != null)
                        ChipFilter(
                          icon: Icons.code,
                          label: searchUserController.language.value!,
                        ),
                      if (searchUserController.repositories.value != null)
                        ChipFilter(
                          icon: Icons.code,
                          label: searchUserController.repositories.value
                              .toString(),
                        ),
                      if (searchUserController.followers.value != null)
                        ChipFilter(
                          icon: Icons.code,
                          label:
                              searchUserController.followers.value.toString(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
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

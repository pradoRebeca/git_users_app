import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/controller/search_controller.dart';
import 'package:git_users_app/layers/presentation/views/components/divider_line.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_bottom_sheet.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_chip_card.dart';
import 'package:git_users_app/layers/presentation/views/components/logo_image.dart';
import 'package:git_users_app/layers/presentation/views/components/not_found_card.dart';
import 'package:git_users_app/layers/presentation/views/components/profile_card.dart';
import 'package:git_users_app/layers/presentation/views/components/search_input.dart';
import 'package:git_users_app/layers/presentation/views/components/tittle_card.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchUserController searchUserController =
      Get.find<SearchUserController>();

  void search(QuerySearchDto querySearchDto) {
    searchUserController.search(querySearchDto);
  }

  void onClearFilter(QuerySearchDto querySearchDto) {
    searchUserController.onClearFilter(querySearchDto);
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return GetBuilder<SearchUserController>(
            builder: (controller) {
              {
                final querySearchDto = QuerySearchDto(
                    location: searchUserController.location.value,
                    language: searchUserController.language.value,
                    repositories: searchUserController.repositories.value,
                    followers: searchUserController.followers.value);

                return FilterBottomSheet(
                  querySearchDto: querySearchDto,
                  onPressed: (QuerySearchDto query) => search(query),
                );
              }
            },
          );
        });
  }

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
            onPressed: () => _showFilterBottomSheet(context),
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
                padding: const EdgeInsets.only(top: 20),
                child: SearchInput(
                  onClear: (QuerySearchDto querySearchDto) =>
                      onClearFilter(querySearchDto),
                  onSearchClick: (QuerySearchDto querySearchDto) =>
                      search(querySearchDto),
                )),
            Obx(() {
              final querySearchDto = QuerySearchDto(
                  location: searchUserController.location.value,
                  language: searchUserController.language.value,
                  repositories: searchUserController.repositories.value,
                  followers: searchUserController.followers.value);

              return FilterChipCard(
                querySearchDto: querySearchDto,
                onClear: (QuerySearchDto querySearchDto) =>
                    onClearFilter(querySearchDto),
              );
            }),
            const DividerLine(),
            Expanded(child: Obx(
              () {
                if (searchUserController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (searchUserController.users.isNotEmpty) {
                  return ListView.builder(
                    itemCount: searchUserController.users.length,
                    itemBuilder: (context, index) => ProfileCard(
                      user: searchUserController.users[index],
                    ),
                  );
                }

                return const Center(
                  child: NotFoundCard(),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

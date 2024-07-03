import 'package:flutter/material.dart';

import 'package:git_users_app/theme/app_theme.dart';

class SearchInput extends StatelessWidget {
  SearchInput({
    super.key,
    required this.onSearchClick,
  });

  final Function onSearchClick;

  // final SearchUserController searchUserController = Get.find();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.cancel_outlined,
          color: AppTheme.lightBlack,
        ),
        suffixIcon: IconButton(
            onPressed: () => onSearchClick(textEditingController.text),
            icon: const Icon(Icons.search)),
      ),
    );
  }
}

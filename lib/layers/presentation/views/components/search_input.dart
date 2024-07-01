import 'package:flutter/material.dart';
import 'package:git_users_app/theme/app_theme.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'test',
        prefixIcon: const Icon(
          Icons.search,
          color: AppTheme.lightBlack,
        ),
        suffixIcon: IconButton(
            onPressed: () {}, icon: const Icon(Icons.cancel_outlined)),
      ),
    );
  }
}

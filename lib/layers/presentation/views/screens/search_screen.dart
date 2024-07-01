import 'package:flutter/material.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_button.dart';
import 'package:git_users_app/layers/presentation/views/components/quantity_users_card.dart';
import 'package:git_users_app/layers/presentation/views/components/search_input.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SearchInput(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [QuantityUsersCard(quantityUsers: 20), FilterButton()],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_button.dart';
import 'package:git_users_app/layers/presentation/views/components/profile_card.dart';
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
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SearchInput(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [QuantityUsersCard(quantityUsers: 20), FilterButton()],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => ProfileCard(
              user: UserDto(
                  name: 'Rebeca Prado',
                  followers: '17',
                  location: '',
                  repositories: '10',
                  resume: 'Técnica em Desenvolvimento de Sistemas - Senai',
                  avatarUrl:
                      'https://avatars.githubusercontent.com/u/89099816?v=4',
                  userLogin: 'pradoRebeca'),
            ),
          )),
        ],
      ),
    );
  }
}

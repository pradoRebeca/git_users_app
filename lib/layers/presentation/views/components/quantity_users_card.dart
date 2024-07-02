// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuantityUsersCard extends StatelessWidget {
  const QuantityUsersCard({
    super.key,
    required this.quantityUsers,
  });

  final int quantityUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 1),
          borderRadius: BorderRadius.circular(20)),
      // height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Usuários',
            style: Theme.of(context).textTheme.bodyMedium?.merge(TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 2),
            child: Icon(
              Icons.group_rounded,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 20,
            ),
          ),
          Text(quantityUsers.toString(),
              style: Theme.of(context).textTheme.bodySmall?.merge(TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer)))
        ],
      ),
    );
  }
}

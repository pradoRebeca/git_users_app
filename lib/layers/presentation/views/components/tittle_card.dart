import 'package:flutter/material.dart';

class TittleCard extends StatelessWidget {
  const TittleCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge?.merge(TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          )),
    );
  }
}

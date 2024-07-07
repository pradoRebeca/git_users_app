import 'package:flutter/material.dart';

class ChipFilter extends StatelessWidget {
  const ChipFilter({
    super.key,
    required this.icon,
    required this.label,
    required this.onClear,
  });

  final IconData icon;
  final String label;
  final Function onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                icon,
                size: 18,
              ),
            ),
            Text(
              label,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            IconButton(
                onPressed: () => onClear(),
                icon: const Icon(
                  Icons.cancel,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}

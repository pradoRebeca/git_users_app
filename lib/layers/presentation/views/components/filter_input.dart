import 'package:flutter/material.dart';

class FilterInput extends StatelessWidget {
  const FilterInput({
    super.key,
    required this.filterController,
    required this.icon,
    required this.label,
    this.inputType,
  });

  final IconData icon;
  final String label;
  final TextInputType? inputType;
  final TextEditingController filterController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 18.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    icon,
                    size: 18,
                  ),
                ),
                Flexible(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyMedium?.merge(
                        TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  ),
                )
              ],
            ),
          ),
          TextField(
            controller: filterController,
            keyboardType: inputType,
          )
        ],
      ),
    );
  }
}

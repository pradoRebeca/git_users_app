import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.onSearchClick,
  });

  final Function onSearchClick;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController textController = TextEditingController();
  bool editingIsEmpty = false;

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        editingIsEmpty = textController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: (text) {
        widget.onSearchClick(text);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        suffixIcon: editingIsEmpty
            ? IconButton(
                onPressed: () => textController.clear(),
                icon: const Icon(Icons.cancel_outlined),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              )
            : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, required this.onSearchClick});

  final Function onSearchClick;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController textController = TextEditingController();
  bool editingIsEmpty = true;

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        editingIsEmpty = textController.text.isEmpty;
      });
    });
  }

  void submitted(String text) {
    if (text.isNotEmpty) {
      widget.onSearchClick(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      autocorrect: false,
      textInputAction: TextInputAction.search,
      onSubmitted: (text) => submitted(text),
      onChanged: (text) => submitted(text),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        suffixIcon: !editingIsEmpty
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

import 'package:flutter/material.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.onClear,
    required this.onSearchClick,
  });

  final void Function(QuerySearchDto querySearchDto) onClear;
  final void Function(QuerySearchDto querySearchDto) onSearchClick;

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
      widget.onSearchClick(QuerySearchDto(query: text));
    }
  }

  void onClearInput() {
    widget.onClear(QuerySearchDto(query: ''));
    textController.clear();
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
                onPressed: () => onClearInput(),
                icon: const Icon(Icons.cancel_outlined),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              )
            : null,
      ),
    );
  }
}

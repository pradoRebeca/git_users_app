import 'package:flutter/material.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';

class SearchInput extends StatefulWidget {
  const SearchInput(
      {super.key,
      required this.onClear,
      required this.onSearchClick,
      required this.initialText});

  final String? initialText;
  final void Function(QuerySearchDto querySearchDto) onClear;
  final void Function(QuerySearchDto querySearchDto) onSearchClick;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _textController;
  bool editingIsEmpty = true;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialText);

    if (widget.initialText != null && widget.initialText!.isNotEmpty) {
      _updateEditingState();
    }

    _textController.addListener(_updateEditingState);
  }

  @override
  void didUpdateWidget(covariant SearchInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialText != oldWidget.initialText) {
      _textController.text = widget.initialText ?? '';
      _updateEditingState();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _updateEditingState() {
    setState(() {
      editingIsEmpty = _textController.text.isEmpty;
    });
  }

  void submitted(String text) {
    if (text.isNotEmpty) {
      widget.onSearchClick(QuerySearchDto(query: text));
    }
  }

  void onClearInput() {
    widget.onClear(QuerySearchDto(query: ''));
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
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

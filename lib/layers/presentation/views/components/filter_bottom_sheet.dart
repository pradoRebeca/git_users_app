import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/divider_line.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_input.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
    required this.onPressed,
    required this.querySearchDto,
  });

  final QuerySearchDto querySearchDto;
  final void Function(QuerySearchDto querySearchDto) onPressed;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late TextEditingController _locationController;
  late TextEditingController _languageController;
  late TextEditingController _followersController;
  late TextEditingController _repositoriesController;

  @override
  void initState() {
    super.initState();

    _locationController =
        TextEditingController(text: widget.querySearchDto.location);

    _languageController =
        TextEditingController(text: widget.querySearchDto.language);

    _followersController = TextEditingController(
      text: widget.querySearchDto.followers,
    );

    _repositoriesController =
        TextEditingController(text: widget.querySearchDto.repositories);
  }

  @override
  void dispose() {
    _locationController.dispose();
    _languageController.dispose();
    _followersController.dispose();
    _repositoriesController.dispose();
    super.dispose();
  }

  void _applyFilters(BuildContext context) {
    Navigator.pop(context);

    widget.onPressed(QuerySearchDto(
        followers: _followersController.text,
        repositories: _repositoriesController.text,
        language: _languageController.text,
        location: _locationController.text));
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Builder(builder: (context) {
        final isKeyboardVisible =
            KeyboardVisibilityProvider.isKeyboardVisible(context);

        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 550),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filtro', style: Theme.of(context).textTheme.bodyLarge),
                const Padding(
                    padding: EdgeInsets.only(top: 12.0), child: DividerLine()),
                Expanded(
                    child: ListView(
                  children: [
                    FilterInput(
                        filterController: _locationController,
                        icon: Icons.location_on_outlined,
                        label: 'Location'),
                    FilterInput(
                        filterController: _languageController,
                        icon: Icons.code,
                        label: 'Language'),
                    FilterInput(
                      filterController: _followersController,
                      icon: Icons.group_outlined,
                      label: 'Followers',
                      inputType: TextInputType.number,
                    ),
                    FilterInput(
                        filterController: _repositoriesController,
                        icon: Icons.folder_copy_outlined,
                        label: 'Repositories',
                        inputType: TextInputType.number),
                    Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: isKeyboardVisible ? 260 : 20),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => _applyFilters(context),
                            child: const Text(
                              'Aplicar Filtro',
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}

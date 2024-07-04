import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/divider_line.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_input.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
    required this.onPressed,
  });

  final Function onPressed;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? location;
  String? language;
  int? followers;
  int? repositories;

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
                        onChangeText: (text) {
                          if (text != null) {
                            setState(() => location = text);
                          }
                        },
                        icon: Icons.location_on_outlined,
                        label: 'Localização'),
                    FilterInput(
                        onChangeText: (text) {
                          if (text != null) {
                            setState(() => language = text);
                          }
                        },
                        icon: Icons.code,
                        label: 'Linguagem de programação'),
                    FilterInput(
                      onChangeText: (text) {
                        if (text != null) {
                          setState(() => followers = int.parse(text));
                        }
                      },
                      icon: Icons.group_outlined,
                      label: 'Número de Seguidores',
                      inputType: TextInputType.number,
                    ),
                    FilterInput(
                        onChangeText: (text) {
                          if (text != null) {
                            setState(() => repositories = int.parse(text));
                          }
                        },
                        icon: Icons.folder_copy_outlined,
                        label: 'Número de Repositórios',
                        inputType: TextInputType.number),
                    Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: isKeyboardVisible ? 260 : 20),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              widget.onPressed(QuerySearchDto(
                                  followers: followers,
                                  repositories: repositories,
                                  language: language,
                                  location: location));
                            },
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

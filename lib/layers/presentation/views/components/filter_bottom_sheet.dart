import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_input.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

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
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    height: 1.5,
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    const FilterInput(
                        icon: Icons.location_on_outlined, label: 'Localização'),
                    const FilterInput(
                        icon: Icons.code, label: 'Linguagem de programação'),
                    const FilterInput(
                      icon: Icons.group_outlined,
                      label: 'Número de Seguidores',
                      inputType: TextInputType.number,
                    ),
                    const FilterInput(
                        icon: Icons.location_on_outlined,
                        label: 'Número de Repositórios',
                        inputType: TextInputType.number),
                    Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: isKeyboardVisible ? 260 : 20),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
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

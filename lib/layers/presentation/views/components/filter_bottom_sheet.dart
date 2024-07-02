import 'package:flutter/material.dart';
import 'package:git_users_app/layers/presentation/views/components/filter_input.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filtro', style: Theme.of(context).textTheme.bodyLarge),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 25),
            child: Container(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              height: 1.5,
            ),
          ),
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
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Aplicar Filtro',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}

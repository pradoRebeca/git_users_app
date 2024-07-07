import 'package:flutter/material.dart';
import 'package:git_users_app/layers/domain/models/dtos/search_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/chip_filter.dart';

class FilterChipCard extends StatelessWidget {
  const FilterChipCard(
      {super.key, required this.querySearchDto, required this.onClear});

  final QuerySearchDto querySearchDto;
  final Function onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            if (querySearchDto.location != null &&
                querySearchDto.location!.isNotEmpty)
              ChipFilter(
                icon: Icons.location_on_outlined,
                label: querySearchDto.location!,
                onClear: () => onClear(QuerySearchDto(location: '')),
              ),
            if (querySearchDto.language != null &&
                querySearchDto.language!.isNotEmpty)
              ChipFilter(
                  icon: Icons.code,
                  label: querySearchDto.language!,
                  onClear: () => onClear(QuerySearchDto(language: ''))),
            if (querySearchDto.repositories != null &&
                querySearchDto.repositories!.isNotEmpty)
              ChipFilter(
                  icon: Icons.folder_copy_outlined,
                  label: querySearchDto.repositories!,
                  onClear: () => onClear(QuerySearchDto(repositories: ''))),
            if (querySearchDto.followers != null &&
                querySearchDto.followers!.isNotEmpty)
              ChipFilter(
                  icon: Icons.groups_outlined,
                  label: querySearchDto.followers!,
                  onClear: () => onClear(QuerySearchDto(followers: ''))),
          ],
        ),
      ),
    );
  }
}

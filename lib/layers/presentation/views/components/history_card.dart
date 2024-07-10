import 'package:flutter/material.dart';
import 'package:git_users_app/layers/domain/models/dtos/history_dto.dart';
import 'package:git_users_app/layers/shared/utils/datetime_formatter.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key, required this.historyDto, required this.onClick});

  final HistoryDto historyDto;
  final void Function(HistoryDto historyDto) onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(historyDto),
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              Icons.history,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        historyDto.history,
                      ),
                    ),
                    Text(
                        DatetimeFormatter.formattedDateTime(
                            historyDto.dateTime),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer))
                  ],
                ),
              ),
            ),
            Icon(
              Icons.north_west_rounded,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:git_users_app/layers/domain/models/dtos/user_dto.dart';
import 'package:git_users_app/layers/presentation/views/components/image_profile_card.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.user});

  final UserDto user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(minHeight: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 1)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ImageProfileCard(
                    urlImage: user.avatarUrl,
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (user.name != null && user.name!.isNotEmpty)
                        Text(
                          user.name!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      Text(
                        user.userLogin,
                        style: Theme.of(context).textTheme.bodyMedium?.merge(
                            TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (user.resume != null && user.resume!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(user.resume!,
                    maxLines: 3, overflow: TextOverflow.ellipsis),
              ),
            Wrap(
              direction: Axis.horizontal,
              // spacing: 18,
              children: [
                if (user.location != null && user.location!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 18),
                    child: Text(
                      user.location!,
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                if (user.repositories != null && user.repositories!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 18),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.folder_copy,
                            size: 15,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                        Text(
                          user.repositories!,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        )
                      ],
                    ),
                  ),
                if (user.followers != null && user.followers!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.group,
                            size: 15,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                        Text(
                          user.followers!,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        )
                      ],
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
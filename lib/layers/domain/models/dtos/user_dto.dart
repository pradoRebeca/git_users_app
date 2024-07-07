class UserDto {
  UserDto({required this.login, required this.avatarUrl});

  final String login;
  final String avatarUrl;

  factory UserDto.fromMap(Map map) => UserDto(
        login: map['login'],
        avatarUrl: map['avatar_url'],
      );
}

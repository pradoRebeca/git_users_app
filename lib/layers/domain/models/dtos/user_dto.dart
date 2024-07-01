class UserDto {
  final String? name;
  final String userLogin;
  final String? resume;
  final String avatarUrl;
  final String? location;
  final String? followers;
  final String? repositories;

  UserDto(
      {required this.name,
      required this.userLogin,
      required this.resume,
      required this.avatarUrl,
      required this.location,
      required this.followers,
      required this.repositories});

  factory UserDto.fromMap(Map map) => UserDto(
      name: map['name'],
      userLogin: map['login'],
      resume: map['bio'],
      avatarUrl: map['avatar_url'],
      location: map['location'],
      followers: map['followers'],
      repositories: map['public_repos']);
}

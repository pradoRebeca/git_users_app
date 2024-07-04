class UserDto {
  final String? name;
  final String userLogin;
  final String? resume;
  final String avatarUrl;
  final String? location;
  final String? followers;
  final String? repositories;

  UserDto(
      {this.name,
      required this.userLogin,
      this.resume,
      required this.avatarUrl,
      this.location,
      this.followers,
      this.repositories});

  factory UserDto.fromMap(Map map) => UserDto(
      name: map['name'],
      userLogin: map['login'],
      resume: map['bio'],
      avatarUrl: map['avatar_url'],
      location: map['location'],
      followers: map['followers']?.toString(),
      repositories: map['public_repos']?.toString());
}

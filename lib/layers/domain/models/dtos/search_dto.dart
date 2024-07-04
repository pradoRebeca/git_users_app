class SearchDto {
  SearchDto({
    required this.query,
    this.location,
    this.language,
    this.followers,
    this.repositories,
  });

  final String query;
  final String? location;
  final String? language;
  final int? followers;
  final int? repositories;
}

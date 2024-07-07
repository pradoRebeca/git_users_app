class QuerySearchDto {
  QuerySearchDto({
    this.query,
    this.location,
    this.language,
    this.followers,
    this.repositories,
  });

  String? query;
  String? location;
  String? language;
  String? followers;
  String? repositories;

  void setQuery(String? query) {}
}

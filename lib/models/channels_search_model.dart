class ChannelsSearch {
  String? id;
  String? slug;
  String? name;
  bool private;

  ChannelsSearch({
    this.id,
    this.slug,
    this.name,
    this.private = false
  });

  factory ChannelsSearch.fromJson(Map<String, dynamic> json) => ChannelsSearch(
        id: json["_id"],
        slug: json["slug"],
        name: json["name"],
        private: json["private"],
      );
}
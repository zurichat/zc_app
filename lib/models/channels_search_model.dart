class ChannelsSearch {
  String? id;
  String? slug;
  String? name;

  ChannelsSearch({
    this.id,
    this.slug,
    this.name,
  });

  factory ChannelsSearch.fromJson(Map<String, dynamic> json) => ChannelsSearch(
        id: json['_id'],
        slug: json['slug'],
        name: json['name'],
      );
}
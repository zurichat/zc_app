class ChannelsSearch {
  String? id;
  String? slug;
  String? name;
  int? membersCount;
  bool? isPublic;

  // String? private;

  ChannelsSearch(
      {this.id, this.slug, this.name, this.isPublic, this.membersCount
      // this.private
      });

  factory ChannelsSearch.fromJson(Map<String, dynamic> json) => ChannelsSearch(
      id: json["_id"],
      slug: json["slug"],
      name: json["name"],
      membersCount: json["members"],
      isPublic: !json["private"]);
}

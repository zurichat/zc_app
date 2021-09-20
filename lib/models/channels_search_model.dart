// To parse this JSON data, do
//
//     final channelsSearch = channelsSearchFromJson(jsonString);

import 'dart:convert';

ChannelsSearch channelsSearchFromJson(String str) =>
    ChannelsSearch.fromJson(json.decode(str));

class ChannelsSearch {
  String? id;
  String? name;
  String? description;

  ChannelsSearch({
    this.id,
    this.name,
    this.description,
  });

  factory ChannelsSearch.fromJson(Map<String, dynamic> json) => ChannelsSearch(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
      );
}

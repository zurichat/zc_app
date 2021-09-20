import 'dart:convert';

class ChannelModel {
  String id;
  String name;
  // bool archived;
  // bool private;
  ChannelModel({
    required this.id,
    //required this.archived,
    required this.name,
    //required this.private
  });




  factory ChannelModel.fromJson(Map<String, dynamic>json){
    return ChannelModel( id: json['_id'],
      name: json['name']);
     // archived: json['archived'],
      //private:json['private'] );
  }

}
 
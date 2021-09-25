import 'dart:convert';

class ChannelMembermodel {
  String name;
  bool isAdmin;
  // bool archived;
  // bool private;
  ChannelMembermodel({
    required this.name,
    required this.isAdmin,
  });




  factory ChannelMembermodel.fromJson(Map<String, dynamic>json){
    return ChannelMembermodel( name: json['_id'],
      isAdmin: json['is_admin']);
     // archived: json['archived'],
      //private:json['private'] );
  }

}
 
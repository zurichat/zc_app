class ChannelMember {
  String name;
  bool isAdmin;
  ChannelMember({
    required this.name,
    required this.isAdmin,
  });

  factory ChannelMember.fromJson(Map<String, dynamic> json) {
    return ChannelMember(name: json['_id'], isAdmin: json['is_admin']);
    // archived: json['archived'],
    //private:json['private'] );
  }
}

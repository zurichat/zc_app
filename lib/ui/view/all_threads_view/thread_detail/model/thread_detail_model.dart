class ThreadDetailModel{
  String userName;
  String threadTitle;
  String userImageUrl;
  String date;
  String message;

  ThreadDetailModel({
    required this.userName,
    required this.threadTitle,
    required this.userImageUrl,
    required this.date,
    required this.message
  });

  Map<String, dynamic> toMap(){
    return {
      'userName':userName,
      'threadTitle':threadTitle,
      'userImageUrl': userImageUrl,
      'date':date,
      'message':message
    };
    }
    ThreadDetailModel fromMap(Map<String, dynamic> map){
      return ThreadDetailModel(
        userName: map['userName'],
        threadTitle: map['thread'],
        userImageUrl: map['userImageUrl'],
        date: map['date'],
        message: map['message']

      );
    }
  
}
class SearchResultModel {
  final String? id, channelId, content, timestamp, userId;
  bool hasFiles;

  SearchResultModel({
    required this.id,
    required this.channelId,
    required this.content,
    required this.timestamp,
    required this.userId,
    required this.hasFiles,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      id: json['_id'] ?? json['id'],
      channelId: json['channel_id'],
      content: json['content'],
      timestamp: json['timestamp'],
      userId: json['user_id'],
      hasFiles: json['has_files'],
    );
  }

  String toString() {
    return '_id: $id, file/message: $content, channel: $channelId, time/date: $timestamp, user: $userId, has files: $hasFiles';
  }
}

class SearchResultsList {
  final List<SearchResultModel> results;

  SearchResultsList({required this.results});

  // parse JSONArray of results into a {@Link List} of {@link JoinedChannelSearchModel} result items
  factory SearchResultsList.fromJson(Map<String, dynamic> json, {results}) {
    return SearchResultsList(
      results: List<SearchResultModel>.from(
        json['result'].map((result) => SearchResultModel.fromJson(result)),
      ),
    );
  }
}

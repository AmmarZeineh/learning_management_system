class VideoModel {
  final int id;
  final String url;

  VideoModel({required this.id, required this.url});
  factory VideoModel.fromJson(jsondata) {
    return VideoModel(url: jsondata['video'], id: jsondata['id']);
  }
}

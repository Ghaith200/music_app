class MusicModel {
  final String musicId;
  final String musicTitle;
  final String musicAuthor;
  final String musicThumbnail;
  MusicModel({
    required this.musicId,
    required this.musicTitle,
    required this.musicAuthor,
    required this.musicThumbnail,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      musicId: json['videoId'],
      musicTitle: json['title'],
      musicAuthor: json['author'],
      musicThumbnail: json['thumbnail'],
    );
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      musicId: map['musicId'],
      musicTitle: map['musicTitle'],
      musicAuthor: map['musicAuthor'],
      musicThumbnail: map['musicThumbnail'],
    );
  }
}

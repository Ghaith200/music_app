class NewReleaseModel {
  String title;
  String subtitle;
  String thumbnail;
  String browseId;
  String playlistId;

  NewReleaseModel(
      {required this.title,
      required this.subtitle,
      required this.thumbnail,
      required this.browseId,
      required this.playlistId});

  factory NewReleaseModel.fromJson(Map<String, dynamic> json) {
    return NewReleaseModel(
        title: 'title',
        subtitle: 'subtitle',
        thumbnail: 'thumbnail',
        browseId: 'browseId',
        playlistId: 'playlistId');
  }
}

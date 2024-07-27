class ImageLinks {
  String? smallThumbnail;
  String thumbnail; // Making thumbnail non-nullable
  ImageLinks({
    this.smallThumbnail,
    required this.thumbnail, // Required parameter
  });

  factory ImageLinks.fromJson(dynamic json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'] ?? '', // Using empty string as default if null
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smallThumbnail'] = this.smallThumbnail;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

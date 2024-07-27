/// textSnippet : "Updated with the latest version of Python, the new Third Edition offers a thorough overview of multiple applied areas, including image processing, cryptography, astronomy, the Internet, and bioinformatics."

class SearchInfo {
  SearchInfo({
      this.textSnippet,});

  SearchInfo.fromJson(dynamic json) {
    textSnippet = json['textSnippet'];
  }
  String? textSnippet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textSnippet'] = textSnippet;
    return map;
  }

}
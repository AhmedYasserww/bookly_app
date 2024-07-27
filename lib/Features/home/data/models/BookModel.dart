import 'VolumeInfo.dart';
import 'SaleInfo.dart';
import 'AccessInfo.dart';
import 'SearchInfo.dart';

class BookModel {
  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo, // تم جعله غير قابل للتأخير
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory BookModel.fromJson(dynamic json) {
    return BookModel(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']), // تم استخدام VolumeInfo.fromJson مباشرة هنا
      saleInfo: json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null,
      accessInfo: json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null,
      searchInfo: json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null,
    );
  }

  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo volumeInfo; // تم جعله غير قابل للتأخير
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    map['volumeInfo'] = volumeInfo.toJson(); // تم استخدام volumeInfo.toJson()
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo!.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo!.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo!.toJson();
    }
    return map;
  }
}

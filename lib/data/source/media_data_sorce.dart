import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class IMediaRepository {
  Future<List<MediaEntity>> getall();
}

final mediaRepo = MediaRepository(dataSource: MediaDataRemote());

class MediaRepository extends IMediaRepository {
  final IMediaDataSource dataSource;

  MediaRepository({required this.dataSource});
  @override
  Future<List<MediaEntity>> getall() {
    return dataSource.getall();
  }
}

/////
abstract class IMediaDataSource {
  Future<List<MediaEntity>> getall();
}

class MediaDataRemote extends IMediaDataSource {
  final Dio httpClient = Dio();

  @override
  Future<List<MediaEntity>> getall() async {
    final response = await httpClient.get(
        'http://127.0.0.1:8000/wordpress/index.php?rest_route=/wp/v2/media');
    final List<MediaEntity> media = [];
    (response.data as List).forEach((element) {
      media.add(MediaEntity.fromJson(element));
    });

    var s = media.where((element) => element.mimType == 'audio/mpeg').toList();

    debugPrint(s.toString());
    return media;
  }
}

class MediaEntity {
  final int id;
  final String sourcUrl;
  final String mimType;

  MediaEntity(this.mimType, {required this.id, required this.sourcUrl});
  MediaEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sourcUrl = json['source_url'],
        mimType = json['mime_type'];
}

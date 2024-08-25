import '../../domain/entities/meme.dart';

class MemeModel {
  final String id;
  final String name;
  final String url;

  MemeModel({
    required this.id,
    required this.name,
    required this.url,
  });

  factory MemeModel.fromJson(Map<String, dynamic> json) {
    return MemeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  Meme toEntity() {
    return Meme(
      id: id,
      name: name,
      url: url,
    );
  }
}

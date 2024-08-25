import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/memes_model.dart';

abstract class MemeRemoteDataSource {
  Future<List<MemeModel>> getMemes();
}

class MemeRemoteDataSourceImpl implements MemeRemoteDataSource {
  final http.Client client;

  MemeRemoteDataSourceImpl(this.client);

  @override
  Future<List<MemeModel>> getMemes() async {
    final response =
        await client.get(Uri.parse('https://api.imgflip.com/get_memes'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body) as Map<String, dynamic>;
      final memes = (decoded['data']['memes'] as List)
          .map((meme) => MemeModel.fromJson(meme))
          .toList();
      return memes;
    } else {
      throw Exception('Failed to load memes');
    }
  }
}

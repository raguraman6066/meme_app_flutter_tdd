import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'data/datasources/meme_remote_data_source.dart';
import 'data/repositories/meme_repository_impl.dart';
import 'domain/usecases/fetch_memes.dart';
import 'presentation/controller/meme_controller.dart';
import 'presentation/pages/meme_page.dart';

void main() {
  final memeRepository = MemeRepositoryImpl(
    remoteDataSource: MemeRemoteDataSourceImpl(http.Client()),
  );
  Get.put(MemeController(FetchMemes(memeRepository)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MemePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/meme_controller.dart';
import '../widgets/meme_list.dart';

class MemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MemeController memeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Memes'),
      ),
      body: Obx(() {
        if (memeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (memeController.errorMessage.value.isNotEmpty) {
          return Center(child: Text(memeController.errorMessage.value));
        } else {
          return MemeList(memes: memeController.memes);
        }
      }),
    );
  }
}

import 'package:get/get.dart';
import '../../domain/usecases/fetch_memes.dart';
import '../../domain/entities/meme.dart';

class MemeController extends GetxController {
  final FetchMemes fetchMemes;
  MemeController(this.fetchMemes);

  var memes = <Meme>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadMemes();
  }

  Future<void> _loadMemes() async {
    try {
      isLoading.value = true;
      final fetchedMemes = await fetchMemes.execute();
      memes.assignAll(fetchedMemes);
    } catch (e) {
      errorMessage.value = 'Failed to load memes';
    } finally {
      isLoading.value = false;
    }
  }
}

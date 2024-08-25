import '../repositories/meme_repository.dart';
import '../entities/meme.dart';

class FetchMemes {
  final MemeRepository repository;

  FetchMemes(this.repository);

  Future<List<Meme>> execute() async {
    return await repository.fetchMemes();
  }
}

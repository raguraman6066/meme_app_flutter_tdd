// lib/features/meme/data/repositories/meme_repository_impl.dart
import '../../domain/entities/meme.dart';
import '../../domain/repositories/meme_repository.dart';
import '../datasources/meme_remote_data_source.dart';

class MemeRepositoryImpl implements MemeRepository {
  final MemeRemoteDataSource remoteDataSource;

  MemeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Meme>> fetchMemes() async {
    final memeModels = await remoteDataSource.getMemes();
    return memeModels.map((model) => model.toEntity()).toList();
  }
}

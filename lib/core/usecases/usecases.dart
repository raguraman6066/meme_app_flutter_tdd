import 'package:dartz/dartz.dart';
import 'package:meme_app/core/error/failure.dart';

abstract class Usecases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

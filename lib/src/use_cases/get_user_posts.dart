import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/utils/failure.dart';
import 'package:flutter_project/core/utils/use_case.dart';
import 'package:flutter_project/core/constants/pagination.dart';
import 'package:flutter_project/src/entities/post.dart';
import 'package:flutter_project/src/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserPosts extends UseCase<List<Post>, Params> {
  final UserRepository repository;

  GetUserPosts({required this.repository});

  @override
  Future<Either<Failure, List<Post>>> call(Params params) async {
    return repository.getUserPosts(
      id: params.id,
      pages: params.pages,
      limit: params.limit,
    );
  }
}

class Params {
  final String id;
  final int pages;
  final int limit;

  const Params({
    required this.id,
    required this.pages,
    this.limit = Pagination.limit,
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/utils/failure.dart';
import 'package:flutter_project/core/config/general_config.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:flutter_project/src/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUsers {
  final UserRepository repository;

  GetUsers({required this.repository});

  Future<Either<Failure, List<User>>> call({
    required int page,
    int limit = PaginationConfig.limit,
  }) async {
    final result = await repository.getUsers(page: page, limit: limit);
    return result.fold(
      (failure) => Left(failure),
      (users) {
        if (users.isEmpty) {
          return const Left(UnexpectedFailure(
            code: 'NO_DATA_ERROR',
            message: 'No more data available',
          ));
        } else {
          return Right(users);
        }
      },
    );
  }
}

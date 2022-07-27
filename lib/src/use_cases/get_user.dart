import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/utils/failure.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:flutter_project/src/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});

  Future<Either<Failure, User>> call({required String id}) async {
    return repository.getUser(id: id);
  }
}

import 'package:hw_flutter/lesson_22/error_handling_homework/data/repository/entity/user_entity.dart';

class FakeUserRepository {
  Future<UserEntity> getUserProfile(bool shouldFail) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (shouldFail) {
        throw Exception('Server is temporarily unavailable');
      }
      return UserEntity(id: '1', name: 'Test User');
    } catch (e) {
      throw CustomServerError('Сервер тимчасово недоступний');
    }
  }
}

class CustomServerError implements Exception {
  CustomServerError(this.message);

  final String message;

  @override
  String toString() => message;
}

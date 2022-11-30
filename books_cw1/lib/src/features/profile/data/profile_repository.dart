import 'package:books_cw1/src/features/auth/data/auth_repository.dart';
import 'package:books_cw1/src/shared/api_source.dart';
import 'package:books_cw1/src/shared/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileRepository {
  ProfileRepository({
    required BooksApiSource api,
  }) : _api = api;

  BooksApiSource _api;

  Future<String> getProfile() async {
    var res = await _api.get('/profile');
    return res.data.toString();
  }
  
}


final profileRepositoryProvider = Provider((ref) {
  return ProfileRepository(
    api: ref.watch(booksApiSourceProvider)
  );
});
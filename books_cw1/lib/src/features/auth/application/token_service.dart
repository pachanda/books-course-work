import 'package:books_cw1/src/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: не знаю, плюс это или минус (наверное, и так и так правильно. Просто разный подход) но теперь мне не нужно создавать стрим, и, соответственно, стрим провайдер, или же FutureProvider для того чтобы пихать туда токен. 
class CurrentToken {
  CurrentToken(AuthRepository authRepo) : _authRepo = authRepo;

  AuthRepository _authRepo;

  Future<String> call() {
    return _authRepo.getAuthToken();
  }
}

final currentTokenProvider = Provider((ref) {
  AuthRepository authRepo = ref.watch(authRepostitoryProvider);
  return CurrentToken(authRepo);
});
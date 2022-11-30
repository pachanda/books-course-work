import 'package:books_cw1/src/constants/constants.dart';
import 'package:books_cw1/src/features/auth/data/auth_repository.dart';
import 'package:books_cw1/src/features/auth/presentation/auth_screen.dart';
import 'package:books_cw1/src/features/profile/presentation/edit/edit_profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/profile/presentation/profile/profile_screen.dart';
import '../shared/top_level_screen.dart';
import 'go_router_refresh_stream.dart';

final routerProvider = Provider((ref) {
  var authRepo = ref.watch(authRepostitoryProvider);
  return GoRouter(
    initialLocation: '/profile',
    refreshListenable: GoRouterRefreshStream(authRepo.authStateChanges()),
    redirect: (context, state) {
      final isLoggedIn = authRepo.currentUser != null;
      print("redirect| location=${state.location}, isLoggedIn=$isLoggedIn");
      if (isLoggedIn && state.location == '/auth') {
        // return '/home'; 
        return '/profile'; 
      } else if (!isLoggedIn && state.location != '/auth') {
        return '/auth';
      } else if (state.location == '/') {
        return '/profile';
      }
      return null;
    },
    routes: [
      // GoRoute(
      //   path: '/home',
      //   name: 'home',
      // ),
      // GoRoute(
      //   path: '/books',
      //   name: 'books',
      // ),
      // GoRoute(
      //   path: '/authors',
      //   name: 'authors',
      // ),
      // GoRoute(
      //   path: '/posts',
      //   name: 'posts',
      // ),
      GoRoute(
        path: '/',
        name: 'top',
        builder: (context, state) => const TopLevelScreen()
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => AuthScreen()
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
        routes: [
          GoRoute(
            path: Screen.editProfile.name,
            name: Screen.editProfile.name,
            builder: (context, state) => const EditProfileScreen(),
          )
        ]
      ),
    ]
  );
});
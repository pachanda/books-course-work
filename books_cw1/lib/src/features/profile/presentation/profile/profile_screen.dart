import 'package:books_cw1/src/features/auth/data/auth_repository.dart';
import 'package:books_cw1/src/features/profile/data/profile_repository.dart';
import 'package:books_cw1/src/shared/hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/constants.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("PROFILE SCREEN")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print("muha");
              context.pushNamed(Screen.editProfile.name);
              print("muha3");
            },
            child: Text("EDIT PROFILE")
          )
        ]
      )
    );
  }
}
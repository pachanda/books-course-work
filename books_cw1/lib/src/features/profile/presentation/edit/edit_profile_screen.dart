import 'package:books_cw1/src/features/auth/data/auth_repository.dart';
import 'package:books_cw1/src/shared/hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("EDIT PROFILE".hardcoded)),
      body: ListView(
        children: [
          ElevatedButton(
            child: Text("Sign Out".hardcoded),
            onPressed: () {
              // TODO: возможно, этой странице тоже понадобится контроллер, и тогда нужно перенести это туда. 
              ref.read(authRepostitoryProvider).singOut();
            }
          )
        ]
      )
    );
  }
}
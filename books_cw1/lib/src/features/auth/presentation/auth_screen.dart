import 'package:books_cw1/src/features/auth/data/auth_repository.dart';
import 'package:books_cw1/src/shared/hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({super.key});
  
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("AUTH SCREEN".hardcoded)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'email'.hardcoded,
              ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'password'.hardcoded
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  child: Text("Sign in".hardcoded),
                  onPressed: () {
                    // TODO: заменить это на вызов метода контроллера (там нужен контроллер - там нужно состояние - там будет еще и регистрация)
                    ref.read(authRepostitoryProvider)
                      .singInWithEmailAndPassword(email.text, password.text);
                  }
                ),
                ElevatedButton(
                  child: Text("Demo Sign in"),
                  onPressed: () {
                    ref.read(authRepostitoryProvider)
                      .singInWithEmailAndPassword("aaa@gmail.com", "123456");
                  }
                )
              ]
            )
          ]
        ),
      )
    );
  }
}
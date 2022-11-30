import 'package:books_cw1/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter router = ref.read(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
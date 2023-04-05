import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/route.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(kRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

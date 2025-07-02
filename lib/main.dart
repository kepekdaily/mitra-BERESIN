import 'package:flutter/material.dart';
import 'routes.dart'; // harus mengandung route '/' ke AuthScreen

void main() {
  runApp(const BeresinApp());
}

class BeresinApp extends StatelessWidget {
  const BeresinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beresin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/', // ⬅️ masuk ke AuthScreen dulu
      routes: appRoutes, // ⬅️ didefinisikan di routes.dart
    );
  }
}

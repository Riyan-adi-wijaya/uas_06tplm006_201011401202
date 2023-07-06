import 'package:uas_06tplm006_201011401202/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/cuaca_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CuacaProvider>(
          create: (_) => CuacaProvider(),
        ),
        // Other providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 25,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

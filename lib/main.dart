import 'package:flutter/material.dart';
import 'package:flutter_team_shoppingmall/cart_page.dart';
import 'package:flutter_team_shoppingmall/cart_page_LLM.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CartPageLLM());
  }
}

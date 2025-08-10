import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cartprovider.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cartprovider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellowAccent,
            primary: Colors.yellowAccent,
            ),
            
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIconColor: Colors.black38
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
          ),
      
        ),
      
        debugShowCheckedModeBanner: false,
        home: HomePage(
          //product: products[0],
        ),
      ),
    );
  }
}

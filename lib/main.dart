import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:provider_mobx/src/home/page/home_page.dart';
import 'package:provider_mobx/src/store/counter/counter_store.dart';
import 'package:provider_mobx/src/store/theme/theme_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        Provider(create: (_)=>ThemeStore()),
        Provider(create: (_)=> CounterStore())
      ],
      child: Consumer<ThemeStore>(
        builder: (_,theme,__)=> Observer(
          builder:(_)=> MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: theme.isDark ? Brightness.dark : Brightness.light
            ),
            home: const HomePage(title: 'Flutter Demo Home Page'),
          ),
        ),
      ),
    );
  }
}


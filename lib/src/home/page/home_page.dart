import 'package:flutter/material.dart';
import 'package:provider_mobx/src/home/components/counter.dart';
import 'package:provider_mobx/src/shared/components/switch_theme_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          SwitchThemeApp(),
          Counter()
        ],
      ),
    );
  }
}

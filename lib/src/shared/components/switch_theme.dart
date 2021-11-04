import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:provider_mobx/src/store/theme/theme_store.dart';

class SwitchTheme extends StatefulWidget {
  const SwitchTheme({Key? key}) : super(key: key);

  @override
  _SwitchThemeState createState() => _SwitchThemeState();
}

class _SwitchThemeState extends State<SwitchTheme> {
  late ThemeStore themeStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //informa o tipo de provider
    themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SwitchListTile(
        title: Text('SwitchTheme Component'),
        value: themeStore.isDark,
        onChanged: themeStore.changeTheme,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:provider_mobx/src/store/theme/theme_store.dart';

class SwitchThemeApp extends StatefulWidget {
  const SwitchThemeApp({Key? key}) : super(key: key);

  @override
  _SwitchThemeAppState createState() => _SwitchThemeAppState();
}

class _SwitchThemeAppState extends State<SwitchThemeApp> {
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
        title: const Text('SwitchThemeApp Component'),
        value: themeStore.isDark,
        onChanged: themeStore.changeTheme,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/state/theme_mode_state.dart';
import 'package:pokemon/theme_mode_select.dart';

class SettingList extends HookConsumerWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeMode = ref.watch(themeModeProvider);

    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          onTap: () async {
            final selectTheme = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        ThemeModeSelect(mode: _themeMode.mode)));
            _themeMode.changeTheme(selectTheme);
          },
          trailing: Text((_themeMode.mode == ThemeMode.system)
              ? 'System'
              : (_themeMode.mode == ThemeMode.dark ? 'Dark' : 'Light')),
        )
      ],
    );
  }
}

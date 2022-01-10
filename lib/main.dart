import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/poke_list.dart';
import 'package:pokemon/setting_list.dart';
import 'package:pokemon/state/theme_mode_state.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const TopPage(),
      themeMode: _themeMode.mode,
      color: Colors.blue,
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentbnb = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => {setState(() => currentbnb = index)},
          currentIndex: currentbnb,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ],
        ),
        body: SafeArea(
          child: currentbnb == 0 ? const PokeList() : const SettingList(),
        ));
  }
}

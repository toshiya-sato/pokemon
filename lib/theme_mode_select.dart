import 'package:flutter/material.dart';

class ThemeModeSelect extends StatefulWidget {
  final ThemeMode mode;
  const ThemeModeSelect({Key? key, required this.mode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThemeModeSelectState();
}

class _ThemeModeSelectState extends State<ThemeModeSelect> {
  late ThemeMode _current;

  @override
  void initState() {
    super.initState();
    _current = widget.mode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Select Theme Mode.'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop<ThemeMode>(context, _current),
            ),
          ),
          RadioListTile<ThemeMode>(
              title: const Text('System'),
              value: ThemeMode.system,
              groupValue: _current,
              onChanged: (val) => _changeState(val)),
          RadioListTile<ThemeMode>(
              title: const Text('Light'),
              value: ThemeMode.light,
              groupValue: _current,
              onChanged: (val) => _changeState(val)),
          RadioListTile<ThemeMode>(
              title: const Text('Dark'),
              value: ThemeMode.dark,
              groupValue: _current,
              onChanged: (val) => _changeState(val)),
        ],
      ),
    );
  }

  void _changeState(ThemeMode? _selectTheme) {
    setState(() {
      _current = _selectTheme!;
    });
  }
}

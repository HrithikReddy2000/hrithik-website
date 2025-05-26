import 'package:flutter/material.dart';
import 'package:hrithikport/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeMode themeModeFromString(String mode) {
  switch (mode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

String themeModeToString(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return 'light';
    case ThemeMode.dark:
      return 'dark';
    default:
      return 'system';
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final savedTheme = prefs.getString('themeMode') ?? 'system';

  runApp(MyApp(initialTheme: themeModeFromString(savedTheme)));
}

class MyApp extends StatefulWidget {
  final ThemeMode initialTheme;
  const MyApp({super.key, required this.initialTheme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.initialTheme;
  }

  void _toggleTheme() async {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', themeModeToString(_themeMode));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sai Hrithik Reddy Movva Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: _themeMode,
      home: HomePage(onThemeToggle: _toggleTheme, themeMode: _themeMode),
    );
  }
}

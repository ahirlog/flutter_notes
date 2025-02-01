import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/provider/counter_provider.dart';
import 'package:flutter_notes/counterExample/provider/increment_decrement_provider.dart';
import 'package:flutter_notes/counterExample/provider/likeable_list_provider.dart';
import 'package:flutter_notes/counterExample/provider/theme_provider.dart';
import 'package:flutter_notes/counterExample/provider/timer_provider.dart';
import 'package:flutter_notes/counterExample/screens/theme_screen.dart';
import 'package:flutter_notes/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // For Single provider use this
    // return ChangeNotifierProvider(
    //   create: (_) => CounterProvider(),
    //   child: const MaterialApp(
    //     title: 'Flutter Notes',
    //     home: HomeScreen(),
    //   ),
    // );
    // For Multi provider use this
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => LikeableListProvider()),
        ChangeNotifierProvider(create: (_) => IncrementDecrementProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Notes',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
          ),
          home:
          // const ThemeScreen(),
          const HomeScreen(),
        );
      }),
    );
  }
}

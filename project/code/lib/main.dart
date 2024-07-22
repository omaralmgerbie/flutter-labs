import 'package:code/auth/api_service.dart';
import 'package:code/hooks/theme.dart';
import 'package:code/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: GlobalThemeData.themeModeNotifier,
        builder: (context, ThemeMode themeMode, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Project',
            theme: GlobalThemeData.lightThemeData,
            darkTheme: GlobalThemeData.darkThemeData,
            themeMode: themeMode,
            initialRoute: '/login',
            onGenerateRoute: (settings) => generateRoute(settings),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/vttx_main_screen.dart';
import 'theme/theme.dart';
import 'providers/theme_provider.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'VTTX Chat',
            theme: lightTheme.copyWith(
              colorScheme: lightColorScheme.copyWith(
                primary: themeProvider.primaryColor,
              ),
              primaryColor: themeProvider.primaryColor,
            ),
            darkTheme: darkTheme.copyWith(
              colorScheme: darkColorScheme.copyWith(
                primary: themeProvider.primaryColor,
              ),
              primaryColor: themeProvider.primaryColor,
            ),
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: const VTTXMainScreen(),
          );
        },
      ),
    );
  }
}
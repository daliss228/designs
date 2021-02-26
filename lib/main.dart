import 'package:disenios1/src/pages/launcher.dart';
import 'package:disenios1/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    //guardar numero en las preferencias del usuario
    create: (_) => ThemeChanger(1),
    child: MyApp(),
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Disenios App',
      home: LauncherPage()
    );
  }
}
import 'package:flutter/material.dart';
import 'package:i_seneca/providers/data_provider.dart';
import 'package:provider/provider.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ProveedorDatos(), lazy: true,)
        ],
        child: const MyApp(),
      );
    
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      //onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lightTheme,
      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movie_app/app_router.dart';
import 'package:movie_app/app/di.dart';
import 'package:movie_app/app_router.dart';
import 'design_system/app_colors.dart';
import 'design_system/app_text.dart';

void main() async{
  setupServiceLocator();
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: AppColorsTheme.light().primary,
          secondary: AppColorsTheme.light().secondary,
          background: AppColorsTheme.light().background,
          error: AppColorsTheme.light().error,
        ),
        extensions: [
          AppColorsTheme.light(),
          AppTextsTheme.main(),
        ],
      ),
    );
  }
}
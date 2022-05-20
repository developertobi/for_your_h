import 'package:flutter/material.dart';
import 'package:for_your_head/src/core/constants/strings.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/features/views/add_deck_view.dart';
import 'package:for_your_head/src/features/views/game_rounds_view.dart';
import 'package:for_your_head/src/features/views/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
      ),
      // home: const HomeView(),
      home: const AddDeckView(),
    );
  }
}

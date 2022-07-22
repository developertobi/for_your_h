import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_your_head/src/core/constant/strings.dart';
import 'package:for_your_head/src/core/routes.dart';
import 'package:for_your_head/src/features/views/home_view.dart';
import 'package:for_your_head/src/services/navigation_service.dart';
import 'package:google_fonts/google_fonts.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: AppStrings.appName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
      ),
      home: const HomeView(),
      navigatorKey: ref.read(navigationServiceProvider).navigatorKey,
    );
  }
}

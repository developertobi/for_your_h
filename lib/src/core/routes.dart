import 'package:flutter/material.dart';
import 'package:for_your_head/src/features/models/result_arg.dart';

import '../features/views/final_scoreboard_view.dart';
import '../features/views/game_view.dart';
import '../features/views/home_view.dart';
import '../features/views/round_scores_view.dart';

class Routes {
  static const home = '/home';
  static const roundScore = '/round-score';
  static const finalScoreboard = '/final-scoreboard';
  static const play = '/play';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case roundScore:
        ResultArg args = settings.arguments as ResultArg;
        return MaterialPageRoute(builder: (_) => RoundScoreView(args: args));
      case finalScoreboard:
        return MaterialPageRoute(builder: (_) => const FinalScoreboardView());
      case play:
        List<String> words = settings.arguments as List<String>;
        return MaterialPageRoute(builder: (_) => GameView(words: words));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

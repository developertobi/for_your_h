import 'package:flutter/material.dart';
import 'package:for_your_head/src/features/views/creating_teams_view.dart';

import '../features/views/add_deck_view.dart';
import '../features/views/final_scoreboard_view.dart';
import '../features/views/game_rounds_view.dart';
import '../features/views/home_view.dart';
import '../features/views/round_scores_view.dart';
import '../features/views/selected_teams_confirmation_view.dart';
import '../features/views/team_details_view.dart';
import '../features/views/team_preview_view.dart';

class Routes {
  static const home = '/home';
  static const teamDetails = '/team-details';
  static const selectedTeamsDetails = '/selected-team-details';
  static const creatingTeams = '/creating-teams';
  static const addDeck = '/add-deck';
  static const gameRounds = '/game-rounds';
  static const teamPreview = '/team-preview';
  static const roundScore = '/round-score';
  static const finalScoreboard = '/final-scoreboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case teamDetails:
        return MaterialPageRoute(builder: (_) => const TeamDetailsView());
      case selectedTeamsDetails:
        return MaterialPageRoute(
            builder: (_) => const SelectedTeamsConfirmationView());
      case creatingTeams:
        return MaterialPageRoute(builder: (_) => const CreatingTeamsView());
      case addDeck:
        return MaterialPageRoute(builder: (_) => const AddDeckView());
      case gameRounds:
        return MaterialPageRoute(builder: (_) => const GameRoundsView());
      case teamPreview:
        return MaterialPageRoute(builder: (_) => const TeamPreviewView());
      case roundScore:
        return MaterialPageRoute(builder: (_) => const RoundScoreView());
      case finalScoreboard:
        return MaterialPageRoute(builder: (_) => const FinalScoreboardView());

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

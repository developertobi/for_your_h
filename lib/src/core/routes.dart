import 'package:flutter/material.dart';
import 'package:for_your_head/src/features/models/team_details_arg.dart';
import 'package:for_your_head/src/features/views/creating_teams_view.dart';

import '../features/models/selected_team_details_arg.dart';
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
        TeamDetailsArg args = settings.arguments as TeamDetailsArg;
        return MaterialPageRoute(
          builder: (_) => TeamDetailsView(
            args: args,
          ),
        );
      case selectedTeamsDetails:
        SelectedTeamDetailsArg args =
            settings.arguments as SelectedTeamDetailsArg;
        return MaterialPageRoute(
          builder: (_) => SelectedTeamsConfirmationView(
            args: args,
          ),
        );
      case creatingTeams:
        return MaterialPageRoute(builder: (_) => const CreatingTeamsView());
      case addDeck:
        int gameRounds = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => AddDeckView(
            gameRounds: gameRounds,
          ),
        );
      case gameRounds:
        int gameRounds = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => GameRoundsView(
            gameRounds: gameRounds,
          ),
        );
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

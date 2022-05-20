import 'package:flutter/material.dart';
import 'package:for_your_head/src/features/views/creating_teams_view.dart';

import '../features/views/add_deck_view.dart';
import '../features/views/game_rounds_view.dart';
import '../features/views/home_view.dart';
import '../features/views/selected_teams_confirmation_view.dart';
import '../features/views/team_details_view.dart';

class Routes {
  static const home = '/home';
  static const teamDetails = '/team-details';
  static const selectedTeamsDetails = '/selected-team-details';
  static const creatingTeams = '/creating-teams';
  static const addDeck = '/add-deck';
  static const gameRounds = '/game-rounds';

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

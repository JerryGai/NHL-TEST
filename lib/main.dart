import 'package:flutter/material.dart';
import 'package:nhl_2019_playoffs/screens/home_screen.dart';
import 'package:nhl_2019_playoffs/providers/matchup_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<int>(
          create: (context) => MatchupProvider().matchupItems(),
          initialData: 0,
        ),
        ChangeNotifierProvider<MatchupProvider>(
          create: (context) => MatchupProvider(),
        )
      ],
      child: MaterialApp(
        title: 'NHL 2019 Playoffs',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

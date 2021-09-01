import 'package:flutter/material.dart';
import 'package:nhl_2019_playoffs/constant.dart';
import 'package:nhl_2019_playoffs/models/matchup.dart';
import 'package:nhl_2019_playoffs/services/networking.dart';
import 'package:nhl_2019_playoffs/widgets/item_row.dart';

class MatchupProvider extends ChangeNotifier {
  //current round is 3
  int round = 4;
  int matchup = 1;

  List<MatchUp> _matchList = [];
  List<Widget> itemList = [];

  set roundNumber(int index) {
    round = index;
    matchupItems();
  }

  Future matchupResult() async {
    for (int i = 1; i < 8; i++) {
      var matchupResult = await NetWorking(
        Uri.parse('$nhl_api_address$round$matchup$i/boxscore'),
      ).getJsonData();
      print('$nhl_api_address$round$matchup$i/boxscore');

      if (matchupResult['officials'] != null) {
        if (matchupResult['teams']['away']['teamStats'] != null) {
          if (matchupResult['teams']['away']['teamStats']['teamSkaterStats'] !=
              null) {
            if (matchupResult['teams']['away']['teamStats']['teamSkaterStats']
                    ['hits'] !=
                0) {
              var _matchUp = MatchUp(
                matchupResult['teams']['away']['team']['id'].toString(),
                matchupResult['teams']['away']['team']['name'],
                matchupResult['teams']['away']['teamStats']['teamSkaterStats']
                    ['goals'],
                matchupResult['teams']['home']['team']['id'].toString(),
                matchupResult['teams']['home']['team']['name'],
                matchupResult['teams']['home']['teamStats']['teamSkaterStats']
                    ['goals'],
                i,
              );
              _matchList.add(_matchUp);
            }
          }
        }
      }
    }
  }

  Future<int> matchupItems() async {
    _matchList.clear();
    itemList.clear();
    switch (round) {
      case 1:
        for (int i = 1; i < 9; i++) {
          matchup = i;
          await matchupResult();
        }
        itemList.add(
          ItemRow(matchList: _matchList),
        );
        break;
      case 2:
        for (int i = 1; i < 5; i++) {
          matchup = i;
          await matchupResult();
        }
        itemList.add(
          ItemRow(matchList: _matchList),
        );
        break;
      case 3:
        for (int i = 1; i < 3; i++) {
          matchup = i;
          await matchupResult();
        }
        itemList.add(
          ItemRow(matchList: _matchList),
        );
        break;
      case 4:
        //matchup = 1;
        //await matchupResult();
        itemList.add(
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Round 4 is on the way...',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
        break;
      case 5:
        //matchup = 1;
        //await matchupResult();
        itemList.add(
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Round 5 is on the way...',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
        break;
      default:
    }
    notifyListeners();
    return 1;
  }

  get matchupList {
    return _matchList;
  }
}

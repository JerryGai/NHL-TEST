import 'package:flutter/material.dart';
import 'package:nhl_2019_playoffs/models/matchup.dart';
import 'package:nhl_2019_playoffs/models/team_icons.dart';

class ItemRow extends StatelessWidget {
  ItemRow({
    Key? key,
    required List<MatchUp> matchList,
  })  : _matchList = matchList,
        super(key: key);

  final List<MatchUp> _matchList;
  final TeamIcons _teamIcon = TeamIcons();

  @override
  Widget build(BuildContext context) {
    final _listLength = _matchList.length;
    Navigator.pop(context);
    return Column(
      children: [
        for (int i = 0; i < _listLength; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                _teamIcon.getIcon(_matchList[i].homeID),
                width: 30,
              ),
              SizedBox(
                width: 90,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: _matchList[i].homeName,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              Icon(Icons.sports_hockey),
              SizedBox(
                width: 90,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: _matchList[i].awayName,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              Image.asset(
                _teamIcon.getIcon(_matchList[i].awayID),
                width: 30,
              ),
              Text(
                _matchList[i].homeScore.toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
              Text(
                ':',
                //style: TextStyle(fontSize: 24),
              ),
              Text(
                _matchList[i].awayScore.toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ],
          ),
      ],
    );
  }
}

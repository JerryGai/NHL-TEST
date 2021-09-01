// Get the boxscore for an NHL game.
// How to use.
// add '2019030111/boxscore' parameters at the end of the address,
// 2019 for 2019-2020 season, 03 for playoffs, 01 for round 1, next digit 1 for 1st VS, the last 1 for game 1 in VS.
// Round 1 has 8 vs, round 2 has 4 vs, round 3 has 2 vs, round 4 has 1 vs.

const String nhl_api_address =
    'https://statsapi.web.nhl.com/api/v1/game/2019030';

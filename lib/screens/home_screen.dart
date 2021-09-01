import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nhl_2019_playoffs/providers/matchup_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _done = Provider.of<int>(context);
    final _provider = Provider.of<MatchupProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('NHL 2019 Playoffs'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 14, bottom: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'res/playstore.png',
                  width: 120,
                ),
                Container(
                  width: 220,
                  child: CarouselSlider(
                    items: [
                      for (int i = 1; i < 6; i++)
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          //padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          color: Colors.blueGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                'Round $i',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                    options: CarouselOptions(
                        initialPage: 3,
                        scrollDirection: Axis.vertical,
                        viewportFraction: 0.5,
                        aspectRatio: 2,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reson) {
                          _provider.roundNumber = index + 1;
                          if (index == 0 || index == 1 || index == 2) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) => Dialog(
                                child: Container(
                                  width: 350,
                                  height: 200,
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: CircularProgressIndicator(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text('Fetching data... please wait'),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('Next coming round is 4th. Scroll to view history scores'),
            SizedBox(
              height: 20,
            ),
            _done == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: CircularProgressIndicator(
                      color: Colors.blueGrey,
                    ),
                  )
                : Column(children: _provider.itemList),
          ],
        ),
      ),
    );
  }
}

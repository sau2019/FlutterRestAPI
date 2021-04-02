import 'package:FlutterRestAPI/model/matches.dart';
import 'package:FlutterRestAPI/services/matchservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListMatch extends StatefulWidget {
  @override
  _ListMatchState createState() => _ListMatchState();
}

class _ListMatchState extends State<ListMatch> {
  Future<MatchModel> _matchModel;
  MatchService _matchService = new MatchService();
  @override
  void initState() {
    _matchModel = _matchService.fetchMatch();
    super.initState();
  }

  var style = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
  var style1 = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
  );
  var style2 = TextStyle(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );
  var style3 = TextStyle(
    color: Colors.yellow,
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<MatchModel>(
        future: _matchModel,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.matches.length,
              itemBuilder: (BuildContext context, int index) {
                var matchlist = snapshot.data.matches[index];
                //access these field from modal
                // int uniqueId;
                // DateTime date;
                // DateTime dateTimeGmt;
                // String team1;
                // String team2;
                // Type type;
                // bool squad;
                // String tossWinnerTeam;
                // String winnerTeam;
                // bool matchStarted;
                //
                // access such as "matchlist.uniqueId"
                return Card(
                  margin: EdgeInsets.all(2.0),
                  elevation: 0,
                  color: Colors.purple,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Text(
                            matchlist.uniqueId.toString(),
                            style: style1,
                          ),
                          trailing: Text(
                            matchlist.date.toString(),
                            style: style1,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Match Type: " + matchlist.type.toString(),
                          style: style2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "" + matchlist.team1 + " Vs " + matchlist.team2,
                          style: style3,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Toss Winner : " +
                              matchlist.tossWinnerTeam.toString(),
                          style: style,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Winner Team : " + matchlist.winnerTeam.toString(),
                          style: style,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: SpinKitThreeBounce(
                color: Colors.blue,
              ),
            );
          }
        },
      ),
    );
  }
}

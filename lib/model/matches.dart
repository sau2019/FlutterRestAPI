// To parse this JSON data, do
//
//     final matchModel = matchModelFromJson(jsonString);

import 'dart:convert';

MatchModel matchModelFromJson(String str) =>
    MatchModel.fromJson(json.decode(str));

String matchModelToJson(MatchModel data) => json.encode(data.toJson());

class MatchModel {
  MatchModel({
    this.matches,
    this.v,
    this.ttl,
    this.provider,
    this.creditsLeft,
  });

  List<Match> matches;
  String v;
  int ttl;
  Provider provider;
  int creditsLeft;

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        matches:
            List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
        v: json["v"],
        ttl: json["ttl"],
        provider: Provider.fromJson(json["provider"]),
        creditsLeft: json["creditsLeft"],
      );

  Map<String, dynamic> toJson() => {
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
        "v": v,
        "ttl": ttl,
        "provider": provider.toJson(),
        "creditsLeft": creditsLeft,
      };
}

class Match {
  Match({
    this.uniqueId,
    this.date,
    this.dateTimeGmt,
    this.team1,
    this.team2,
    this.type,
    this.squad,
    this.tossWinnerTeam,
    this.winnerTeam,
    this.matchStarted,
  });

  int uniqueId;
  DateTime date;
  DateTime dateTimeGmt;
  String team1;
  String team2;
  Type type;
  bool squad;
  String tossWinnerTeam;
  String winnerTeam;
  bool matchStarted;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        uniqueId: json["unique_id"],
        date: DateTime.parse(json["date"]),
        dateTimeGmt: DateTime.parse(json["dateTimeGMT"]),
        team1: json["team-1"],
        team2: json["team-2"],
        type: typeValues.map[json["type"]],
        squad: json["squad"],
        tossWinnerTeam:
            json["toss_winner_team"] == null ? null : json["toss_winner_team"],
        winnerTeam: json["winner_team"] == null ? null : json["winner_team"],
        matchStarted: json["matchStarted"],
      );

  Map<String, dynamic> toJson() => {
        "unique_id": uniqueId,
        "date": date.toIso8601String(),
        "dateTimeGMT": dateTimeGmt.toIso8601String(),
        "team-1": team1,
        "team-2": team2,
        "type": typeValues.reverse[type],
        "squad": squad,
        "toss_winner_team": tossWinnerTeam == null ? null : tossWinnerTeam,
        "winner_team": winnerTeam == null ? null : winnerTeam,
        "matchStarted": matchStarted,
      };
}

enum Type { TWENTY20, EMPTY, ODI, FIRST_CLASS, TESTS }

final typeValues = EnumValues({
  "": Type.EMPTY,
  "First-class": Type.FIRST_CLASS,
  "ODI": Type.ODI,
  "Tests": Type.TESTS,
  "Twenty20": Type.TWENTY20
});

class Provider {
  Provider({
    this.source,
    this.url,
    this.pubDate,
  });

  String source;
  String url;
  DateTime pubDate;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        source: json["source"],
        url: json["url"],
        pubDate: DateTime.parse(json["pubDate"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "url": url,
        "pubDate": pubDate.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

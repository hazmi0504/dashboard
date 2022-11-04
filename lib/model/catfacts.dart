import 'dart:convert';

Catfacts catfactsFromJson(String str) => Catfacts.fromJson(json.decode(str));

String catfactsToJson(Catfacts data) => json.encode(data.toJson());

class Catfacts {
  Catfacts({
    required this.fact,
    required this.length,
  });

  String fact;
  int length;

  factory Catfacts.fromJson(Map<String, dynamic> json) => Catfacts(
        fact: json["fact"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "fact": fact,
        "length": length,
      };
}

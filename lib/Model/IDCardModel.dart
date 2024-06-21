import 'dart:convert';

class IDCard {
  var frontidcard1;
  var frontidcard2;
  var backidcard1;
  var backidcard2;

  IDCard({
    this.frontidcard1,
    this.frontidcard2,
    this.backidcard1,
    this.backidcard2,
  });
  factory IDCard.fromJson(Map<String, dynamic> json) {
    return IDCard(
      frontidcard1: json['frontidcard1'] ?? '',
      frontidcard2: json['frontidcard2'] ?? '',
      backidcard1: json['backidcard1'] ?? '',
      backidcard2: json['backidcard2'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'frontidcard1': frontidcard1,
      'frontidcard2': frontidcard2,
      'backidcard1': backidcard1,
      'backidcard2': backidcard2,
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:book/Model/ProvisionalBuildingMdel.dart';
import 'package:book/Model/ProvisionalLandMdel.dart';
<<<<<<< Updated upstream
import 'package:http/http.dart' as http;

class Provisional {
  final String? name;
=======

class OfficerReport {
  final String name;
>>>>>>> Stashed changes
  final String? totallandsizesqm;
  final String? totallandvaluemin;
  final String? totallandvaluemax;
  final String? totalbuildingsizesqm;
  final String? totalbuildingvaluemin;
  final String? totalbuildingvaluemax;
<<<<<<< Updated upstream
  final String? fair_market;
  final String? fire_insurance;
  final String? force_sale;
  List<PLand>? land = [];
  List<PBuilding>? building = [];

  Provisional({
=======
  final List<Land>? land;
  final List<Building>? building;

  OfficerReport({
>>>>>>> Stashed changes
    this.totallandsizesqm,
    this.totallandvaluemin,
    this.totallandvaluemax,
    this.totalbuildingsizesqm,
    this.totalbuildingvaluemin,
    this.totalbuildingvaluemax,
<<<<<<< Updated upstream
    this.fair_market,
    this.fire_insurance,
    this.force_sale,
    this.name,
    this.land,
    this.building,
  });
  factory Provisional.fromJson(Map<String, dynamic> json) {
    return Provisional(
=======
    required this.name,
    required this.land,
    required this.building,
  });
  factory OfficerReport.fromJson(Map<String, dynamic> json) {
    return OfficerReport(
>>>>>>> Stashed changes
        name: json['name'] ?? '',
        totallandsizesqm: json['totallandsizesqm'] ?? '',
        totallandvaluemin: json['totallandvaluemin'] ?? '',
        totallandvaluemax: json['totallandvaluemax'] ?? '',
        totalbuildingsizesqm: json['totalbuildingsizesqm'] ?? '',
        totalbuildingvaluemin: json['totalbuildingvaluemin'] ?? '',
        totalbuildingvaluemax: json['totalbuildingvaluemax'] ?? '',
<<<<<<< Updated upstream
        fair_market: json['fair_market'] ?? '',
        fire_insurance: json['fire_insurance'] ?? '',
        force_sale: json['force_sale'] ?? '',
=======
>>>>>>> Stashed changes
        land: [],
        building: []);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'totallandsizesqm': totallandsizesqm,
      'totallandvaluemin': totallandvaluemin,
      'totallandvaluemax': totallandvaluemax,
      'totalbuildingsizesqm': totalbuildingsizesqm,
      'totalbuildingvaluemin': totalbuildingvaluemin,
      'totalbuildingvaluemax': totalbuildingvaluemax,
<<<<<<< Updated upstream
      'fair_market': fair_market ?? '',
      'fire_insurance': fire_insurance ?? '',
      'force_sale': force_sale ?? '',
    };
  }
    Future InsertProvisional(Provisional dataProvisional) async {
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.31:8000/api/insertprovisional'));
    if (dataProvisional.fair_market == '') {
      request.body = jsonEncode({
        'name': dataProvisional.name,
        'totallandsizesqm': dataProvisional.totallandsizesqm,
        'totallandvaluemin': dataProvisional.totallandvaluemin,
        'totallandvaluemax': dataProvisional.totallandvaluemax,
        'totalbuildingsizesqm': dataProvisional.totalbuildingsizesqm,
        'totalbuildingvaluemin': dataProvisional.totalbuildingvaluemin,
        'totalbuildingvaluemax': dataProvisional.totalbuildingvaluemax,
        'force_sale': dataProvisional.force_sale ?? '',
        'land': dataProvisional.land!.toList()
      });
    } else {
      request.body = jsonEncode({
        'name': dataProvisional.name,
        'totallandsizesqm': dataProvisional.totallandsizesqm,
        'totallandvaluemin': dataProvisional.totallandvaluemin,
        'totallandvaluemax': dataProvisional.totallandvaluemax,
        'totalbuildingsizesqm': dataProvisional.totalbuildingsizesqm,
        'totalbuildingvaluemin': dataProvisional.totalbuildingvaluemin,
        'totalbuildingvaluemax': dataProvisional.totalbuildingvaluemax,
        'force_sale': dataProvisional.force_sale ?? '',
        'fair_market': dataProvisional.fair_market ?? '',
        'fire_insurance': dataProvisional.fire_insurance ?? '',
        'land': dataProvisional.land!.toList(),
        'building': dataProvisional.building!.toList()
      });
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
=======
      'land': land,
      'building': building,
    };
  }
>>>>>>> Stashed changes
}

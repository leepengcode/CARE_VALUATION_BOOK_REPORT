import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Gmap {
  File? pmapimage;
  File? apmapimage;
  File? skmapimage;

  Gmap({this.pmapimage, this.apmapimage, this.skmapimage});

  factory Gmap.fromJson(Map<String, dynamic> json) {
    return Gmap(
      pmapimage: json['pmapimage'] != null
          ? File.fromRawPath(base64Decode(json['pmapimage']))
          : null,
      apmapimage: json['apmapimage'] != null
          ? File.fromRawPath(base64Decode(json['apmapimage']))
          : null,
      skmapimage: json['skmapimage'] != null
          ? File.fromRawPath(base64Decode(json['skmapimage']))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pmapimage': pmapimage?.path,
      'apmapimage': apmapimage?.path,
      'skmapimage': skmapimage?.path,
    };
  }

  Future insertGmap(Gmap objGmap, var id_book) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://virakst.online/bookReport/public/api/insertpmap/${id_book}'),
    );

    // Add JSON fields

    if (objGmap.pmapimage != null) {
      Uint8List cvByte;
      if (kIsWeb && objGmap.pmapimage!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objGmap.pmapimage!.path);
      } else {
        // For mobile environment
        cvByte = await objGmap.pmapimage!.readAsBytes();
      }

      request.files.add(http.MultipartFile.fromBytes(
        'pmapimage',
        cvByte,
        filename: ".png",
      ));
    } else {
      print("Error: No fieldName provided");
    }

    if (objGmap.apmapimage != null) {
      Uint8List cvByte;
      if (kIsWeb && objGmap.apmapimage!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objGmap.apmapimage!.path);
      } else {
        // For mobile environment
        cvByte = await objGmap.apmapimage!.readAsBytes();
      }

      request.files.add(http.MultipartFile.fromBytes(
        'apmapimage',
        cvByte,
        filename: ".png",
      ));
    } else {
      print("Error: No fieldName provided");
    }

    if (objGmap.pmapimage != null) {
      Uint8List cvByte;
      if (kIsWeb && objGmap.pmapimage!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objGmap.pmapimage!.path);
      } else {
        // For mobile environment
        cvByte = await objGmap.pmapimage!.readAsBytes();
      }

      request.files.add(http.MultipartFile.fromBytes(
        'pmapimage',
        cvByte,
        filename: ".png",
      ));
    } else {
      print("Error: No fieldName provided");
    }
    if (objGmap.skmapimage != null) {
      Uint8List cvByte;
      if (kIsWeb && objGmap.skmapimage!.path.startsWith('blob:')) {
        // For web environment
        cvByte = await getBlobData(objGmap.skmapimage!.path);
      } else {
        // For mobile environment
        cvByte = await objGmap.skmapimage!.readAsBytes();
      }

      request.files.add(http.MultipartFile.fromBytes(
        'skmapimage',
        cvByte,
        filename: ".png",
      ));
    } else {
      print("Error: No fieldName provided");
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Done in Gmap");
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Uint8List> getBlobData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load blob data');
    }
  }
}

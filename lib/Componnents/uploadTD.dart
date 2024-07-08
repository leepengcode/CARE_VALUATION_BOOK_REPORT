import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

typedef OnChangeCallback = void Function(dynamic value);

class TDImagePicker extends StatefulWidget {
  final OnChangeCallback? getFile;
  const TDImagePicker({Key? key, this.getFile}) : super(key: key);

  @override
  State<TDImagePicker> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<TDImagePicker> {
  io.File? image;
  String? imageUrl;

  Future pickImage() async {
    try {
      XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        imageUrl = pickedImage.path;
        image = File(pickedImage.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        if (image != null) {
          widget.getFile!(image!);
        }
      });
    });
    return InkWell(
      onHover: (value) {
        setState(() {
          print("testing\n\n\n");
        });
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageUrl != null)
                Image.network(
                  imageUrl!,
                  width: 520,
                  height: 350,
                  fit: BoxFit.cover,
                )
            ],
          ),
          Positioned(
              child: GestureDetector(
            onTap: () {
              pickImage();
            },
            child: Container(
                width: 520,
                height: 350,
                decoration: BoxDecoration(border: Border.all()),
                child: image == null && imageUrl == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : SizedBox()),
          ))
        ],
      ),
    );
  }
}

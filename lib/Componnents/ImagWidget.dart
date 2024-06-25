import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

typedef OnChangeCallback = void Function(File value);

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key, this.getFile}) : super(key: key);
  final OnChangeCallback? getFile;
  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  io.File? image;
  String? imageUrl;

  Future pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

      if (kIsWeb) {
        setState(() => this.imageUrl = pickedImage.path);
      } else {
        final imageTemp = io.File(pickedImage.path);
        setState(() {
          this.image = imageTemp;
        });
        if (image != null) {
          widget.getFile!(image!);
        }
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.file(
                image!,
                // width: 500,
                // height: 300,
                fit: BoxFit.cover,
              )
            else if (imageUrl != null)
              Image.network(
                imageUrl!,
                // width: 500,
                // height: 300,
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
              width: 500,
              height: 300,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: image == null && imageUrl == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

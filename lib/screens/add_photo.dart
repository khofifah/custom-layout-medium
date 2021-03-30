import 'dart:io';

import 'package:belajar_flutter/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File image;

  pickImage(ImageSource source) async {
    PickedFile pickedImage = await ImagePicker().getImage(source: source);
    if (pickedImage != null) {
      File cropper = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(
          ratioX: 2,
          ratioY: 2,
        ),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.png,
      );
      setState(() {
        image = cropper;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Photo'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            image == null
                ? Icon(
                    Icons.person,
                    size: Sizes.s150,
                    color: Colors.grey[300],
                  )
                : Image.file(
                    File(image.path),
                    width: Sizes.s150,
                    fit: BoxFit.fitWidth,
                  ),
            ElevatedButton(
              child: Text('Tambahkan foto'),
              onPressed: () {
                pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
}

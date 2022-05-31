import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({Key? key}) : super(key: key);

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  var _image;
  var imagePicker;

  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 52,
        ),
        Center(
          child: GestureDetector(
            onTap: () async {
              XFile image = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 50,
                  preferredCameraDevice: CameraDevice.front);
              setState(() {
                _image = File(image.path);
              });
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(color: Colors.red[200]),
              child: _image != null
                  ? Image.file(
                      _image,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fitHeight,
                    )
                  : Container(
                      decoration: BoxDecoration(color: Colors.red[200]),
                      width: 200,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }
}

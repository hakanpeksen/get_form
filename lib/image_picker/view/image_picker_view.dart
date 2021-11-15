import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/image_picker_controller.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => controller.selectedImagePath.value == ''
                ? Text('Select image from camera or gallery', style: context.textTheme.headline5)
                : AspectRatio(
                    aspectRatio: 1, child: Image.file(File(controller.selectedImagePath.value)))),
            ElevatedButton(
              child: const Text('Camera'),
              onPressed: () {
                controller.getImage(ImageSource.camera);
              },
            ),
            ElevatedButton(
              child: const Text('Gallery'),
              onPressed: () {
                controller.getImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}

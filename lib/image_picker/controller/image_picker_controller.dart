import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource, imageQuality: 50);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No Image Selected');
    }
  }
}

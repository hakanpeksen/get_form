import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource, imageQuality: 50);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      // mac de ilk resmi seçmiyor, platform exception hatası
      // ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + " Mb";
    } else {
      Get.snackbar('Error', 'No Image Selected');
    }
  }
}


// camera simulatorda çalışmıyor, gerçek cihazda test etmek gerekir
// https://github.com/react-native-image-picker/react-native-image-picker/issues/1418
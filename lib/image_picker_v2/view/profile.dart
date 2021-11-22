import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/profile_controller.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 40,
            ),
          ],
        ),
        child: SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            //clipBehavior: Clip.antiAlias,
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/nouser.png'),
                    child: Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )),
                  );
                } else {
                  if (controller.imageURL.isNotEmpty) {
                    return CachedNetworkImage(
                      imageUrl: controller.imageURL,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => const CircleAvatar(
                        //backgroundImage: AssetImage('assets/images/nouser.png'),
                        child: Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    );
                  } else {
                    return const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/nouser.png'),
                    );
                  }
                }
              }),
              positionedButton(controller)
            ],
          ),
        ),
      ),
    ));
  }

  Positioned positionedButton(controller) {
    return Positioned(
      bottom: -5,
      right: -10,
      child: IconButton(
          onPressed: () {
            Get.bottomSheet(
              bottomSheet(controller),
            );
          },
          icon: const Icon(
            Icons.photo_camera_rounded,
            color: Colors.black,
            size: 26,
          )),
    );
  }

  Container bottomSheet(controller) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      child: Wrap(
        //alignment: WrapAlignment.end,
        // crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Camera'),
            onTap: () {
              Get.back();
              controller.uploadImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: () {
              Get.back();
              controller.uploadImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}

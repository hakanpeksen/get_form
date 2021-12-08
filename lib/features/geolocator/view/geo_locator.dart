import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/geo_controller.dart';

class GeoLocator extends StatelessWidget {
  const GeoLocator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GeoController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('GeoLocator'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(() => Text(controller.latitude.value)),
                const SizedBox(height: 10),
                Obx(() => Text(controller.longtitude.value)),
                const SizedBox(height: 10),
                Obx(() => Text(controller.address.value)),
              ],
            ),
          ),
        ));
  }
}

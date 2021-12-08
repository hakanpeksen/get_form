import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeResponsive extends StatelessWidget {
  const HomeResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lstPic = List.generate(24, (index) => 'https://picsum.photos/300/300?random=$index');
    return SafeArea(
      child: Scaffold(
        body: ResponsiveBuilder(builder: (context, sizeInfo) {
          return GridView.builder(
            itemCount: lstPic.length,
            itemBuilder: (BuildContext context, int index) {
              return CachedNetworkImage(
                imageUrl: lstPic[index],
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, provider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: provider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            // desktop:6, tablet:3, watch:1, mobile:2 image show
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: sizeInfo.deviceScreenType == DeviceScreenType.desktop
                    ? 6
                    : sizeInfo.deviceScreenType == DeviceScreenType.tablet
                        ? 3
                        : sizeInfo.deviceScreenType == DeviceScreenType.watch
                            ? 1
                            : 2),
          );
        }),
      ),
    );
  }
}

/* ScreenTypeLayout(
      breakpoints: const ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: OrientationLayoutBuilder(
        portrait: (context) => const HomeMobilePortrait(),
        landscape: (context) => const HomeMobileLandscape(),
      ),
      tablet: const HomeViewTablet(),
    ); */



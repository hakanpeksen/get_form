import 'package:flutter/material.dart';

class HomePageGridDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  HomePageGridDelegate() : super(crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5);
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  //TODO: Implement HomepageController
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() { 

      print(scrollController.offset);
      print('/////////////////');
      print(scrollController.position.pixels);
    });
  }
}

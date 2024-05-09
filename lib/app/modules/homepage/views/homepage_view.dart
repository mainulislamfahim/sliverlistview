import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomepageController());
    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            title: const Text('Appbar'),
            expandedHeight: 100,
            flexibleSpace: Container(
              height:200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent,
              ),
              child: const Icon(
                Icons.man,
                size: 90,
                color: Colors.white,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: index.isEven ? Colors.greenAccent : Colors.amber,
                  ),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                            fontSize: 29, fontWeight: FontWeight.w500),
                      )),
                    ],
                  ),
                ),
              ),
              childCount: 30
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
            child: IconButton(
                onPressed: () {
                  controller.scrollController.animateTo(
                      controller.scrollController.position.minScrollExtent,
                      duration: const Duration(
                        seconds: 4,
                      ),
                      curve: Curves.bounceIn
                  );
                },
                icon: const Icon(
                  Icons.arrow_upward,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
            child: IconButton(
                onPressed: () {
                  controller.scrollController.animateTo(
                      controller.scrollController.position.maxScrollExtent,
                      duration: const Duration(
                        seconds: 4,
                      ),
                      curve: Curves.bounceIn);
                },
                icon: const Icon(
                  Icons.arrow_downward,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
// AnimationLimiter(
// child: ScrollWrapper(
// scrollController: controller.scrollController,
// alwaysVisibleAtOffset: true,
// promptAlignment: Alignment.bottomRight,
// promptTheme:
// const PromptButtonTheme(color: ColorName.gray410),
// builder: (context, properties) => ListView.builder(
// // controller: controller.scrollController,
// physics: controller.scrollController.offset >= 0.0
// ? const NeverScrollableScrollPhysics()
//     : const AlwaysScrollableScrollPhysics(),
// scrollDirection: Axis.vertical,
// itemCount:
// Get.find<HomeController>().flashSalesList.length,
// itemBuilder: (context, index) {
// final ProductModel product =
// Get.find<HomeController>().flashSalesList[index];
// return AnimationConfiguration.staggeredList(
// position: index,
// duration: const Duration(milliseconds: 500),
// child: SlideAnimation(
// verticalOffset: 50,
// child: ScaleAnimation(
// child: FlashWidgetVertical(
// product: product,
// ),
// ),
// ),
// );
// },
// ),
// ),
// ),

import 'package:get/get.dart';

class MeetupDescriptionController extends GetxController {
  final pageIndex = 0.obs;
  String title = '';
  RxInt selectedDrowerIndex = 0.obs;
  int currentIndex = 0;
  var isLoading = false.obs;

  List<String> sliderImage = [
    "assets/image/slider_image.jpg",
    "assets/image/slider_image_1.jpg",
    "assets/image/slider_image_2.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

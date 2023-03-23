import 'package:get/state_manager.dart';
// import 'package:get/get.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/models/Product.dart';

import '../models/Inventory.dart';

class InventoryController extends GetxController {
  var isloading = true.obs;
  var inventoryList = <Inventory>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isloading(true);
      // var inventory = await productServices.getAllProducts();
      var inventory = await productServices.getProductNames();
      print("inventory");
      print(inventory);
      if (inventory != null) {
        inventoryList.value = inventory;
        print(inventoryList);
      }
    } finally {
      isloading(false);
    }
  }
}

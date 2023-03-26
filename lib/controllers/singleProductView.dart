import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vegrow/controllers/bidController.dart';
import 'package:vegrow/services/homeServices.dart';
// import 'package:get/get.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/models/Product.dart';

import '../models/bid.dart';

class SpecificProductDetailController extends GetxController {
  var isLoadng=true.obs;
var productDetail=<Map>[].obs;

  BidController bidController =  Get.put(BidController());

  @override
  void onInit() {
  

    super.onInit();
    // fetchProduct();
  }
    getDataForSpecifiProductFromId({data})async{isLoadng(true);
    var product=await productServices.getSpecificProductDetails(data);
    if (product!=null){
  
      productDetail.value=[product];
      print("(((0000000000000000))))))))");
      // print(productDetail['productName']);
      bidController.getListOfBidsForSpecificProduct(tokenId: product['inventoryId'],filter: "All")
      ;
 isLoadng(false);
    }
   

  } 

 
}

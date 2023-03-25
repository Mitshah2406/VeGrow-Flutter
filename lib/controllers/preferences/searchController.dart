import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vegrow/services/productServices.dart';

class SearchController extends GetxController{
   var isloading = true.obs;
  var searchList = <String>[].obs;
  // var productListForSearchQuery = <Product>[].obs;



  @override
  void onInit() {
    callApi();

    super.onInit();
    // fetchProduct();
  }
  void callApi() async {

    var result = await productServices.fetchProductsForSearchList();
    print("result");
    print(result);
   if(result!=null){
    searchList.value=result;
    isloading(false);
   }else{
      searchList.value = ["NA"];
   }
  }
}
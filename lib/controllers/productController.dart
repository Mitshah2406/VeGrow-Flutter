import 'package:get/state_manager.dart';
// import 'package:get/get.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/models/Product.dart';

class ProductController extends GetxController{
  var isloading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // fetchProduct();
  }

  void fetchProduct() async {
    try {
      isloading(true);
      var products = await productServices.getAllProducts();
      print(products);
      print("products");
      if(products != null){
        productList.value = products;
      }  
    } finally{
      isloading(false);
    }    
  }


  Future<int?> addProduct(productName, productDesc, productQuantity, productUnit, productExpiryDate) async {
    var data = await productServices.addProduct(productName, productDesc, productQuantity, productUnit, productExpiryDate);

    print("Dataaaaaaaa");
    print(data);
    // print(jsonEncode(data));

    return data;
  }
}
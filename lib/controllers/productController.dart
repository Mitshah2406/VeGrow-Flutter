import 'package:get/state_manager.dart';
// import 'package:get/get.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/models/Product.dart';

class ProductController extends GetxController {
  var isloading = true.obs;
  var productList = <Product>[].obs;
  var product = Product().obs;

//   @override
//   void onInit() {
//     fetchProduct();
//     super.onInit();
//   }

//   void fetchProduct() async {
//     try {
//       isloading(true);
//       var products = await productServices.getAllProducts();
//       print(products);
//       if(products != null){
//         productList.value = products;
//       }  
//     } finally{
//       isloading(false);
//     }    
//   }
  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isloading(true);
      var products = await productServices.getAllProducts();
      print("products");
      print(products);
      if (products != null) {
        productList.value = products;
        print(productList);
      }
    } finally {
      isloading(false);
    }
  }

  Future<int?> addProduct(productName,id,productDesc, productQuantity, initialBidPrice,
      productUnit, productExpiryDate) async {
    var data = await productServices.addProduct(productName,id, productDesc,
        productQuantity,initialBidPrice, productUnit, productExpiryDate);

    print("Dataaaaaaaa");
    print(data);
    // print(jsonEncode(data));

    return data;
  }

  void getProductByInventoryId(inventoryId) async {
    Product result =
        productList.firstWhere((obj) => obj.inventoryId == inventoryId,
        //  orElse: () => null
         );
print("result");
print(result);
product.value = result;
    // var data = productList.map((element) =>
    // {
    //     (element.inventoryId == inventoryId)?element:''
    // });
  }
}

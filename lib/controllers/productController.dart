import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:vegrow/services/homeServices.dart';
// import 'package:get/get.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/models/Product.dart';

class ProductController extends GetxController {
  var isloading = true.obs;
  var productList = <Product>[].obs;
  var conFirmedFilter = false.obs;
  var productListIsEmpty = false.obs;
  var productListForSearchQuery = <Product>[].obs;

  late List<Product> AllList;
  var product = Product().obs;

  @override
  void onInit() {
    fetchtopFiveProducts();

    super.onInit();
    // fetchProduct();
  }

  void confirmedFilterFalse() {
    productListIsEmpty(false);
    conFirmedFilter(false);
  }

  void confirmedFilterTrue() {
    productListIsEmpty(false);
    conFirmedFilter(true);
  }

  void fetchProduct({data}) async {
    try {
      productList.value = [];
      isloading(true);
      print(isloading);
      Future.delayed(Duration(seconds: 1), () async {
        var products = await productServices.getAllProducts(data: data);
        print("products");
        print(products);
        if (products != null) {
          productList.value = products;
          if (productList.isEmpty) {
            productListIsEmpty(true);
          }
          isloading(false);

          print(productList);
        }
      });
    } finally {}
  }

  Future<int?> addProduct(productName, id, productDesc, productQuantity,
      initialBidPrice, productUnit, productExpiryDate) async {
    var data = await productServices.addProduct(productName, id, productDesc,
        productQuantity, initialBidPrice, productUnit, productExpiryDate);

    print("Dataaaaaaaa");
    print(data);
    // print(jsonEncode(data));

    return data;
  }

  void getProductByInventoryId(inventoryId) async {
    Product result = productList.firstWhere(
      (obj) => obj.inventoryId == inventoryId,
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

  Future<List<Product>?> fetchtopFiveProducts() async {
    try {
      isloading(true);
      Future.delayed(Duration(seconds: 1), () async {
        var result = await productServices.getTopFiveProducts();
        if (result != null) {
          productList.value = result;
          print("product list");
          print(productList);
          print(productList);
        }
      });
      isloading(false);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>?> fetchProductsBySearchQuery(query,
      {params = 'distance'}) async {
    try {
      isloading(true);
      Future.delayed(Duration(seconds: 1), () async {
        var result =
            await productServices.fetchProductsBySearchQuery(query, params);
        if (result != null) {
          productListForSearchQuery.value = result;
          print("product list");
          print(productListForSearchQuery.length);
        }
      });
      isloading(false);
    } catch (e) {
      print(e);
    }
  }
}

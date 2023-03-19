import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/models/Product.dart';

class productServices{

  static Future<List<Product>?> getAllProducts() async {
    try{
      var response = await http.get(Uri.parse("${AppConstant.IP}/fetchProduct"));
      print(response.body);
      
      print(response.body);
      return productFromJson(response.body);
      // return productFromJson(response.body);
    } catch(e){
      // return null;
    }

  }

  static Future<int?> addProduct(productName, productDesc, productQuantity, productUnit, productExpiryDate) async {
    try {
      var response = await http.post(
        Uri.parse("${AppConstant.IP}/addData"), 
        body: {
          "productName": productName,
          "productDescription": productDesc,
          "productImages": "",
          "productQuantity": productQuantity,
          "productUnit": productUnit,
          "productExpiryDate": productExpiryDate,
          "farmerId": "12344"
        } 
      );

      print(response.body);
      print(response.statusCode);
      // print(response.body);
      // print(response.body.runtimeType);
      return response.statusCode;
    } catch (e) {
      print(e);
      return 404;
    }
  }
}
import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
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
     dynamic data = await SessionManager().get("token");
      print(data);
      var response = await http.MultipartRequest("POST",
        Uri.parse("${AppConstant.IP}/authentication/addProductToInventory/")); 
        response.fields['productId'] = '1';
       response.fields['productName'] = (productName.toString()).toLowerCase();
       response.fields['productDescription'] = productDesc;
       response.fields['productImages'] = '';
       response.fields['productQuantity'] = productQuantity;
       response.fields['productUnit'] = productUnit;
       response.fields['productExpiryDate'] = productExpiryDate;
       response.fields['farmerId'] = '4dtHv9IK7ca08SPR343PLll4Rxd2';
      //  request.headers.addAll({
      //   'Authorization':
      //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2OTI0NzQ4LCJpYXQiOjE2NzkxNDg3NDgsImp0aSI6IjUzODVlZTk2MmQzNzRiMWNiOWE3ZjkzY2FhOWE0Y2IwIiwidXNlcl9pZCI6IjIifQ.sw3wzf4f4mjhN7DzWgvzfIEScPH0z7IJ6aWnMwJ7ZXc'
      // });
 var res =await response.send();
      //  fields: jsonEncode({
      //     "productName": productName,
      //     "productDescription": productDesc,
      //     "productImages": "",
      //     "productQuantity": productQuantity,
      //     "productUnit": productUnit,
      //     "productExpiryDate": productExpiryDate,
      //     "farmerId": "4dtHv9IK7ca08SPR343PLll4Rxd2"
      //   } )
      

      
      // print(response.body);
      // print(response.body.runtimeType);
      print(res.statusCode);
      return res.statusCode;
    } catch (e) {
      print(e);
      return 404;
    }
  }
}
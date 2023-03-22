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
     dynamic data = await SessionManager().get("user");
      print(data['token']);
      var req = await http.MultipartRequest("POST",
        Uri.parse("${AppConstant.IP}/authentication/addProductToInventory/")); 
        req.fields['productId'] = '1';
       req.fields['productName'] = (productName.toString()).toLowerCase();
       req.fields['productDescription'] = productDesc;
       req.fields['productImages'] = '';
       req.fields['productQuantity'] = jsonEncode({"unit": productUnit, "value": productQuantity});
       req.fields['productExpiryDate'] = productExpiryDate;
       req.fields['farmerId'] = '5xkcKyHDFdSVXJhdBUi18XyLLF52';
       req.headers.addAll({
        'Authorization':
            'Bearer ${data["token"]}'
      });
 var res =await req.send();
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
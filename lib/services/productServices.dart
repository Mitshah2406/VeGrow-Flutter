import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/models/Inventory.dart';
import 'package:vegrow/models/Product.dart';
import 'package:vegrow/services/authServices.dart';

class productServices{

  static Future<List<Product>?> getAllProducts() async {

    try{
      var sessionData = await AuthServices.getCurrentSession();
      var farmerId = sessionData['id'];
      Product product;
      print(farmerId);
      print(sessionData['token']);
      var response = await http.post(
        Uri.parse("${AppConstant.IP}/authentication/getMyListedProductList/"),
        headers: <String, String>{
          'Authorization':'Bearer ${sessionData["token"]}'
        },
        body: jsonEncode({
          "farmerId": farmerId
        })
         );
      print("response.body");
      
      print(jsonDecode(response.body));
      // product = Product.fromJson(jsonDecode(response.body));
      // return product;
      return productFromJson(response.body);
      // return Product.fromJson(jsonDecode(response.body));
    } catch(e){
      // return null;
    }

  }
  static Future<List<Inventory>?> getProductNames() async {

    try{
      var sessionData = await AuthServices.getCurrentSession();

      Product product;
      print(sessionData['token']);
      var response = await http.post(
        Uri.parse("${AppConstant.IP}/authentication/searchProductForFarmer/"),
        headers: <String, String>{
          'Authorization':'Bearer ${sessionData["token"]}'
        },
         );
      print("response.body");
      
      print(jsonDecode(response.body));
      // product = Product.fromJson(jsonDecode(response.body));
      // return product;
      return inventoryFromJson(response.body);
      // return Product.fromJson(jsonDecode(response.body));
    } catch(e){
      // return null;
    }

  }

  static Future<int?> addProduct(productName,id, productDesc, productQuantity,
      initialBidPrice, productUnit, productExpiryDate) async {
    try {
     dynamic data = await SessionManager().get("user");
      print(data['token']);
      print(id);
      var req = await http.MultipartRequest("POST",
        Uri.parse("${AppConstant.IP}/authentication/addProductToInventory/")); 
        req.fields['productId'] = id.toString();
       req.fields['productName'] = (productName.toString()).toLowerCase();
       req.fields['productDescription'] = productDesc;
       req.fields['productImages'] = '';
       req.fields['productQuantity'] = productQuantity;
       req.fields['productUnit'] = productUnit;
       req.fields['productExpiryDate'] = productExpiryDate;
       req.fields['initialBidPrice'] = initialBidPrice.toString();
       req.fields['farmerId'] = data['id'];
       //IqEQcNwvCWUaKHSgkNlBflYbMyN2
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
      

      // print()
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
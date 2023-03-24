import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:vegrow/models/auth/Farmer.dart';
import 'package:vegrow/services/homeServices.dart';

class HomeController extends GetxController{
  var isLoading = true.obs;
  var farmerList = <Map>[].obs;

  @override
  void onInit() {
    fetchFarmers();
    super.onInit();
  }

  void fetchFarmers() async {
    try {
      isLoading(true);
      var userData = await SessionManager().get('user');
      print("User data");
      print(userData);
      Future.delayed(const Duration(seconds: 1), () async {
        if(userData['role'] == "farmer"){
          var farmers = await HomeServices.getFarmerData(userData['id'], userData['token']);
          print("NULLLLLLLLLLLLLLLLLLLLL");
          print(farmers);
          print(farmers.runtimeType);
          if(farmers != null){      
            farmerList.add(farmers);
          }  
        }else{
          var farmers = await HomeServices.getVendorData(userData['id'], userData['token']);
          print("NULLLLLLLLLLLLLLLLLLLLL");
          print(farmers);
          print(farmers.runtimeType);
          if(farmers != null){      
            farmerList.add(farmers);
          }  
        }
      isLoading(false);
      });
    }catch(e){
      print(e);
    }    
  }
}
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
      var farmers = await HomeServices.getFarmerData(userData['id'], userData['token']);
      print("NULLLLLLLLLLLLLLLLLLLLL");
      print(farmers);
      print(farmers.runtimeType);
      if(farmers != null){      
        farmerList.add(farmers);
      }  
    } finally{
      isLoading(false);
    }    
  }
}
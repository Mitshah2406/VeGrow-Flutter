import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class IdController extends GetxController{
final FirebaseAuth auth = FirebaseAuth.instance;

  String? inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    // here you write the codes to input the data into firestore
    return uid;
  }
}
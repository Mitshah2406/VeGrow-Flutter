import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vegrow/controllers/inventoryController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/models/Inventory.dart';
import 'package:vegrow/views/pages/MainBody/Farmers/tabs/home/homePage.dart';
import 'package:vegrow/views/widgets/addProductTextField.dart';

class AddProducePage extends StatefulWidget {
  const AddProducePage({Key? key}) : super(key: key);

  @override
  State<AddProducePage> createState() => _AddProducePageState();
}

class _AddProducePageState extends State<AddProducePage> {
  final ProductController product = Get.find();
  final InventoryController inventoryController = Get.put(InventoryController());
  TextEditingController _productDesController = TextEditingController();
  TextEditingController intialBidPriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();

  final productNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  Future<List<String>> getFakeRequestData(String query) async {
    // var data = inventoryController.inventoryList;
List data = (inventoryController.inventoryList).map((product) => [product.productName,product.id]).toList();

List<String> stringList =
        data.map((item) => item.toString()).toList();
    return await Future.delayed(const Duration(seconds: 1), () {
      return stringList.where((e) {
        return e.contains(query.toLowerCase());
      }).toList();
  });
  }

  int currentStep = 0;
  String btnText = "Next";
  continueStep() async {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1;
      });
    }else{

      if (formKey.currentState!.validate()) {
        var result = await product.addProduct(
            productNameController.text.split(',')[0].substring(1),
             productNameController.text.split(',')[1].substring(0, productNameController.text.split(',')[1].length - 1),
            _productDesController.text,
            quantityController.text,
            intialBidPriceController.text,
            unitController.text,
            expiryDateController.text);
        if (result == 200) {
          print("Done");
          // Get.offNamed('/dashboard');
        // Navigator.pushNamed(context, HomePage() as String);
        }
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: "Fill All Fields Properly",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }

  }

  stepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }
@override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("List Produce To Sell"),
      ),
      body: Form(
        key: formKey,
        child: Stepper(
            type: StepperType.horizontal,
            physics: ClampingScrollPhysics(),
            margin: EdgeInsets.all(60),
            currentStep: currentStep,
            elevation: 0,
            onStepContinue: continueStep,
            onStepCancel: cancelStep,
            onStepTapped: stepTapped,
            controlsBuilder: (context, _){
              
              return Row(
                children: [
                  ElevatedButton(
                    onPressed: _.onStepContinue,
                    child: currentStep==2? Text("List Produce"): Text('Next'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: _.onStepCancel,
                    child: Text("Back"),
                  )
                ],
              );
            },
            steps: [
              Step(
                  title: Text("List Produce"),
                  content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropdown.searchRequest(
                          futureRequest: getFakeRequestData,
                          hintText: 'Search For Product To Add',
                          controller: productNameController,
                        ),
                        SizedBox(height: 20.0),
                        AddProductTxtField(
                            // myIcon: ,
                            myIcon: Icons.description_outlined,
                            type: TextInputType.multiline,
                            action: TextInputAction.newline,
                            min: 1,
                            max: 5,
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 5.0),
                            myController: _productDesController,
                            fieldName: "Product Description",
                            prefixIconColor: Colors.green.shade300),
                        SizedBox(height: 16.0),
                      ]),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: Text("Quantity"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) * .30,
                        child: CustomDropdown(
                            // listItemStyle: ,
                            // selectedStyle: ,
                            hintText: "Unit",
                            // fieldSuffixIcon: Icons.ton,
                            items: ['kg', 'quintal', 'ton'],
                            controller: unitController),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) * .55,
                        child: AddProductTxtField(
                          fieldName: "Quantity",
                          type: TextInputType.number,
                          myController: quantityController,
                          myIcon: Icons.production_quantity_limits_outlined,
                          prefixIconColor: Colors.green.shade300,
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                  isActive: currentStep >= 1,
                  state: currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: Text("Quality"),
                  content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * .55,
                          child: TextFormField(
                            
                            validator: (value) {
                              if(value==""){

                              return "Select Proper Expiry Date";
                              }
                            },
                            readOnly: true,
                            controller: expiryDateController,
                            style: TextStyle(
                                fontSize: 20, color: Colors.green.shade300),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                labelText: "Expiry Date",
                                prefixIcon: Icon(Icons.date_range_outlined,
                                    color: Colors.green.shade300),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.green.shade300),
                                ),
                                labelStyle: const TextStyle(
                                    color: Colors.green, fontSize: 18)),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  expiryDateController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) * .55,
                          child: AddProductTxtField(
                            fieldName: "Initial Bid Price",
                            type: TextInputType.number,
                            myController: intialBidPriceController,
                            myIcon: Icons.currency_rupee_outlined,
                            prefixIconColor: Colors.green.shade300,
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ]),
                  isActive: currentStep >= 2,
                  state: currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled),
            ]),
      ),
    );
  }
}




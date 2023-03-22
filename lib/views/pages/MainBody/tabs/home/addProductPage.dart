import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/views/widgets/myButton.dart';
import 'package:vegrow/views/widgets/myDateTextField.dart';
import 'package:vegrow/views/widgets/myTextField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class addProductPage extends StatefulWidget {
  addProductPage({super.key});

  // Controllers
  final productName_controller = new TextEditingController();
  final productDesc_controller = new TextEditingController();
  final productQty_controller = new TextEditingController();
  final productUnit_controller = new TextEditingController();
  final productDate_controller = new TextEditingController(text: DateTime.now().toString());

  @override
  State<addProductPage> createState() => _addProductPageState();
}

class _addProductPageState extends State<addProductPage> {
  final ProductController product = Get.find();
  final _formkey = GlobalKey<FormState>();

  final List<String> items = ['kg', 'gm', 'qt'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        automaticallyImplyLeading: false,
        title: const Text("Add Products"),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              iconSize: 30,
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                image: AssetImage(AppConstant.addProduct),
                height: 150,
              ),
              const Text("Farmer The God",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          // Product Name
                          myTextField(
                            controller: widget.productName_controller,
                            hintText: "Product Name",
                            labelText: "Enter Your Product Name",
                            obscureText: false,
                            isNumber: TextInputType.name,
                          ),
                          const SizedBox(height: 20),

                          // Product Description
                          myTextField(
                            controller: widget.productDesc_controller,
                            hintText: "Product Description",
                            labelText: "Enter Your Product Description",
                            obscureText: false,
                            isNumber: TextInputType.name,
                          ),
                          const SizedBox(height: 20),

                          // Product Quantity
                          myTextField(
                            controller: widget.productQty_controller,
                            hintText: "Product Quantiy",
                            labelText: "Enter Your Product Quantity",
                            obscureText: false,
                            isNumber: TextInputType.number,
                          ),
                          const SizedBox(height: 20),

                          // Product Units
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(5)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(5)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red.shade400),
                                    borderRadius: BorderRadius.circular(5)),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red.shade400),
                                    borderRadius: BorderRadius.circular(5)),
                                labelText: "Enter your Units",
                                labelStyle: const TextStyle(fontSize: 20),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintText: "Select your Units",
                                hintStyle: TextStyle(color: Colors.grey.shade500)),
                                isExpanded: true,
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Select Quantity';
                                  }
                                },
                                onChanged: (value) {
                                  selectedValue = value.toString();
                                  print(selectedValue);
                                },
                                onSaved: (value){
                                  selectedValue = value.toString();
                                },
                            ),
                          const SizedBox(height: 20),

                          // Product Expiry Date
                          myDateTextField(
                              controller: widget.productDate_controller),
                          const SizedBox(height: 20),

                          // Submit Button
                          MyButton(
                              onTap: () async {
                                if (_formkey.currentState!.validate()){
                                  print(selectedValue);
                                  var result = await product.addProduct(
                                    widget.productName_controller.text,
                                    widget.productDesc_controller.text,
                                    widget.productQty_controller.text,
                                    selectedValue,
                                    widget.productDate_controller.text,
                                  );
                                  if(result == 200){
                                    print("Done");
                                    Get.back();
                                  }
                                }else{
                                  print("Failed");
                                }
                              },
                              text: "Add Product")
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

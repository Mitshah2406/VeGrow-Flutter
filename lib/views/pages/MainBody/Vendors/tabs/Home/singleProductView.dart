
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';

class SingleProductView extends StatefulWidget {
  SingleProductView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController bidController = new TextEditingController();


  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  final int initialBidAmount = 2000;
  final int productQuantity = 20;
  double actualPrice = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/two.jpg"),
            ),
            buttonArrow(),
            scroll()
          ],
        ),
      )
    );
  }

  buttonArrow(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: (){
          // To go back
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.green,),
          ),
        )
        ),
      ),
    );
  }


  scroll(){
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController){
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            border: Border.all(
              color: Colors.green.shade800,
              width: 2
            )
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 300,
                          child: Text(
                            "Product Title Comes here",
                            style: TextStyle(
                              color: Colors.blue.shade500,
                              fontSize: 28,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            showModalBottomSheet(
                              useSafeArea: true,
                              context: context, 
                              builder: (BuildContext context){
                                return Container(
                                  height: 500,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Product Title to be placed", style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black
                                              ),),
                                              Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "${initialBidAmount.toString()} Rs",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                            child: Divider(
                                              color: Colors.grey.shade300,
                                              height: 5,
                                              thickness: .5,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.grey.shade300
                                              ),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Price Per kg: ${initialBidAmount/productQuantity}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            )
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                            child: Form(
                                              key: widget._formKey,
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    
                                                    validator: (value){
                                                      if(value == 0){
                                                        return "It cannot be zero";
                                                      }
                                                    },
                                                    // onChanged: (value){
                                                    //   setState(() {
                                                    //     print(widget.bidController.text);
                                                    //     actualPrice = (initialBidAmount/productQuantity) * int.parse(value);
                                                    //   });
                                                    // },
                                                    keyboardType: TextInputType.number,
                                                    controller: widget.bidController,
                                                    decoration: InputDecoration(
                                                      suffixIcon: TextButton(
                                                        onPressed: (){
                                                          actualPrice = (initialBidAmount/productQuantity) * int.parse(widget.bidController.text);
                                                          print(actualPrice);
                                                        },
                                                        child: Text("Calculate")
                                                      ),
                                                      label: const Text("How much do you want to buy?"),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                        borderSide: BorderSide(
                                                          color: Colors.green.shade500
                                                        )
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                        borderSide: BorderSide(
                                                          color: Colors.green.shade500
                                                        )
                                                      ),
                                                      errorBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                        borderSide: BorderSide(
                                                          color: Colors.red.shade500
                                                        )
                                                      ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    // initialValue: "${actualPrice}",
                                                    controller: widget.bidController,
                                                    // initialValue: ,
                                                  )
                                                 
                                                  // ElevatedButton(
                                                  //   onPressed: onPressed,
                                                  //   child: Text(data)
                                                  // )
                                                ],
                                              )
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            );

                          }, 
                          child: const Text(
                            "Place Bid",
                          )
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Quantity - 12 kg",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Price - 2000 Rs",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 4,
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text("Description", style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text("The Description you need to add", style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 20
                    ),),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      height: 4,
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text("Your Bids", style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 100,
                    itemBuilder: (context, index){
                      return bidlist();
                    }
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }


  bidlist(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFE3FFF8),
            child: Icon(Icons.done, size: 25,),
          ),
          SizedBox(width: 10),
          Text(
            "Bids will be shown here...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ],
      ),
    );
  }
}



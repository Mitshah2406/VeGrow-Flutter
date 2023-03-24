import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/utils/skeletons/listProduceSkeleton.dart';

class ListProducePage extends StatefulWidget {
  const ListProducePage({super.key});

  @override
  State<ListProducePage> createState() => _ListProducePageState();
}

class _ListProducePageState extends State<ListProducePage> {
  final ProductController productController = Get.put(ProductController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // productController.fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    productController.fetchProduct(data: "All");
    // productController.fetchAllListedProducts();
    print("sssssss");

    return Scaffold(
        appBar: AppBar(
          title: Text("My listed produce"),
        ),
        body: Obx(
          () => productController.isloading == true
              ? Center(
                  child: Align(
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  ),
                )
              : ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          'All',
                          'Pending',
                          'Bidded',
                          'Confirmed',
                          'Satisfied',
                        ]
                            .map((e) => Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      if (e == "All") {
                                        productController.fetchProduct(
                                            data: "All");
                                      } else if (e == "Pending") {
                                        productController.fetchProduct(
                                            data: "pending");
                                      } else if (e == "Bidded") {
                                        productController.fetchProduct(
                                            data: "bidded");
                                      } else if (e == "Confirmed") {
                                        productController.fetchProduct(
                                            data: "confrimed");
                                      }
                                    },
                                    style: ButtonStyle(
                                        // border: RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.circular(30)),
                                        ),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Column(
                      children: productController.productList
                          .map(
                            (e) => GestureDetector(
                              onTap: () => {
                                Get.toNamed('/singleProducePage/', arguments: {
                                  "id": e.inventoryId,
                                })
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).primaryColor,
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: Offset(3, 4))
                                  ],
                                ),
                                child: Hero(
                                  tag: productController.productList
                                      .map((element) => element.productId),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(8),
                                    leading: ClipOval(
                                      child: Image.network(
                                        'https://static.vecteezy.com/system/resources/thumbnails/001/992/951/small/fresh-onion-healthy-vegetable-icon-free-vector.jpg',
                                        fit: BoxFit.cover,
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                    title: Text(
                                      e.productName.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("\$ " +
                                            e.productDescription.toString()),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 40,
                                          child: Stack(
                                            children: <Widget>[
                                              Positioned(
                                                  left: 20,
                                                  bottom: 0,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      child: Image.network(
                                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRxHTyqjCdnZsEM-EkMvn3FDBkDADcaEZ3GN1YEdWFToAJm83nX&usqp=CAU'))),
                                              Positioned(
                                                left: 0,
                                                bottom: 0,
                                                child: CircleAvatar(
                                                    child: Text('a')),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
        ));
  }
}

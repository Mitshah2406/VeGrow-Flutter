import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/preferences/searchController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/models/category_item.dart';
import 'package:vegrow/services/productServices.dart';
import 'package:vegrow/views/widgets/bottomNav.dart';
import 'package:vegrow/views/widgets/category_item_card_widget.dart';
import 'package:vegrow/views/widgets/category_items_screen.dart';

List<Color> gridColors = [
  Color(0xff53B175),
  Color(0xffF8A44C),
  Color(0xffF7A593),
  Color(0xffD3B0E0),
  Color(0xffFDE598),
  Color(0xffB7DFF5),
  Color(0xff836AF6),
  Color(0xffD73B77),
];

class tabPage2 extends StatefulWidget {
  tabPage2({Key? key}) : super(key: key);

  @override
  State<tabPage2> createState() => _tabPage2State();
}

class _tabPage2State extends State<tabPage2> {
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    // TODO: implement initState
    // searchBox.callApi();
    productController.productListForSearchQuery.clear();
    super.initState();
  }
TextEditingController searchBoxController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => productController
                    .productListForSearchQuery.isNotEmpty &&
                productController.isloading == false
            ? Text(productController.productListForSearchQuery[0].productName
                .toString())
            : Text("Search Product")),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              productController.productListForSearchQuery.clear();
              showSearch(
                  context: context,
                  // delegate to customize the search bar

                  delegate: searchBox());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:
          //if productList... .isnotEmpty => searchedzProductList  else =>categorypage
          // child: Text(
          //     productController.productListForSearchQuery.length.toString())
          // child: Text('hey there ! you are here! in the search tab page'),
          //     ? Center(child: Text("HEllo"))
          Obx(
        () => productController.productListForSearchQuery.isNotEmpty
            ?ListView(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                         'Highest Qty',
                         'Lowest Price',
                         'Distance',
                        ]
                            .map((e) => Container(
                            
                             
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      if (e == "Highest Qty") {
                                        productController.fetchProductsBySearchQuery(
                                             searchBoxController.text, params: 'highestQuantity');
                                      } else if (e == "Lowest Price") {
                                          
                                        productController
                                          .fetchProductsBySearchQuery(
                                              searchBoxController.text,
                                              params: 'lowestPrice');
                                      
                                      } else if (e == "Distance") {
                                        productController.fetchProduct(
                                            data: "distance");
                                      }
                                    },
                                    style: const ButtonStyle(
                                        // border: RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.circular(30)),
                                        ),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    productController.productListIsEmpty == true
                        ? Center(
                            child: Column(children: [
                            const SizedBox(
                              height: 90,
                            ),
                          ClipOval(child: Image.asset('assets/images/empty.png')),
                            const SizedBox(
                              height: 60,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Add Produce"))
                          ]))
                        :
                    productController.conFirmedFilter == true   
                        ? const Text("mitsCards")
                        :
                    Column(
                      children: productController.productList
                          .map(
                            (e) => GestureDetector(
                              onTap: () => {
                                // Get.toNamed('/singleProducePage/', arguments: {
                                //   "id": e.inventoryId,
                                // })
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       color: Theme.of(context).primaryColor,
                                  //       blurRadius: 10,
                                  //       spreadRadius: 3,
                                  //       offset: Offset(3, 4))
                                  // ],
                                ),
                                child: Hero(
                                  tag: productController.productList
                                      .map((element) => element.productId),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(8),
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
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("\$ " +
                                            e.productDescription.toString()),
                                        const SizedBox(height: 10),
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
                                              const Positioned(
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
                )
            : Column(
                children: [
                  getStaggeredGridView(context),
                ],
              ),
      ),
    );
  }
}

class searchBox extends SearchDelegate {
  ProductController productController = Get.find();
  SearchController searchController = Get.put(SearchController());
  List<String> list = [];
  // void callApi() async {
  //   list = await productServices.fetchProductsForSearchList();
  // }

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        productController.productListForSearchQuery.clear();

        close(context, null);
        // productController.dispose();

        // Get.back();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchController.searchList.toList()) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () async {
            productController.fetchProductsBySearchQuery(result);
            // productController.productListForSearchQuery

            print("object");
            close(context, null);
          },
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchController.searchList.toList()) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () async {
            print("object");
            productController.fetchProductsBySearchQuery(result);
            close(context, null);
          },
        );
      },
    );
  }
}

Widget getStaggeredGridView(BuildContext context) {
  return SingleChildScrollView(
    padding: EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: StaggeredGridView.count(
      crossAxisCount: 2,
      children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
        int index = e.key;
        CategoryItem categoryItem = e.value;
        return GestureDetector(
          onTap: () {
            onCategoryItemClicked(context, categoryItem);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: CategoryItemCardWidget(
              item: categoryItem,
              color: gridColors[index % gridColors.length],
            ),
          ),
        );
      }).toList(),
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 4.0, // add some space
    ),
  );
}

void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
  Navigator.of(context).push(new MaterialPageRoute(
    builder: (BuildContext context) {
      return CategoryItemsScreen();
    },
  ));
}

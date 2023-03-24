import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegrow/controllers/preferences/searchController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/services/productServices.dart';

class tabPage2 extends StatefulWidget {
  const tabPage2({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => productController.productListForSearchQuery.isNotEmpty
      &&
        productController.isloading==false?
        Text(productController.productListForSearchQuery[0].productName.toString())
        :Text("Search Product")) ,
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
      body: Obx(() => Center(
          child: Text(
              productController.productListForSearchQuery.length.toString()))),
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

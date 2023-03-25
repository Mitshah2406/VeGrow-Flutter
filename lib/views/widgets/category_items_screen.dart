import 'package:flutter/material.dart';
import 'package:vegrow/views/widgets/app_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vegrow/views/widgets/filter_screen.dart';

class CategoryItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => FilterScreen()),
            //   );
            // },
            child: Container(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.sort,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: "Beverages",
            //here will be the title of the widget that is been selected! 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Text("Grids will be displayed here! "),
        // child: StaggeredGrid.count(
        //   crossAxisCount: 2,
        //   // I only need two card horizontally
        //   children: beverages.asMap().entries.map<Widget>((e) {
        //     GroceryItem groceryItem = e.value;
        //     return GestureDetector(
        //       onTap: () {
        //         onItemClicked(context, groceryItem);
        //       },
        //       child: Container(
        //         padding: EdgeInsets.all(10),
        //         child: GroceryItemCardWidget(
        //           item: groceryItem,
        //           heroSuffix: "explore_screen",
        //         ),
        //       ),
        //     );
        //   }).toList(),
        //   mainAxisSpacing: 3.0,
        //   crossAxisSpacing: 0.0, // add some space
        // ),
      ),
    );
  }

  // void onItemClicked(BuildContext context, GroceryItem groceryItem) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ProductDetailsScreen(
  //         groceryItem,
  //         heroSuffix: "explore_screen",
  //       ),
  //     ),
  //   );
  // }
}

class FilterScreen {
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vegrow/consts/appConstant.dart';
import 'package:vegrow/controllers/homeController.dart';
import 'package:vegrow/controllers/productController.dart';
import 'package:vegrow/views/pages/MainBody/Vendors/tabs/Home/singleProductView.dart';

class Body extends StatelessWidget {
  HomeController homeController = Get.find();
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    print(productController.productList.length);
    Size size = MediaQuery.of(context).size;

    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderWithSearchBox(size: size),
        TitleWithMoreBtn(title: "Recomended", onPressed: () {}),
        Expanded(
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: RecomendPlantCard(
                productImage: AppConstant.illustration2,
                productName: "Onion",
                productDescription: "This is Awesome",
                productQuantity: "20",
                onTap: () {
                  Get.toNamed('/singleProductView');
                },
              ),
            );
          })
        ),
        TitleWithMoreBtn(title: "Featured Plants", onPressed: () {
          // Get.toNamed('/singleProductView');
        }),
        FeaturedPlants(),
        SizedBox(height: AppConstant.kDefaultPadding),
      ],
    );
  }
}

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            image: "assets/images/bottom_img_1.png",
            onTap: () {
              Get.toNamed('/singleProductView');
            },
          ),
          FeaturePlantCard(
            image: "assets/images/bottom_img_2.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  final String image;
  final Function()? onTap;
  const FeaturePlantCard({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: AppConstant.kDefaultPadding,
          top: AppConstant.kDefaultPadding / 2,
          bottom: AppConstant.kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  final Size size;
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    return Container(
      margin: EdgeInsets.only(bottom: AppConstant.kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: AppConstant.kDefaultPadding,
              right: AppConstant.kDefaultPadding,
              bottom: 36 + AppConstant.kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: AppConstant.kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Hello, ${homeController.farmerList[0]['fName'].toString().capitalize}',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset("assets/images/logo.png")
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin:
                  EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding, vertical: 0),
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 10),
                //     blurRadius: 50,
                //     color: AppConstant.kPrimaryColor.withOpacity(0.23),
                //   ),
                // ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: AppConstant.kPrimaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // surffix isn't working properly  with SVG
                        // thats why we use row
                        // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class RecomendsPlants extends StatelessWidget {
//   const RecomendsPlants({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: <Widget>[
//           ListTile(
//             onTap: (){},
//             child: RecomendPlantCard(
//               image: "assets/images/image_1.png",
//               title: "Samantha",
//               country: "Russia",
//               price: 440,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DetailsScreen(),
//                   ),
//                 );
//               },
//             ),
//           ),
//           RecomendPlantCard(
//             image: "assets/images/image_2.png",
//             title: "Angelica",
//             country: "Russia",
//             price: 440,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailsScreen(),
//                 ),
//               );
//             },
//           ),
//           RecomendPlantCard(
//             image: "assets/images/image_3.png",
//             title: "Samantha",
//             country: "Russia",
//             price: 440,
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

class RecomendPlantCard extends StatelessWidget {
  RecomendPlantCard({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productQuantity,
    required this.onTap,
  }) : super(key: key);

  final String productName, productDescription, productQuantity, productImage;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(
        left: AppConstant.kDefaultPadding,
        top: AppConstant.kDefaultPadding / 2,
        bottom: AppConstant.kDefaultPadding * 2.5,
      ),
      width: size.width * 0.6,
      // height: 200,
      child: Column(
        children: [
          Image.asset(productImage),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(AppConstant.kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: AppConstant.kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "${productName}\n".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),
                        ),
                        TextSpan(
                          text: "${productDescription}".toUpperCase(),
                          style: TextStyle(
                            color: AppConstant.kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${productQuantity}',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: AppConstant.kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
          TextButton(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20),
            // ),
            // color: AppConstant.kPrimaryColor,
            onPressed: onPressed,
            child: Text(
              "More",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: AppConstant.kDefaultPadding / 4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: AppConstant.kDefaultPadding / 4),
              height: 7,
              color: AppConstant.kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}

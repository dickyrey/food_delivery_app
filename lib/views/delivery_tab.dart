import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/views/product_details.dart';
import 'package:food_delivery_app/widgets/product_card.dart';

class DeliveryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recommended",
              style: kTitle1Style.copyWith(fontSize: 22.0),
            ),
            Container(
              width: double.infinity,
              height: 250.0,
              child: ListView.builder(
                itemCount: recommendedList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var product = recommendedList[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(product: product),
                        ),
                      );
                    },
                    child: ProductCard(
                      product: product,
                      isRecommended: true,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Image.asset(
                "assets/banner.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 25.0),
            GridView.builder(
              itemCount: recommendedList.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0 / 1.3,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemBuilder: (context, index) {
                var product = recommendedList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product),
                      ),
                    );
                  },
                  child: ProductCard(
                    product: product,
                    isRecommended: false,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

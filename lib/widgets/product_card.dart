import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isRecommended;
  ProductCard({this.product, this.isRecommended});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isRecommended
              ? Chip(
                  backgroundColor: kRedColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  label: Text(
                    "Top",
                    style: kChipStyle,
                  ),
                )
              : Container(),
          Expanded(
            child: Center(
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              style: kTitle1Style,
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("\$${product.price}.", style: kSubtitleStyle),
                Text("00", style: kSubtitle2Style),
              ],
            ),
            trailing: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kOrangeColor),
              ),
              child: Icon(
                Icons.add,
                color: kOrangeColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

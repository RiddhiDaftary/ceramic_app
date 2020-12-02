import 'package:ceramic_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({@required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      product.priceCode,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
//          Expanded(
//            child: Container(
//              width: 100,
//              height: 60,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10),
//                image: DecorationImage(
//                  image: NetworkImage(product.image),
//                  fit: BoxFit.cover,
//                ),
//              ),
//              child: Padding(
//                padding: EdgeInsets.all(8.0),
//                child: Text(
//                  product.priceCode,
//                  style: TextStyle(
//                    fontSize: 12,
//                    color: Colors.white,
//                    fontWeight: FontWeight.w300,
//                  ),
//                ),
//              ),
//            ),
//          ),
          Flexible(
            child: Container(
              width: 100,
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

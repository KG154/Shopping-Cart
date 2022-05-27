import 'package:badges/badges.dart';
import 'package:cartui/CartScreen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

int conter = 0;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _upDateUi() {
    if (mounted) {
      setState(() {});
    }
  }

  List<Modal> image = [
    Modal(
      image: 'Images/Orange.jpg',
      productName: 'Orange',
      price: 200,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Berries.jpg',
      productName: 'Berries',
      price: 300,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Lemons.jpg',
      productName: 'Lemons',
      price: 20,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Apples.jpg',
      productName: 'Apples',
      price: 1050,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Mangoes.jpg',
      productName: 'Mangoes',
      price: 10,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Dates.jpg',
      productName: 'Dates',
      price: 2000,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Rice.jpg',
      productName: 'Rice',
      price: 43,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Avocados.jpg',
      productName: 'Orange',
      price: 52,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Apples.jpg',
      productName: 'Orange',
      price: 140,
      quantity: 0,
      total: 0,
    ),
  ];

  List<Modal> _cartlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
        actions: [
          conter != 0
              ? Badge(
                  animationType: BadgeAnimationType.scale,
                  position: BadgePosition.topEnd(top: 0, end: 6),
                  badgeContent: Text(
                    conter > 99 ? "99+" : conter.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  child: IconButton(
                    onPressed: () async {
                      _cartlist.clear();
                      for (int i = 0; i < image.length; i++) {
                        var item = image[i];
                        if (item.quantity > 0) {
                          _cartlist.add(item);
                          print(_cartlist);
                        }
                      }

                      if (_cartlist.isEmpty) {
                        final snackBar = SnackBar(
                          content: Text('Please Choose Product'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CartScreen(_cartlist);
                          },
                        ));
                      }
                      _upDateUi();
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.shopping_cart),
                )
        ],
      ),
      body: ListView.builder(
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image(
                  height: 100,
                  width: 70,
                  image: AssetImage(image[index].image),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    image[index].productName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.currency_rupee),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(image[index].price.toString()),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (image[index].quantity > 0) {
                                    image[index].quantity--;
                                    if (conter > 0) {
                                      conter--;
                                    }
                                  }
                                });
                              },
                              child: Icon(Icons.remove)),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            color: Colors.white12,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              image[index].quantity.toString(),
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (image[index].quantity < 10000) {
                                    image[index].quantity++;
                                    if (conter < 10000) {
                                      conter++;
                                    }
                                  }
                                });
                              },
                              child: Icon(Icons.add)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Modal {
  final String image;
  final String productName;
  int price;
  int quantity;
  int total;

  Modal({
    required this.image,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.total,
  });
}

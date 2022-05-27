import 'package:badges/badges.dart';
import 'package:cartui/cartScreen2.dart';
import 'package:cartui/helper2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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

  List<Modal> _cartlist = [];
CartHelper _cart=CartHelper();

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 4, end: 6),
            badgeContent: Text(
              CartHelper.conter.toString(),
              style: TextStyle(color: Colors.white),
            ),
            animationDuration: Duration(milliseconds: 300),
            child: IconButton(
              onPressed: () async {
                _cartlist.clear();
                for (int i = 0; i < CartHelper.image.length; i++) {
                  var item = CartHelper.image[i];
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
                      return CartScreen();
                    },
                  ));

                  // fi = _cartlist;
                  // print(fi);
                  // fi.map((e) => print("hello"));
                }
                _upDateUi();
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: CartHelper.image.length,
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
                  image: AssetImage(CartHelper.image[index].image),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    CartHelper.image[index].productName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Column(
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
                          Text(CartHelper.image[index].price.toString()),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (CartHelper.image[index].quantity > 0) {
                                CartHelper.removeqty(CartHelper.image[index]);
                                CartHelper.updateCounter();


                              }
                            });
                          },
                          child: const Icon(Icons.remove),
                        ),
                        Container(
                          color: Colors.white12,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            CartHelper.image[index].quantity.toString(),
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (CartHelper.image[index].quantity < 100) {
                                CartHelper.addqty(CartHelper.image[index]);
                                CartHelper.updateCounter();

                              }
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


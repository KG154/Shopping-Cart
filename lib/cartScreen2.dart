import 'package:cartui/helper2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int shipping = 10;
  int subTotal = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < CartHelper.itemswithqty.length; i++) {
      int stotal = CartHelper.itemswithqty[i].price *
          CartHelper.itemswithqty[i].quantity;
      subTotal += stotal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      body: CartHelper.itemswithqty.length == 0
          ? Center(
              child: Text("No items In CArt"),
            )
          : Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: CartHelper.itemswithqty.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 70,
                                  width: 70,
                                  image: AssetImage(
                                      CartHelper.itemswithqty[index].image),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Item :- ${CartHelper.itemswithqty[index].productName}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Price :-",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Icon(
                                              Icons.currency_rupee,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              CartHelper
                                                  .itemswithqty[index].price
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, right: 5),
                                      child: Text(
                                        "Total Quantity",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            if (CartHelper.itemswithqty[index]
                                                    .quantity >
                                                0) {
                                              CartHelper.removeqty(CartHelper
                                                  .itemswithqty[index]);
                                              CartHelper.updateCounter();
                                              //
                                              setState(() {});
                                            }
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                        Container(
                                          color: Colors.white12,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            CartHelper
                                                .itemswithqty[index].quantity
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 25),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              if (CartHelper.itemswithqty[index]
                                                      .quantity <
                                                  100) {
                                                // CartHelper.image.singleWhere((element) => element==CartHelper.itemswithqty[index]).quantity++;
                                                CartHelper.addqty(CartHelper
                                                    .itemswithqty[index]);
                                                CartHelper.updateCounter();

                                                // CartHelper.itemTotalCount(CartHelper.itemswithqty[index]);

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
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10, right: 20),
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue.shade900),
                                  color: Colors.blue.shade100),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Your Amount"),
                                  Row(
                                    children: [
                                      const Icon(Icons.currency_rupee),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CartHelper.itemswithqty[index].quantity !=
                                              0
                                          ? Text(CartHelper
                                              .itemswithqty[index].total
                                              .toString())
                                          : Text('0'),
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
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      child: Container(
                        // height: 150,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 25, top: 20, bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SubTotal",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    CartHelper.subtotal.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.currency_rupee,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        shipping.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "${CartHelper.subtotal + shipping}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 50,
                                color: Colors.teal.shade300,
                                child: Text(
                                  "PROCEED TO CHECKOUT",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

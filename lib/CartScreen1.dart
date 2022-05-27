import 'package:cartui/main1.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  List<Modal> Cartlist;

  CartScreen(this.Cartlist);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var subTotal = 0;
  var shipping = 10;

  @override
  void initState() {
    for (int i = 0; i < widget.Cartlist.length; i++) {
      int stotal = widget.Cartlist[i].price * widget.Cartlist[i].quantity;
      subTotal += stotal;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      body: widget.Cartlist.length == 0
          ? Center(
              child: Text("Not Cart Product"),
            )
          : Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.Cartlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image(
                                        height: 70,
                                        width: 70,
                                        image: AssetImage(
                                            widget.Cartlist[index].image),
                                      ),
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Item :- ${widget.Cartlist[index].productName}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Price :-",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Icon(
                                                Icons.currency_rupee,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                widget.Cartlist[index].price
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // SizedBox(
                                //   width: 40,
                                // ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (widget.Cartlist[index]
                                                          .quantity >
                                                      0) {
                                                    widget.Cartlist[index]
                                                        .quantity--;
                                                    if (conter > 0) {
                                                      conter--;
                                                    }

                                                    int stotal = widget
                                                        .Cartlist[index].price;
                                                    subTotal -= stotal;
                                                    setState(() {
                                                      widget.Cartlist;
                                                    });
                                                    if (widget.Cartlist[index]
                                                            .quantity ==
                                                        0) {
                                                      widget.Cartlist.removeAt(
                                                          index);
                                                      setState(() {
                                                        widget.Cartlist;
                                                      });
                                                    }
                                                  }
                                                });
                                              },
                                              child: Icon(Icons.remove)),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            color: Colors.white12,
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              widget.Cartlist[index].quantity
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 25),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (widget.Cartlist[index]
                                                          .quantity <
                                                      10000) {
                                                    widget.Cartlist[index]
                                                        .quantity++;
                                                    if (conter < 10000) {
                                                      conter++;
                                                    }
                                                    int stotal = widget
                                                        .Cartlist[index].price;
                                                    subTotal += stotal;

                                                    setState(() {
                                                      widget.Cartlist;
                                                    });
                                                  }
                                                });
                                              },
                                              child: Icon(Icons.add)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
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
                                      widget.Cartlist[index].quantity != 0
                                          ? Text((widget.Cartlist[index].price *
                                                  widget
                                                      .Cartlist[index].quantity)
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
                                    subTotal.toString(),
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
                                    "${subTotal + shipping}",
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

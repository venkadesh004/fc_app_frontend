import 'package:flutter/material.dart';
import 'package:food_court/constants.dart';
import 'package:food_court/paymentSuccess.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    print(orders);
    print(orderPrice);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text("Your Orders", style: TextStyle(
                fontSize: 25,
              ),),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ListView.builder(
                itemCount: orders.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 20,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        height: 100,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(right: 20),
                              child: ClipRect(child: Image.asset(
                                  orders[index].itemImg)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                      "Item Name: ${orders[index]
                                          .itemName}"
                                  ),
                                ),
                                Container(
                                  child: Text(
                                      "Quantity: ${orders[index]
                                          .quantity}"
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      setState(() {
                                        orderPrice -=
                                            orders[index].price *
                                                orders[index].quantity;
                                        orders.removeAt(index);
                                      });
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                child: Text("Proceed to Pay", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSuccess()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  backgroundColor: Color.fromRGBO(210, 29, 94, 1)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

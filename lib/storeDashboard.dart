import 'package:flutter/material.dart';
import 'package:food_court/constants.dart';
import 'package:food_court/storeProfile.dart';

class StoreDashboard extends StatefulWidget {
  const StoreDashboard({super.key});

  @override
  State<StoreDashboard> createState() => _StoreDashboardState();
}

class _StoreDashboardState extends State<StoreDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StoreProfile()));
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Your Orders",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: orders.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    print(orders[index].storeName);
                    if (orders[index].storeName == 'Store 1') {
                      return Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: 150,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 20),
                                  child: ClipRect(
                                      child:
                                          Image.asset(orders[index].itemImg)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                          "Item Name: ${orders[index].itemName}"),
                                    ),
                                    Container(
                                      child: Text(
                                          "Quantity: ${orders[index].quantity}"),
                                    ),
                                    Container(
                                      child: Text(
                                          "Payment Code: 12345"),
                                    ),
                                    Container(
                                      child: ElevatedButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          setState(() {
                                            orderPrice -= orders[index].price *
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
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

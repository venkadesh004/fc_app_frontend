import 'package:flutter/material.dart';
import 'package:food_court/constants.dart';
import 'package:food_court/dashboard.dart';

class Item extends StatefulWidget {
  const Item({super.key, required this.index});

  final index;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  var itemPrice = 0;
  var quantity = 0;
  var overallPrice = 0;

  @override
  void initState() {
    itemPrice = specials[widget.index].price;
    overallPrice = orderPrice;
  }

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  specials[widget.index].itemName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: 300,
                height: 300,
                margin: const EdgeInsets.only(top: 20),
                child: ClipRect(
                    child: Image.asset(
                  specials[widget.index].itemImg,
                  fit: BoxFit.contain,
                )),
              ),
              Container(child: Text("Price: Rs ${itemPrice}", style: TextStyle(fontSize: 18),), margin: const EdgeInsets.all(20),),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text("Quantity: ", style: TextStyle(fontSize: 18),),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 50,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("-"),
                              onPressed: () {
                                if (quantity > 0) {
                                  setState(() {
                                    quantity--;
                                    overallPrice -= itemPrice;
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text("${quantity}", style: TextStyle(fontSize: 18),),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 50,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("+"),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                  overallPrice += itemPrice;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  "Overall Price: ${overallPrice}",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: 100,
                height: 50,
                child: ElevatedButton(
                  child: Text("Save Orders", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    if (overallPrice > 0 && quantity > 0) {
                      setState(() {
                        orderPrice = overallPrice;
                        orders.add(
                          SelectedItems(quantity: quantity, itemImg: specials[widget.index].itemImg, itemName: specials[widget.index].itemName, price: specials[widget.index].price)
                        );
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(210, 29, 94, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_court/Item.dart';
import 'package:food_court/orders.dart';
import 'package:food_court/signInPage.dart';
import 'package:food_court/userProfile.dart';
import 'constants.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.restaurant_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
            },
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                'Choose the',
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
              Container(
                child: Text(
                  'Food you Love',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(210, 29, 94, 1),
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(210, 29, 94, 1), width: 2)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(210, 29, 94, 1),
                      ),
                      onPressed: () {},
                    ),
                    labelText: 'Search Food Here Foody',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  "Today's Specials: ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specials.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: FoodItem(index: index),
                    );
                  },
                ),
              ),
              Container(
                child: Text(
                  "Today's Treats!!!",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: (specials.length * 100) % 2 == 0 ? (specials.length * 100) : (specials.length * 100) - 100,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemCount: specials.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 200,
                      child: SingleItem(
                        index: index,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class FoodItem extends StatefulWidget {
  const FoodItem({super.key, required this.index});

  final index;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Item(index: widget.index)));
      },
      child: Container(
        width: 100,
        height: 150,
        child: Column(
          children: [
            Container(
              child: Image.asset(specials[widget.index].itemImg),
              width: 100,
              height: 100,
            ),
            Container(
              child: Text(
                specials[widget.index].itemName,
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleItem extends StatefulWidget {
  const SingleItem({super.key, required this.index});

  final index;

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Item(index: widget.index)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(2, 2))
        ], color: Colors.white,
        borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(specials[widget.index].itemImg),
              height: 100,
            ),
            Container(
              child: Text(specials[widget.index].itemName),
            ),
            Container(
              child: Text('Price: Rs. ${specials[widget.index].price}'),
            ),
            Container(
              child: Text('Available at: ${specials[widget.index].storeName}'),
            )
          ],
        ),
      ),
    );
  }
}

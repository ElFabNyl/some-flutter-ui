import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:food/data/data.dart';
import 'package:food/screens/CartScreen.dart';
import 'package:food/widgets/NearByRestaurant.dart';
import 'package:food/widgets/RecentOrders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
          ),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: Text('Food Delivery'),
        centerTitle: true,
        shadowColor: Colors.grey,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Badge(
              showBadge: true,
              badgeContent: Text(
                '${currentUser.cart.length}',
                style: TextStyle(color: Colors.red),
              ),
              alignment: Alignment.topLeft,
              shape: BadgeShape.circle,
              badgeColor: Colors.white70,
              child: IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return CartScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {},
                ),
                hintText: 'Search food or Restaurant',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 8.0, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          RecentOrders(),
          NearByRestaurant(),
        ],
      ),
    );
  }
}

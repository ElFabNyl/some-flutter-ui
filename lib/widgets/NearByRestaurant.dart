import 'package:flutter/material.dart';
import 'package:food/data/data.dart';
import 'package:food/models/restaurant.dart';
import 'package:food/screens/Restaurant_screen.dart';
import 'package:food/widgets/rating_stars.dart';

class NearByRestaurant extends StatefulWidget {
  @override
  _NearByRestaurantState createState() => _NearByRestaurantState();
}

class _NearByRestaurantState extends State<NearByRestaurant> {
  buildRestaurant() {
    List<Widget> restaurantList = [];

    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> RestaurantScreen(restaurant: restaurant),),);},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 1.0, color: Colors.grey),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Hero(
                      tag: restaurant.imageUrl,
                      child: Image.asset(
                        restaurant.imageUrl,
                        height: 150.0,
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            restaurant.name,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          RatingStars(rating: restaurant.rating),
                          Text(
                            restaurant.address,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            '0.2 miles away',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Nearby Restaurants',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
          ),
        ),
        buildRestaurant(),
      ],
    );
  }
}



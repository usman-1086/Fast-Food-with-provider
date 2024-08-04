import 'package:fastfood/model/cart_model.dart';
import 'package:fastfood/widgets/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
      },
      backgroundColor: Colors.black,
      child: Icon(Icons.shopping_bag,color: Colors.white,),),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Good Morning,'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Let's order cheesy food for you",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),

            SizedBox(height: height*0.03,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            
            SizedBox(height: height*0.02,),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Our Items',style: TextStyle(fontSize: 16),),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (BuildContext context, CartModel value, Widget? child) {
                  return GridView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: value.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                       return FoodTile(
                           name: value.shopItems[index][0],
                           price: 'Rs ' + value.shopItems[index][1],
                           image: value.shopItems[index][2],
                         color: value.shopItems[index][3],
                         onPressed: (){
                             Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                         },
                       );
                    },);
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}

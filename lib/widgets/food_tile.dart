import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {

  final String name;
  final String price;
  final String image;
  final color;
  void Function()? onPressed;

  FoodTile({super.key, required this.name, required this.price, required this.image, this.color,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color[100],
        borderRadius: BorderRadius.circular(12)
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Image.asset(image,height: 64,),
            
            Text(name),

            MaterialButton(onPressed: onPressed,
            color: color,
              child: Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}

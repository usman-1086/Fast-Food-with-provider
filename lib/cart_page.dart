import 'package:fastfood/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        centerTitle: true,
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          children: [

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Image.asset(value.cartItems[index][2], height: 36),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text(value.cartItems[index][1]),
                        trailing: IconButton(
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false).removeItemFromCart(index);
                          },
                          icon: Icon(Icons.cancel),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          'Rs ' + value.calculateTotal(),
                          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )

          ],
        );
      }),
    );
  }
}

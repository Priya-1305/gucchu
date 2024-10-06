import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final List<String> orderItems;
  final double totalPrice;

  OrderScreen({required this.orderItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(orderItems[index]), // Display each ordered item
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Total Items:'),
            trailing: Text('${orderItems.length}'), // Total number of items
          ),
          ListTile(
            title: Text('Total Price:'),
            trailing: Text(
                '\$${totalPrice.toStringAsFixed(2)}'), // Display total price
          ),
          ListTile(
            title: Text('Estimated Day of Arrival:'),
            trailing: Text('5-7 Days'), // Estimated delivery
          ),
        ],
      ),
    );
  }
}

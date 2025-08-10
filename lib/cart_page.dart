import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cartprovider.dart';
//import 'package:shop_app_flutter/global_veriable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context
        .watch<Cartprovider>().cart; //Provider.of<Cartprovider>(context).cart;
    // it basically went ahed in the widget tree and searched for the provider of string type and printed it
    return Scaffold(
      // if insted of material app the provider was at home page thhen it would first print the values of home page as it went up the widget tree
      appBar: AppBar(title: Center(child: Text('Cart'))),

      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 31,
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      content: Text('Really Want To Delete Cart Items'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'NO',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<Cartprovider>(
                              context,
                              listen: false,
                            ).removeProduct(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'YES',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ); //Dialog(child: Text('Are You Sure'));
                  },
                );
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
            title: Text(cartItem['title '].toString()),
            subtitle: Text(
              'Size: ${cartItem['Sizes']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}


//types of provider 
// Provider                     ,,read only value (just reads the value in widget tree)
//ChangeNotifierProvider   /|\     ,,can change the values and notify the widgets about the change
//FutureProvider                ,,can listen to futures and change them
//StreamProvider                ,,providing a stream




















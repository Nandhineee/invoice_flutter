import 'package:flutter/material.dart';
import 'package:invoice/presentation/view/details_page/discount_info.dart';
import 'package:invoice/presentation/view/details_page/invoice_info.dart';
import 'package:invoice/presentation/view/details_page/item_info.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/payment.dart';


class item_details extends StatefulWidget {
  const item_details({super.key});

  @override
  State<item_details> createState() => _item_detailsState();
}

class _item_detailsState extends State<item_details> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 17.0, left: 17.0, top: 20.0),
        child: Container(
          height: 420.0,
          width: 400.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2.0,
                blurRadius: 8.0,
                offset: Offset(4.0, 4.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.shopping_cart, color: Colors.black),
                    SizedBox(width: 8.0),
                    Text('Items', style: TextStyle(fontSize: 20.0)),
                  ],
                ),
                const SizedBox(height: 20.0),
                 InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item_info()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.black),
                        SizedBox(width: 8.0),
                        Text('Add item', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('SubTotal', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.indigo[900]),),
                      Text('0.00', style: TextStyle(fontSize: 16,color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                // Row for the discount icon, text, and greater than symbol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items on both ends
                  children: <Widget>[
                    // Container for the discount icon and text on the left
                   const  Row(
                      children: <Widget>[
                        Icon(Icons.discount, color: Colors.black), // Discount icon
                        SizedBox(width: 8.0), // Spacing between icon and text
                        Text('Discount', style: TextStyle(fontSize: 16.0)), // Discount text
                      ],
                    ),
                    // IconButton for the greater than icon on the right
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.indigo[900]),
                      onPressed: () {
                        showDiscountDialog(context);
                      },
                    ),

                  ],

                ),

                SizedBox(height: 20.0),
                // Row for the discount icon, text, and greater than symbol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items on both ends
                  children: <Widget>[
                    // Container for the discount icon and text on the left
                   const  Row(
                      children: <Widget>[
                        Icon(Icons.account_balance, color: Colors.black), // Discount icon
                        SizedBox(width: 8.0), // Spacing between icon and text
                        Text('Tax', style: TextStyle(fontSize: 16.0)), // Discount text
                      ],
                    ),
                    // IconButton for the greater than icon on the right
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.indigo[900]),
                      onPressed: () {
                        showTaxDialog(context);
                      },
                    ),

                  ],

                ),
                SizedBox(height: 20.0),
                // Row for the discount icon, text, and greater than symbol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items on both ends
                  children: <Widget>[
                    // Container for the discount icon and text on the left
                    const Row(
                      children: <Widget>[
                        Icon(Icons.local_shipping, color: Colors.black), // Discount icon
                        SizedBox(width: 8.0), // Spacing between icon and text
                        Text('Shipping', style: TextStyle(fontSize: 16.0)), // Discount text
                      ],
                    ),
                    // IconButton for the greater than icon on the right
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.indigo[900]),
                      onPressed: () {
                        showShippingDialog(context);
                      },
                    ),

                  ],

                ),

                SizedBox(height: 20.0,width: 200.0,),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
                      Text('0.00', style: TextStyle(fontSize: 16,color: Colors.white)),
                    ],
                  ),
                ),

              ],

            ),
          ),

        ),

      ),

    );
    



  }
}

void showDiscountDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.indigo[900]),
                ),
                SizedBox(height: 16),Container(
                  padding: EdgeInsets.all(8.0),
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(

                      hintText: '0%',
                    ),
                    style: TextStyle(fontSize: 16.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement save functionality here
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }    );

}
void showTaxDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tax',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.indigo[900]),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(

                      hintText: 'Enter tax name',
                    ),
                    style: TextStyle(fontSize: 16.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(

                      hintText: '0%',
                    ),
                    style: TextStyle(fontSize: 16.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement save functionality here
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
      );

}
void showShippingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Shipping Amount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.indigo[900]),
                ),
                SizedBox(height: 16),Container(
                  padding: EdgeInsets.all(8.0),
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(

                      hintText: '0',
                    ),
                    style: TextStyle(fontSize: 16.0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement save functionality here
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }    );

}


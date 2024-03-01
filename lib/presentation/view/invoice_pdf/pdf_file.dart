import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class invoicepdf extends StatefulWidget {
  const invoicepdf({super.key, required this.invoiceId, required this.invoiceName, required this.dueTerms, required this.createdDate, required this.DueDate, required this.businessWebsite, required this.businessEmailAddress, required this.businessBillingAddress, required this.clientName, required this.clientPhone, required this.clientShippingAddress, required this.clientBillingAddress, required this.clientEmailAddress, required this.discount, required this.tax, required this.shipping, required this.itemId, required this.itemName, required this.itemPrice, required this.quantity, required this.itemDiscount, required this.itemTax});
  final String invoiceId;
  final String invoiceName;
  final String dueTerms;
  final DateTime createdDate;
  final DateTime DueDate;
  final String businessWebsite;
  final String businessEmailAddress;
  final String businessBillingAddress;
  final String clientName;
  final num clientPhone;
  final String clientShippingAddress;
  final String clientBillingAddress;
  final String clientEmailAddress;
  final String  discount;
  final String tax;
  final String shipping;
  final String itemId;
  final String itemName;
  final num itemPrice;
  final num quantity;
 final  num itemDiscount;
  final num itemTax;


  @override
  State<invoicepdf> createState() => _invoicepdfState();
}

class _invoicepdfState extends State<invoicepdf> {

  late String invoiceId;
  late String invoiceName;
  late String dueTerms;
  late DateTime createdDate;
  late DateTime DueDate;
  late String businessWebsite;
  late String businessEmailAddress;
  late String businessBillingAddress;
  late String clientName;
  late num clientPhone;
  late String clientShippingAddress;
  late String clientBillingAddress;
  late String clientEmailAddress;
  late String  discount;
  late String tax;
  late String shipping;
  late String itemId;
 late  String itemName;
  late num itemPrice;
  late num quantity;
  late num itemDiscount;
  late num itemTax;


  final List<Map<String, dynamic>> _items = [];

  // Method to add a new item
  void _addItem() {
    setState(() {
      _items.add({
        'description': 'New Item',
        'quantity': 1,
        'price': 10.0,
        'total': 10.0, // Assuming total is quantity * price for simplicity
      });
    });
  }
  @override
  void initState() {
    super.initState();
    invoiceId=widget.invoiceId;
    clientName=widget.clientName;
    invoiceName=widget.invoiceName;
    dueTerms=widget.dueTerms;
    createdDate=widget.createdDate;
    DueDate=widget.DueDate;
    businessWebsite=widget.businessWebsite;
    businessEmailAddress=widget.businessEmailAddress;
    businessBillingAddress=widget.businessBillingAddress;
    clientPhone=widget.clientPhone;
     clientShippingAddress=widget.clientShippingAddress;
    clientBillingAddress=widget.clientBillingAddress;
    clientEmailAddress=widget.clientEmailAddress;
      discount=widget.discount;
     tax=widget.tax;
    shipping=widget.shipping;
     itemId=widget.itemId;
     itemName=widget.itemName;
    itemPrice=widget.itemPrice;
     quantity=widget.quantity;
     itemDiscount=widget.itemDiscount;
    itemTax=widget.itemTax;


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$invoiceId'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to start
          children: <Widget>[
            Text('$invoiceName', style: Theme.of(context).textTheme.headline5),
            Text('$clientBillingAddress', style: Theme.of(context).textTheme.bodyText2),
            Text('$businessEmailAddress', style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 20),
            Divider(),
            Text('Bill To:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text('$clientName', style: Theme.of(context).textTheme.subtitle1),
            Text('$clientShippingAddress', style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 20),
            Divider(),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
                ..._items.map((item) {
                  return TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(item['$itemName']),
                    ),
                    Text(item['$quantity'].toString()),
                    Text('\$${item['$itemPrice']}'),
                    Text('\$${item['$quantity*$itemPrice']}'),
                  ]);
                }).toList(),
              ],
            ),

            SizedBox(height: 20),
            Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('Subtotal: $quantity*$itemPrice', style: Theme.of(context).textTheme.subtitle1),
                  Text('Tax (10%): $itemTax', style: Theme.of(context).textTheme.subtitle1),
                  Text('Total: $quantity*$itemPrice+$itemTax', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns the buttons to each end
              children: <Widget>[
                ElevatedButton(
                  onPressed: _addItem, // Call _addItem when the button is pressed
                  child: Text('Add Item'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for function to generate and open PDF
                  },
                  child: Text('Generate PDF'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

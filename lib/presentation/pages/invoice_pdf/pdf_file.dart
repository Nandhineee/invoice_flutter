import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:invoice/domain/models/item.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class invoicepdf extends StatefulWidget {


   invoicepdf({super.key,  required this.invoiceName,
     required this.dueTerms, required this.createdDate, required this.DueDate,
     required this.businessWebsite, required this.businessEmailAddress,
     required this.businessBillingAddress, required this.clientName,
     required this.clientPhone, required this.clientShippingAddress,
     required this.clientBillingAddress, required this.clientEmailAddress,
     required this.discount, required this.tax, required this.shipping,
      required this.invoiceId,required this.itemList});
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
   final List<Item> itemList;



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
  late List<Item> itemsList;


   final List<Map<String, dynamic>> _items = [];


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
    itemsList = widget.itemList;
    // itemId=widget.itemId;
    // itemName=widget.itemName;
    // itemPrice=widget.itemPrice;
    // quantity=widget.quantity;
    // itemDiscount=widget.itemDiscount;
    // itemTax=widget.itemTax;
print("$itemsList   pdf");

  }


  Future<void> generateInvoicePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Invoice #123', style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.Text('Date: ${DateTime.now().toString().split(' ')[0]}'),
              pw.Divider(),
              pw.SizedBox(height: 20),
              pw.Text('Items:', style: pw.TextStyle(fontSize: 18)),
              pw.ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  final item = itemsList[index];
                  return pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(item.name, style: pw.TextStyle(fontSize: 14)),
                      pw.Text('${item.discount} x \$${item.price.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 14)),
                    ],
                  );
                },
              ),
              pw.Divider(),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  'Total: \$${itemsList.fold(0.0, (double total, item) => total + item.price * item.discount).toStringAsFixed(2)}',
                  style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );

    // Use the Printing package to share the PDF via the system share dialog:
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'invoice.pdf');
  }




  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('$invoiceId'),
    //     backgroundColor: Colors.blue,
    //   ),
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.all(16),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start, // Align items to start
    //       children: <Widget>[
    //         Text(invoiceName, style: Theme.of(context).textTheme.headline5),
    //         Text(clientBillingAddress, style: Theme.of(context).textTheme.bodyText2),
    //         Text(businessEmailAddress, style: Theme.of(context).textTheme.bodyText2),
    //         const SizedBox(height: 20),
    //         const Divider(),
    //         const Text('Bill To:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    //         Text(clientName, style: Theme.of(context).textTheme.subtitle1),
    //         Text(clientShippingAddress, style: Theme.of(context).textTheme.bodyText1),
    //         const SizedBox(height: 20),
    //         const Divider(),
    //         // Use a Container with a fixed height for the ListView.builder
    //         Container(
    //           height: 200, // Specify a fixed height
    //           child: ListView.builder(
    //             itemCount: itemsList.length, // +1 for the header
    //             itemBuilder: (BuildContext context, int index) {
    //               // if (index == 0) {
    //
    //                 // Return the header
    //                 return Padding(
    //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children:  [
    //                       // Expanded(flex: 3, child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold))),
    //                       // Expanded(child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold))),
    //                       // Expanded(child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold))),
    //                       // Expanded(child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold))),
    //                     Expanded(flex: 3, child: Text( itemsList[index].name)),
    //                     Expanded(child: Text( itemsList[index].quantity .toString())),
    //                     Expanded(child: Text(itemsList[index].price.toString())),
    //                     Expanded(child: Text((itemsList[index].quantity * itemsList[index].price) .toString())
    //                     )],
    //                   ),
    //                 );
    //               // } else {
    //                 // Return an item
    //                 final item = _items[index - 1]; // Adjust index for the header
    //                 return Padding(
    //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       Expanded(flex: 3, child: Text( itemsList[index].name)),
    //                       Expanded(child: Text( itemsList[index].quantity .toString())),
    //                       Expanded(child: Text(itemsList[index].price.toString())),
    //                       Expanded(child: Text((itemsList[index].quantity * itemsList[index].price) .toString())
    //                       )],
    //                   ),
    //                 );
    //               }
    //             // },
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         const Divider(),
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: <Widget>[
    //               Text('Subtotal: ...', style: Theme.of(context).textTheme.subtitle1), // Placeholder
    //               Text('Tax (10%): ...', style: Theme.of(context).textTheme.subtitle1), // Placeholder
    //               Text('Total: ...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Placeholder
    //             ],
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns the buttons to each end
    //           children: <Widget>[
    //             ElevatedButton(
    //               onPressed: _addItem, // Call _addItem when the button is pressed
    //               child: const Text('Add Item'),
    //               style: ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.all(Colors.blue),
    //                 foregroundColor: MaterialStateProperty.all(Colors.white),
    //               ),
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 // Placeholder for function to generate and open PDF
    //               },
    //               child: const Text('Generate PDF'),
    //               style: ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.all(Colors.green),
    //                 foregroundColor: MaterialStateProperty.all(Colors.white),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   )
    //
    // );
    return Scaffold(appBar: AppBar(
      title:const  Text(
        'Invoice Details',
        style: TextStyle(
          color: Colors.white, // Set your desired color here
        ),
      ),
      backgroundColor: Colors.blue.shade900,
    ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$invoiceId', style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 10),
                  Text('Date: ${DateTime.now().toString().split(' ')[0]}'),
                  SizedBox(height: 20),

                  Divider(),
                  Text('Items', style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(itemsList[index].name),
                        subtitle: Text('Quantity: ${itemsList[index].discount}'),
                        trailing: Text('\$${itemsList[index].price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Total: \$${itemsList.fold(0.0, (double total, item) => total + item.price * item.discount).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: TextButton(
                onPressed: generateInvoicePDF,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue.shade900, // Text color
                ),
                child: Text('Generate PDF'),
              ),
            ),
          ),
        ],
      ),


    );

  }
}

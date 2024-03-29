import 'package:flutter/material.dart';
import 'package:invoice/domain/models/invoice_list.dart';

class unpaid extends StatefulWidget {
  const unpaid({super.key});

  @override
  State<unpaid> createState() => _unpaidState();
}

class _unpaidState extends State<unpaid> {
  late List<Invoice> invoices;

  @override
  void initState() {
    super.initState();
    invoices = invoice;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: invoice.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                // Adjust space around each container for better visibility of the shadow
                decoration: BoxDecoration(
                  color: Colors.white70,
                  // Background color of the container
                  borderRadius: BorderRadius.circular(10.0),
                  // Border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      // Shadow color with opacity
                      spreadRadius: 2,
                      // Spread radius
                      blurRadius: 7,
                      // Blur radius
                      offset: const Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  leading:  CircleAvatar(
                    backgroundColor: Colors.blue[900],
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Align items to the start
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // Align text to the start of the column
                            children: <Widget>[
                              Text(
                                invoice[index].invoiceName,
                                style: TextStyle(
                                  fontSize: 20.0, // Size of the first text
                                ),
                              ),
                              Text(
                                invoice[index].invoiceId,
                                // Your additional text
                                style: const TextStyle(
                                  fontSize:
                                  20.0, // Adjust the size as per your need
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.edit, // Edit icon
                              size: 20.0, // Adjust the size as per your need
                              color: Colors.black, // Adjust the color as per your need
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              '₹${invoice[index].price.toString()}',
                              style: const TextStyle(
                                fontSize: 15.0, // You can adjust the size as per your need
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  // Add trailing widget if needed
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

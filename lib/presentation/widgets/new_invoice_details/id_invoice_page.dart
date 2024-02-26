import 'package:flutter/material.dart';
import 'package:invoice/presentation/view/details_page/invoice_info.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/item_details.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/payment.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/user_info.dart';

class id_info extends StatefulWidget {
  const id_info({super.key});

  @override
  State<id_info> createState() => _id_infoState();
}

class _id_infoState extends State<id_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(right: 17.0, left: 17.0, top: 20.0),
              child: Container(
                height: 100.0, // Increased height to better fit the content
                width: 400.0, // Increased width for the same reason
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  // Ensures the container is rectangular
                  borderRadius: BorderRadius.circular(10.0),
                  // Gives rounded corners for a nicer look
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      // Shadow color with opacity
                      spreadRadius: 2.0,
                      // Spread radius
                      blurRadius: 8.0,
                      // Blur radius
                      offset:
                          Offset(4.0, 4.0), // X, Y offset from the container
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Centers the column vertically within the container
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Centers the column's children horizontally
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'INVOOOO1',
                            style: TextStyle(
                              fontSize: 35.0,
                              // Adjusted font size for better visibility
                              color: Colors.black,
                              fontWeight:
                                  FontWeight.bold, // Makes the text bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Nandhini',
                            style: TextStyle(
                              fontSize: 16.0, // Similarly adjusted
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Text(
                            'created on 22/02/2024',
                            style: TextStyle(
                              fontSize: 14.0, // Similarly adjusted
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            color: Colors.blue[900]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const invoice_info()),
                          );
                          print("Greater than icon pressed");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            user_info(),
            item_details(),
            payment_info()
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const invoice_info()),
          );
          print('Floating Action Button Pressed');
        },
        // The add symbol
        backgroundColor: Colors.blue[900],

        shape: const CircleBorder(),
        child:  const Icon(Icons.send_outlined),// Background color of the button
      ),

    );
  }
}

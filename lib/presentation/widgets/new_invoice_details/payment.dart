import 'package:flutter/material.dart';
import 'package:invoice/presentation/view/details_page/invoice_info.dart';
import 'package:invoice/presentation/view/invoice_app.dart';

class payment_info extends StatefulWidget {
  const payment_info({super.key});

  @override
  State<payment_info> createState() => _payment_infoState();
}

class _payment_infoState extends State<payment_info> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.only(right: 17.0, left: 17.0, top: 20.0),
            child: Container(
              height: 150.0, // Increased height to better fit the content
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
                    offset: Offset(4.0, 4.0), // X, Y offset from the container
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                payment_info()), // Navigate to InvoiceInfo page
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      // Adjust this for desired left alignment
                      child: Text(
                        "Payment Info",
                        style: TextStyle(
                          color: Colors.grey, // Text color
                          fontSize: 16.0, // Font size
                          fontWeight: FontWeight.bold, // Font weight
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 17.0, left: 17.0),
                    child: Container(
                      height: 1.0,
                      color: Colors.black, // Color for the line
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TestApp()), // Navigate to InvoiceInfo page
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      // Adjust this for desired left alignment
                      child: Text(
                        "Notes",
                        style: TextStyle(
                          color: Colors.grey, // Text color
                          fontSize: 16.0, // Font size
                          fontWeight: FontWeight.bold, // Font weight
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 50.0, right: 17.0, left: 17.0),
                  //   child: Container(
                  //     height: 1.0,
                  //     color: Colors.black, // Color for the line
                  //   ),
                  // ),
                ],
              ),
            )));
  }
}

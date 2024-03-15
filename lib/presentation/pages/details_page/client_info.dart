import 'package:flutter/material.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/id_invoice_page.dart';

class client_info extends StatefulWidget {
  const client_info({super.key, required this.clientPhone, required this.clientBillingAddress, required this.clientShippingAddress,
    required this.clientName, required this.clientEmailAddress});
  final  String clientName;
  final String clientEmailAddress;
 final num clientPhone;
 final  String clientBillingAddress ;
  final String clientShippingAddress ;



  @override
  State<client_info> createState() => _business_infoState();

}

class _business_infoState extends State<client_info> {
  final _formKey = GlobalKey<FormState>();

  late  String clientName;
  late String clientEmailAddress;
  late num clientPhone;
  late  String clientBillingAddress ;
  late String clientShippingAddress ;


  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _clientEmailAddressController = TextEditingController();
  final TextEditingController _clientPhoneController = TextEditingController();
  final TextEditingController _clientBillingController = TextEditingController();
  final TextEditingController _clientshippingController = TextEditingController();


  @override
  void initState() {
    super.initState();
    clientName=widget.clientName;
    clientEmailAddress=widget.clientEmailAddress;
    clientPhone=widget.clientPhone;
    clientBillingAddress=widget.clientBillingAddress;
    clientShippingAddress=widget.clientShippingAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);

              print('Back button pressed');
            },
          ),
          title: const Center(
            child: Text(
              "New Client",
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Check if form is valid
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, proceed with your submission logic
                  print('Form is valid');

                  // Retrieving the values from the controllers
                  String clientName = _clientNameController.text;
                  String clientEmailAddress = _clientEmailAddressController.text;
                  String clientPhone = _clientPhoneController.text;
                  String clientBillingAddress = _clientBillingController.text;
                  String clientShippingAddress = _clientshippingController.text;

                  Map<String, dynamic> invoiceClientData = {
                    'clientName': clientName,
                    'clientEmailAddress': clientEmailAddress,
                    'clientPhone': clientPhone.toString(), // Convert numeric phone to String
                    'clientBillingAddress': clientBillingAddress,
                    'clientShippingAddress': clientShippingAddress,
                  };

                  // Here you can do whatever you need with the collected data,
                  // for example, print it to the console or send it to a server
                  print('Client Name: $clientName');
                  print('Client Email: $clientEmailAddress');
                  print('Client Phone: $clientPhone');
                  print('Client Billing Address: $clientBillingAddress');
                  print('Client Shipping Address: $clientShippingAddress');

                  // Implement your submission logic here, such as sending data to a server or navigating to another screen
                  Navigator.pop(context, invoiceClientData);
                } else {
                  // If the form is not valid, you might want to notify the user or handle it accordingly
                  print('Form is not valid');
                }
              },
            ),

          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 17.0, left: 17.0, top: 20.0),
                child: Container(
                  height: 1400.0, // Adjust container height as needed
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
                        offset: const Offset(4.0, 4.0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Invoice Number Field with Text and Star Symbol
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Client Name",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              controller: _clientNameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter client name',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the client name';
                                }
                                return null;
                              },

                            ),
                          ),
                          SizedBox(height: 20.0),
                          // Create Date Field
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Email Address",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              controller: _clientEmailAddressController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter client email address',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email address';
                                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },

                            ),
                          ),
                          SizedBox(height: 20.0),
                          // Create Date Field
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Phone",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              controller: _clientPhoneController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter client phone number',
                              ),
                              style: TextStyle(fontSize: 16.0),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a phone number';
                                  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                    return 'Enter a valid 10-digit phone number';
                                  }
                                  return null;
                                },

                            ),
                          ),

                          SizedBox(height: 20.0),
                          // Create Date Field
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Billing Address",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              controller: _clientBillingController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter address line1',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the billing address';
                                }
                                return null;
                              },
                            ),
                          ),



                          SizedBox(height: 20.0),
                          // Create Date Field
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Shipping Address",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "*",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              controller: _clientshippingController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter address line1',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the shipping address';
                                }
                                return null;
                              },

                            ),
                          ),
                          // SizedBox(height: 5.0),
                          // Container(
                          //   padding: EdgeInsets.all(8.0),
                          //   width: 400,
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey[200],
                          //     borderRadius: BorderRadius.circular(5.0),
                          //   ),
                          //   child: TextFormField(
                          //     decoration: const InputDecoration(
                          //       border: InputBorder.none,
                          //       hintText: 'Enter address line2',
                          //     ),
                          //     style: TextStyle(fontSize: 16.0),
                          //     validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter the shipping address';
                          //     }
                          //     return null;
                          //   },
                          //
                          //   ),
                          // ),
                         // SizedBox(height: 20.0,),
                         //  RichText(
                         //    text: const TextSpan(
                         //      children: [
                         //        TextSpan(
                         //          text: "Client Details(Not show on invoice)",
                         //          style: TextStyle(
                         //            fontSize: 15.0,
                         //            color: Colors.black,
                         //          ),
                         //        ),
                         //        TextSpan(
                         //          text: "*",
                         //          style: TextStyle(
                         //            fontSize: 15.0,
                         //            color: Colors.red,
                         //          ),
                         //        ),
                         //      ],
                         //    ),
                         //  ),
                          // SizedBox(height: 10.0),
                          // Container(
                          //   padding: EdgeInsets.all(8.0),
                          //   width: 400,
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey[200],
                          //     borderRadius: BorderRadius.circular(5.0),
                          //   ),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       const Text(
                          //         'Enter client name',
                          //         style: TextStyle(
                          //           fontSize: 16.0, // Match the text field font size
                          //           color: Colors.grey, // Use a color similar to the hint text
                          //         ),
                          //       ),
                          //       TextFormField(
                          //         decoration: const InputDecoration(
                          //           border: InputBorder.none,
                          //           contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                          //         ),
                          //         style: TextStyle(fontSize: 16.0),
                          //         validator: (value) {
                          //           if (value == null || value.isEmpty) {
                          //             return 'Please enter client details';
                          //           }
                          //           return null;
                          //         },
                          //
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 20.0),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}

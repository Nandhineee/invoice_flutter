import 'package:flutter/material.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/id_invoice_page.dart';

class business_info extends StatefulWidget {
  const business_info({super.key, required this.businessName, required this.businessEmailAddress, required this.businessPhone, required this.businessBillingAddress, required this.businessWebsite});

  final String businessName;
  final String businessEmailAddress;
  final num businessPhone;
  final String businessBillingAddress;
 final  String businessWebsite;

  @override
  State<business_info> createState() => _business_infoState();

}

class _business_infoState extends State<business_info> {
  late String businessName;
  late String businessEmailAddress;
  late num businessPhone;
  late String businessBillingAddress;
  late  String businessWebsite;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessEmailContorller = TextEditingController();
  final TextEditingController _businessPhoneController = TextEditingController();
  final TextEditingController _businessBillingContorller = TextEditingController();
  final TextEditingController _businessWebsiteContorller = TextEditingController();



  @override
  void initState() {
    super.initState();
    businessName=widget.businessName;
    businessEmailAddress=widget.businessEmailAddress;
    businessPhone=widget.businessPhone;
    businessBillingAddress=widget.businessBillingAddress;
    businessWebsite=widget.businessWebsite;
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
              "Business Info",
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
                  String businessName = _businessNameController.text;
                   String businessEmailAddress= _businessEmailContorller.text;
                 String businessPhone = _businessPhoneController.text ;
                 String  businessBillingAddress = _businessBillingContorller.text;
                  String businessWebsite = _businessWebsiteContorller.text;

                  Map<String, dynamic> invoiceBusinessData = {
                    'businessName': businessName,
                    'businessEmailAddress': businessEmailAddress,
                    'businessPhone': businessPhone.toString(), // Convert numeric phone to String
                    'businessBillingAddress': businessBillingAddress,
                    'businessWebsite': businessWebsite,
                  };


                  // Print values to console (for debugging purposes, can be removed)
                  print('Invoice Number: $businessName');
                  print('Creation Date: $businessEmailAddress');
                  print('Due Date: $businessPhone');
                  print('Due Terms: $businessBillingAddress');
                  print('Invoice Title Name: $businessWebsite');

                  // Use Navigator.pop to return the data to the previous screen
                  Navigator.pop(context, invoiceBusinessData);
                } else {
                  // Form validation failed
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
                  height: 1000.0, // Adjust container height as needed
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
                                  text: "Business Name",
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter business name',
                              ),
                              controller:_businessNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the business name';
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

                              controller:_businessEmailContorller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter business email address',
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

                              controller:_businessPhoneController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter business phone number',
                              ),
                              keyboardType: TextInputType.phone, // Suggests a numeric input keyboard
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
                            child: // For Address Line 1
                            TextFormField(

                              controller:_businessBillingContorller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter address line1',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the billing address';
                                }
                                return null;
                              },
                            ),


                          ),
                          SizedBox(height: 5.0),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            // child: // For Address Line 1
                            // TextFormField(
                            //   decoration: const InputDecoration(
                            //     border: InputBorder.none,
                            //     hintText: 'Enter address line2',
                            //   ),
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Please enter the billing address';
                            //     }
                            //     return null;
                            //   },
                            // ),
// Address Line 2 is optional in many cases, adjust according to your need

                          ),

                          SizedBox(height: 20.0),
                          // Create Date Field
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Business Website",
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

                              controller:_businessWebsiteContorller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter business website',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the business website';
                                }
                                // Optional: Add specific validation for website URL format if required
                                return null;
                              },
                            ),

                          ),

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

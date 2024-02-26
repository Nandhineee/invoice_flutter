import 'package:flutter/material.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/id_invoice_page.dart';

class business_info extends StatefulWidget {
  const business_info({super.key});

  @override
  State<business_info> createState() => _business_infoState();

}

class _business_infoState extends State<business_info> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const id_info()),
              );

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
                  height: 700.0, // Adjust container height as needed
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
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter business email address',
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter business phone number',
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter address line1',
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
                          SizedBox(height: 5.0),
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
                                hintText: 'Enter address line2',
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter business website',
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

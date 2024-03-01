import 'package:flutter/material.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/id_invoice_page.dart';

class item_info extends StatefulWidget {
  const item_info({super.key, required this.itemId, required this.itemName, required this.quantity,required this.itemPrice, required this.itemDiscount, required this.itemTax});

 final String itemId;
 final String itemName;
  final num itemPrice;
 final num quantity;
  final num itemDiscount;
 final num itemTax;

  @override
  State<item_info> createState() => _item_infoState();
}

class _item_infoState extends State<item_info> {
  final _formKey = GlobalKey<FormState>();

  late String itemId;
  late String itemName;
  late num itemPrice;
  late num quantity;
  late num itemDiscount;
  late num itemTax;

  @override
  void initState() {
    super.initState();
    itemId=widget.itemId;
    itemName=widget.itemName;
    quantity=widget.quantity;
    itemPrice=widget.itemPrice;
    itemTax=widget.itemTax;
    itemDiscount=widget.itemDiscount;
  }


  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();
  final TextEditingController _itemDiscountController = TextEditingController();


  final TextEditingController _itemTaxController = TextEditingController();

  final TextEditingController _itemQuantityController = TextEditingController();


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
              "New Item",
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
                  String itemName = _itemNameController.text;
                  String itemPrice = _itemPriceController.text;
                  String itemTax = _itemTaxController.text;
                  String  itemDiscount = _itemDiscountController.text;
                  String quantity = _itemQuantityController.text;

                  Map<String, dynamic> invoiceItemData = {
                    'itemName': itemName,
                    'itemPrice': itemPrice.toString(),
                    'itemTax': itemTax.toString(), // Convert numeric phone to String
                    'itemDiscount': itemDiscount.toString(),
                    'quantity': quantity.toString(),
                  };

                  // Here you can do whatever you need with the collected data,
                  // for example, print it to the console or send it to a server
                  print('Client Name: $itemName');
                  print('Client price: $itemPrice');
                  print('Client tax: $itemTax');
                  print('Client discount: $itemDiscount');
                  print('Client quantity: $quantity');

                  // Implement your submission logic here, such as sending data to a server or navigating to another screen
                  Navigator.pop(context, invoiceItemData);
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
                                  text: "Item Name",
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
                              controller: _itemNameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter item name',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the item name';
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
                                  text: "Item Price",
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
                              controller: _itemPriceController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText:  "₹0.00"
                                ,
                              ),
                              style: TextStyle(fontSize: 16.0),validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the item price';
                              } else if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
                                return 'Enter a valid price';
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
                                  text: "Item Quantity",
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
                              controller: _itemQuantityController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '1',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the item quantity';
                              } else if (int.tryParse(value) == null || int.parse(value) <= 0) {
                                return 'Quantity must be greater than zero';
                              }
                              return null;
                            },

                            ),
                          ),
                          //
                          // SizedBox(height: 20.0),
                          // // Create Date Field
                          // RichText(
                          //   text: const TextSpan(
                          //     children: [
                          //       TextSpan(
                          //         text: "Unit of Measure",
                          //         style: TextStyle(
                          //           fontSize: 15.0,
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //       TextSpan(
                          //         text: "*",
                          //         style: TextStyle(
                          //           fontSize: 15.0,
                          //           color: Colors.red,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 10.0),
                          // Container(
                          //   padding: EdgeInsets.all(8.0),
                          //   width: 400,
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey[200],
                          //     borderRadius: BorderRadius.circular(5.0),
                          //   ),
                          //   child: TextFormField(
                          //     controller: _itemMeasureController,
                          //     decoration: const InputDecoration(
                          //       border: InputBorder.none,
                          //       hintText: 'None',
                          //     ),
                          //     style: TextStyle(fontSize: 16.0),
                          //     // Validator for Unit of Measure
                          //     validator: (value) {
                          //
                          //       if (value == null || value.isEmpty) {
                          //         return 'Please enter the unit of measure';
                          //       }
                          //       return null;
                          //     },
                          //
                          //   ),
                          // ),


                          SizedBox(height: 20.0),
                          // Create Date Field
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Discount",
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
                              controller: _itemDiscountController,

                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '0',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the discount';
                                } else if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
                                  return 'Enter a valid discount';
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
                                  text: "Tax Rate",
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
                                controller: _itemTaxController,
                                decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '0%',
                              ),
                              style: TextStyle(fontSize: 16.0),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the tax rate';
                                  } else if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
                                    return 'Enter a valid tax rate';
                                  }
                                  return null;
                                }
                            ),
                          ),
                          // Existing widgets...

                          SizedBox(height: 20.0),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0), // Add padding inside the container
                            width: 400.0,
                            decoration: BoxDecoration(
                              color: Colors.blue[900], // Set the color of the container to blue
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out child widgets as much as possible
                            //   children: <Widget>[
                            //     Text(
                            //       'Amount',
                            //       style: TextStyle(
                            //         fontSize: 16.0,
                            //         color: Colors.white, // Set text color to white for better contrast
                            //       ),
                            //     ),
                            //     Text(
                            //       '$itemPrice*$quantity', // Use the Rupees symbol
                            //       style: TextStyle(
                            //         fontSize: 16.0,
                            //         color: Colors.white, // Set text color to white for better contrast
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ),




                          SizedBox(height: 20.0),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Item Description",
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
                            width: 500,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Stack(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 50.0, bottom: 30.0, right: 8.0, left: 8.0),

                                  ),
                                  style: TextStyle(fontSize: 16.0),
                                  maxLines: null, // Adjust maxLines as needed
                                  keyboardType: TextInputType.multiline,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the item description';
                                    } else if (value.length > 500) {
                                      return 'Description cannot exceed 500 characters';
                                    }
                                    return null;
                                  },

                                ),
                                const Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Text(
                                    '0/500',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
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

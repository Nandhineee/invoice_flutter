import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:invoice/domain/models/item.dart';
import 'package:invoice/presentation/view/details_page/business_info.dart';
import 'package:invoice/presentation/view/details_page/client_info.dart';
import 'package:invoice/presentation/view/details_page/invoice_info.dart';
import 'package:invoice/presentation/view/details_page/item_info.dart';
import 'package:invoice/presentation/view/invoice_pdf/pdf_file.dart';
import 'package:invoice/presentation/view/tabs/paid_invoice.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/item_details.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/payment.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/user_info.dart';

class id_info extends StatefulWidget {
  const id_info({super.key});

  @override
  State<id_info> createState() => _id_infoState();
}

class _id_infoState extends State<id_info> {
  late List<Invoice> invoiceList;
  late String invoiceId = "";
  String invoiceName = "";
  String price = "";
  DateTime createdDate = DateTime.now();
  late DateTime DueDate = DateTime.now();
  late String dueTerms = "";
  num clientPhone = 0;
  String clientBillingAddress = "";
  String clientShippingAddress = "";
  String clientName = "";
  String clientEmailAddress = "";

  String businessName = "";
  String businessEmailAddress = "";
  num businessPhone = 0;
  String businessBillingAddress = "";
  String businessWebsite = "";
  String discount = "";
  String tax = "";
  String shipping = "";
  String itemId = "";
  String itemName = "";
  num itemPrice = 0;
  num quantity = 0;
  num itemDiscount = 0;
  num itemTax = 0;

  @override
  void initState() {
    super.initState();
    invoiceId = invoiceId;
    invoiceName = invoiceName;
    dueTerms = dueTerms;
    createdDate = createdDate;
    DueDate = DueDate;
    businessWebsite = businessWebsite;
    businessEmailAddress = businessEmailAddress;
    businessWebsite = businessWebsite;
    businessBillingAddress = businessBillingAddress;
    clientName = clientName;
    clientPhone = clientPhone;
    clientShippingAddress = clientShippingAddress;
    clientBillingAddress = clientBillingAddress;
    clientEmailAddress = clientEmailAddress;
    discount = _discountController.text;
    tax = _taxController.text;
    shipping = shipping;
    itemId = itemId;
    itemName = itemName;
    itemPrice = itemPrice;
    quantity = quantity;
    itemDiscount = itemDiscount;
    itemTax = itemTax;
  }

  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _shippingController = TextEditingController();

  void navigateToAddTodoPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => invoicepdf(
                invoiceId: invoiceId,
                invoiceName: invoiceName,
                dueTerms: dueTerms,
                createdDate: createdDate,
                DueDate: DueDate,
                businessWebsite: businessWebsite,
                businessEmailAddress: businessEmailAddress,
                businessBillingAddress: businessBillingAddress,
                clientName: clientName,
                clientPhone: clientPhone,
                clientShippingAddress: clientShippingAddress,
                clientBillingAddress: clientBillingAddress,
                clientEmailAddress: clientEmailAddress,
                discount: discount,
                tax: tax,
                shipping: shipping,
                itemId: itemId,
                itemName: itemName,
                itemPrice: itemPrice,
                quantity: quantity,
                itemDiscount: itemDiscount,
                itemTax: itemTax,
              )),
    );
    print("Hellow $result");
    setState(() {});
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Centers the column vertically within the container
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Centers the column's children horizontally
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            invoiceId.isNotEmpty ? invoiceId : 'Invoice Number',
                            // Ternary operator to check if invoiceId is empty
                            style: TextStyle(
                              fontSize: invoiceId.isNotEmpty ? 35.0 : 25.0,
                              // Smaller size when invoiceId is empty
                              color: Colors.black,
                              fontWeight:
                                  FontWeight.bold, // Makes the text bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            invoiceName.isNotEmpty ? invoiceName : 'Name',
                            // Ternary operator to check if invoiceName is empty
                            style: const TextStyle(
                              fontSize: 16.0,
                              // Size remains the same for both cases
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            createdDate != null
                                ? formatDate(createdDate)
                                : 'Created Date',
                            // Check if createdDate is null
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            color: Colors.blue[900]),
                        onPressed: () async {
                          final Map<String, dynamic>? result =
                              await Navigator.push<Map<String, dynamic>>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => invoice_info(
                                invoiceId: invoiceId,
                                invoiceName: invoiceName,
                                createdDate: createdDate,
                                dueTerms: dueTerms,
                                DueDate: DueDate,
                              ),
                            ),
                          );

                          // Check if the result is not null and then update the state variables
                          if (result != null) {
                            setState(() {
                              invoiceId = result['invoiceId'];
                              invoiceName = result['invoiceName'];
                              createdDate =
                                  DateTime.parse(result['createdDate']);
                              DueDate = DateTime.parse(result['dueDate']);
                              dueTerms = result['dueTerms'];
                              // Update other variables as necessary
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 17.0, left: 17.0, top: 20.0),
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
                        offset:
                            Offset(4.0, 4.0), // X, Y offset from the container
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Centers the content vertically within the container
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Aligns children to the start of the cross axis
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Column(
                              // First Column
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                                  // textBaseline: TextBaseline.alphabetic,// Adjusted to start for alignment
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 05.0, bottom: 05.0),
                                      child:
                                          Icon(Icons.mail_outline, size: 23.0),
                                    ),
                                    // Profile icon at the left end
                                    SizedBox(width: 8.0),
                                    // Space between icon and text
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 05.0, bottom: 05.0),
                                      child: Text(
                                        'From',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // Text widget in the first column
                                    Spacer(),
                                    // Pushes the arrow icon to the right end
                                    IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue[900]),
                                      onPressed: () async {
                                        final Map<String, dynamic>? result =
                                            await Navigator.push<
                                                Map<String, dynamic>>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => business_info(
                                              businessName: businessName,
                                              businessPhone: businessPhone,
                                              businessEmailAddress:
                                                  businessEmailAddress,
                                              businessWebsite: businessWebsite,
                                              businessBillingAddress:
                                                  businessBillingAddress,
                                            ),
                                          ),
                                        );

                                        // Check if the result is not null and then update the state variables
                                        if (result != null) {
                                          setState(() {
                                            businessName =
                                                result['businessName'] ?? '';
                                            businessWebsite =
                                                result['businessWebsite'] ?? '';
                                            businessEmailAddress = result[
                                                    'businessEmailAddress'] ??
                                                '';
                                            businessBillingAddress = result[
                                                    'businessBillingAddress'] ??
                                                '';
                                            // Use null-aware operators to provide a default value if the result is null
                                            businessPhone = result.containsKey(
                                                        'businessPhone') &&
                                                    result['businessPhone'] !=
                                                        null
                                                ? int.tryParse(
                                                        result['businessPhone']
                                                            .toString()) ??
                                                    0
                                                : 0;
                                            // Repeat the pattern for other nullable fields as needed
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // Adjusted to start for alignment
                                  children: [
                                    SizedBox(width: 3.0),
                                    // Offset to align text under the first one
                                    Text('Add Business'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 20.0),
                            child: Column(
                              // Second Column, placed below the first Column
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // Ensures alignment to the start
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 16.0, bottom: 1.0),
                                      child:
                                          Icon(Icons.receipt_long, size: 23.0),
                                    ),
                                    // Icon with specific padding
                                    const SizedBox(width: 8.0),
                                    // Space between icon and text
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 16.0, bottom: 1.0),
                                      child: Text(
                                        'Bill To',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Bold text label
                                    Spacer(),
                                    // This pushes the IconButton to the far right
                                    IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue[900]),
                                      onPressed: () async {
                                        final Map<String, dynamic>? result =
                                            await Navigator.push<
                                                Map<String, dynamic>>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => client_info(
                                              clientName: clientName,
                                              clientPhone: clientPhone,
                                              clientEmailAddress:
                                                  clientEmailAddress,
                                              clientShippingAddress:
                                                  clientShippingAddress,
                                              clientBillingAddress:
                                                  clientBillingAddress,
                                            ),
                                          ),
                                        );

                                        // Check if the result is not null and then update the state variables
                                        if (result != null) {
                                          setState(() {
                                            clientName = result['clientName'] ??
                                                'Nandhini';
                                            clientEmailAddress =
                                                result['clientEmailAddress'] ??
                                                    'nandhini@gmail.com';

                                            clientShippingAddress = result[
                                                    'clientShippingAddress'] ??
                                                '';
                                            clientBillingAddress = result[
                                                    'clientBillingAddress'] ??
                                                '';
                                            // Use null-aware operators to provide a default value if the result is null
                                            clientPhone = result.containsKey(
                                                        'clientPhone') &&
                                                    result['clientPhone'] !=
                                                        null
                                                ? int.tryParse(
                                                        result['clientPhone']
                                                            .toString()) ??
                                                    0
                                                : 0;
                                            // Repeat the pattern for other nullable fields as needed
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // Adjusted to start for alignment
                                  children: [
                                    SizedBox(width: 3.0),
                                    // Offset to align text under the first one
                                    Text('Add Client'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 17.0, left: 17.0, top: 20.0),
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
                        onTap: () async {
                          final Map<String, dynamic>? result =
                              await Navigator.push<Map<String, dynamic>>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => item_info(
                                itemId: itemId,
                                itemName: itemName,
                                itemPrice: itemPrice,
                                itemDiscount: itemDiscount,
                                itemTax: itemTax,
                                quantity: quantity,
                              ),
                            ),
                          );

                          // Check if the result is not null and then update the state variables
                          if (result != null) {
                            setState(() {
                              itemName = result['itemName'] ?? '';
                              itemId = result['itemId'] ?? '';

                              // Parse itemTax as a num, defaulting to 0 if parsing fails or if the field is absent
                              String itemTaxStr = result['itemTax'] ?? '';
                              itemTax = num.tryParse(itemTaxStr) ?? 0;

                              // Parse itemDiscount as a num, defaulting to 0 if parsing fails or if the field is absent
                              String itemDiscountStr =
                                  result['itemDiscount'] ?? '';
                              itemDiscount = num.tryParse(itemDiscountStr) ?? 0;

                              // Parse quantity as a num, defaulting to 0 if parsing fails or if the field is absent
                              String quantityStr = result['quantity'] ?? '';
                              quantity = num.tryParse(quantityStr) ?? 0;
                            });
                          }
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
                              Text('Add item',
                                  style: TextStyle(fontSize: 16.0)),
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
                            Text(
                              'SubTotal',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo[900]),
                            ),
                            Text('0.00',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      // Row for the discount icon, text, and greater than symbol
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // Align items on both ends
                        children: <Widget>[
                          // Container for the discount icon and text on the left
                          const Row(
                            children: <Widget>[
                              Icon(Icons.discount, color: Colors.black),
                              // Discount icon
                              SizedBox(width: 8.0),
                              // Spacing between icon and text
                              Text('Discount',
                                  style: TextStyle(fontSize: 16.0)),
                              // Discount text
                            ],
                          ),
                          // IconButton for the greater than icon on the right
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.indigo[900]),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Discount',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.indigo[900]),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              width: 400,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: TextFormField(
                                                controller: _discountController,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: '0%',
                                                ),
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter some text';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    discount =
                                                        _discountController
                                                            .text;
                                                    Navigator.of(context)
                                                        .pop(); // Pop back with the discountValueuntValue
                                                  },
                                                  child: Text('Save'),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),
                      // Row for the discount icon, text, and greater than symbol
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // Align items on both ends
                        children: <Widget>[
                          // Container for the discount icon and text on the left
                          const Row(
                            children: <Widget>[
                              Icon(Icons.account_balance, color: Colors.black),
                              // Discount icon
                              SizedBox(width: 8.0),
                              // Spacing between icon and text
                              Text('Tax', style: TextStyle(fontSize: 16.0)),
                              // Discount text
                            ],
                          ),
                          // IconButton for the greater than icon on the right
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.indigo[900]),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Tax',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.indigo[900]),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8.0),
                                                width: 400,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: TextFormField(
                                                  controller: _taxController,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: '0%',
                                                  ),
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 16),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      tax = _taxController.text;
                                                      Navigator.of(context)
                                                          .pop(); // Pop back with the discountValueuntValue
                                                    },
                                                    child: Text('Save'),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      // Row for the discount icon, text, and greater than symbol
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // Align items on both ends
                        children: <Widget>[
                          // Container for the discount icon and text on the left
                          const Row(
                            children: <Widget>[
                              Icon(Icons.local_shipping, color: Colors.black),
                              // Discount icon
                              SizedBox(width: 8.0),
                              // Spacing between icon and text
                              Text('Shipping',
                                  style: TextStyle(fontSize: 16.0)),
                              // Discount text
                            ],
                          ),
                          // IconButton for the greater than icon on the right
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.indigo[900]),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Shipping Amount',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.indigo[900]),
                                              ),
                                              SizedBox(height: 16),
                                              Container(
                                                padding: EdgeInsets.all(8.0),
                                                width: 400,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: TextFormField(
                                                  controller:
                                                      _shippingController,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: '0',
                                                  ),
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 16),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      shipping =
                                                          _shippingController
                                                              .text;
                                                      Navigator.of(context)
                                                          .pop(); // Pop back with the discountValueuntValue
                                                    },
                                                    child: Text('Save'),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }),
                        ],
                      ),

                      SizedBox(
                        height: 20.0,
                        width: 200.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Total',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900])),
                            Text('0.00',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            payment_info()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Invoice invoiceData = Invoice(
              invoiceId,
              invoiceName,
              price,
              false,
              createdDate,
              DueDate,
              dueTerms,
              businessName,
              businessEmailAddress,
              businessPhone,
              businessBillingAddress,
              businessWebsite,
              clientName,
              clientEmailAddress,
              clientBillingAddress,
              clientPhone,
              clientShippingAddress,
              discount,
              shipping,
              tax, [
            Item(itemId, itemName, quantity, itemPrice, itemDiscount, itemTax)
          ]);
          setState(() {
            invoice.add(invoiceData);

          });


          navigateToAddTodoPage(context);
          print('floating: $invoiceId');
          print('floating: $createdDate');
          print('floating: $DueDate');
          print('floating: $dueTerms');
          print('floating: $invoiceName');
          print('floating: $businessName');
          print('floating: $businessPhone');
          print('floating: $businessBillingAddress');
          print('floating: $businessWebsite');
          print('floating: $businessEmailAddress');
          print('floating Name: $clientName');
          print('floating Email: $clientEmailAddress');
          print('floating Phone: $clientPhone');
          print('floating Billing Address: $clientBillingAddress');
          print('floating Shipping Address: $clientShippingAddress');
          print('floating discount:$discount');
          print('floating tax:$tax');
          print('$itemId');
          print('item:$itemName');
          print('num $itemPrice');
          print('num $quantity');
          print('num $itemDiscount');
          print('num $itemTax');
        },
        // The add symbol
        backgroundColor: Colors.blue[900],

        shape: const CircleBorder(),
        child:
            const Icon(Icons.send_outlined), // Background color of the button
      ),
    );
  }
}

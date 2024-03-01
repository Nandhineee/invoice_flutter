import 'package:flutter/material.dart';
import 'package:invoice/presentation/view/sign_in/login.dart';
import 'package:intl/intl.dart';
import 'package:invoice/presentation/widgets/new_invoice_details/id_invoice_page.dart';

class invoice_info extends StatefulWidget {
  invoice_info({super.key, required this.invoiceId, required this.invoiceName, required this.createdDate, required this.DueDate, required this.dueTerms});
  final String invoiceId;
  final String invoiceName;
  final DateTime createdDate;
  final DateTime DueDate;
  final String dueTerms;


  @override
  State<invoice_info> createState() => _invoice_infoState();
}

class _invoice_infoState extends State<invoice_info> {

  late String invoiceId;
  late  String invoiceName;
  late DateTime createdDate;
  late  DateTime DueDate;
  late String dueTerms;


  @override
  void initState() {
    super.initState();
    invoiceId=widget.invoiceId;
    invoiceName=widget.invoiceName;
    createdDate=widget.createdDate;
    DueDate=widget.DueDate;
    dueTerms=widget.dueTerms;
  }



  final _formKey = GlobalKey<FormState>();

  DateTime _selectedDate= DateTime.now();

  String get getDate{

    return DateFormat('yyyy-MM-dd').format(_selectedDate);

  }
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   _dateController.dispose();
  //   _duedatecontroller.dispose();
  //   _duecontroller.dispose();
  //   _invoiceTitleController.dispose();
  //   super.dispose();
  // }


  final TextEditingController _controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _duedatecontroller=TextEditingController();
  final TextEditingController _duecontroller=TextEditingController();
  final TextEditingController _invoiceTitleController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);

            },
          ),
          title: const Center(
            child: Text(
              "Invoice Info",
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Assuming _formKey is defined as a GlobalKey<FormState> for your form
                if (_formKey.currentState!.validate()) {
                  // Form validation success

                  // Accessing controller values and parsing dates as needed
                  String invoiceId = _controller.text;
                  DateTime createdDate = DateTime.parse(_dateController.text);
                  DateTime dueDate = DateTime.parse(_duedatecontroller.text); // Corrected variable name to follow Dart conventions
                  String dueTerms = _duecontroller.text;
                  String invoiceName = _invoiceTitleController.text;


                  Map<String, String> invoiceData = {
                    'invoiceId': invoiceId,
                    'createdDate': createdDate.toIso8601String(), // Convert DateTime to String for easier handling
                    'dueDate': dueDate.toIso8601String(), // Convert DateTime to String for easier handling
                    'dueTerms': dueTerms,
                    'invoiceName': invoiceName,
                  };

                  // Print values to console (for debugging purposes, can be removed)
                  print('Invoice Number: $invoiceId');
                  print('Creation Date: ${createdDate.toIso8601String()}');
                  print('Due Date: ${dueDate.toIso8601String()}');
                  print('Due Terms: $dueTerms');
                  print('Invoice Title Name: $invoiceName');

                  // Use Navigator.pop to return the data to the previous screen
                  Navigator.pop(context, invoiceData);
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
                                  text: "Invoice Number",
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
                           child:  TextFormField(
                              controller: _controller, // Assuming this is defined elsewhere in your code
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the invoice number';
                                }
                                // Add more specific validation logic here if needed
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
                                  text: "Creation Date" ,
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
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                              decoration: const InputDecoration(
                              hintText: "Select date",
                              border: InputBorder.none,
                            ),
                            controller: _dateController,
                                    // Assuming this is defined and manages date input
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a date';
                              }
                              // Additional validation can be added here, for example, to check date format
                              return null;
                            },

                          ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () => openDatePicker()
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Due Terms",
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
                            child:TextFormField(
                              controller: _duecontroller, // Assuming this is defined elsewhere in your code
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: TextStyle(fontSize: 16.0),
                              keyboardType: TextInputType.number, // Suggests a numeric input keyboard
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the invoice number';
                                } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  // This regex matches strings that consist only of digits
                                  return 'Please enter a valid number';
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
                                  text: "Due Date"  ,
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
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Select date",
                                      border: InputBorder.none,
                                    ),
                                    controller: _duedatecontroller, // Assuming this is defined and manages date input
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select a date';
                                      }
                                      // Additional validation can be added here, for example, to check date format
                                      return null;
                                    },

                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () => openDatePicker()
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Invoice Title Name",
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
                              controller: _invoiceTitleController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'INVOICE',
                              ),
                              style: TextStyle(fontSize: 16.0),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an invoice title';
                                }
                                // Add more specific validation logic here if needed
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
  Future<void> openDatePicker() async{
    final selectedDate = await showDatePicker
      (context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2010,4,1),
        lastDate: DateTime.now());

    if(selectedDate != null){
      setState(() {
        _selectedDate=selectedDate;
        _dateController.text = getDate;
        _duedatecontroller.text=getDate;
      });
    }

  }

}



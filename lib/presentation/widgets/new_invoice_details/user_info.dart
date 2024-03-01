// import 'package:flutter/material.dart';
// import 'package:invoice/presentation/view/details_page/business_info.dart';
// import 'package:invoice/presentation/view/details_page/client_info.dart';
// import 'package:invoice/presentation/view/details_page/invoice_info.dart';
//
// class user_info extends StatefulWidget {
//   const user_info({super.key});
//
//   @override
//   State<user_info> createState() => _user_infoState();
// }
//
// class _user_infoState extends State<user_info> {
//  late String businessName="";
//  late String businessEmailAddress="";
//   late num  businessPhone=0;
//  late String businessBillingAddress="";
//   late String businessWebsite="";
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//         child: Padding(
//           padding: const EdgeInsets.only(right: 17.0, left: 17.0, top: 20.0),
//           child: Container(
//             height: 150.0, // Increased height to better fit the content
//             width: 400.0, // Increased width for the same reason
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.rectangle, // Ensures the container is rectangular
//               borderRadius: BorderRadius.circular(10.0), // Gives rounded corners for a nicer look
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
//                   spreadRadius: 2.0, // Spread radius
//                   blurRadius: 8.0, // Blur radius
//                   offset: Offset(4.0, 4.0), // X, Y offset from the container
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center, // Centers the content vertically within the container
//                   crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start of the cross axis
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 20.0),
//                       child: Column( // First Column
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             // crossAxisAlignment: CrossAxisAlignment.baseline,
//                             // textBaseline: TextBaseline.alphabetic,// Adjusted to start for alignment
//                             children: [
//                               const Padding(
//                                 padding: EdgeInsets.only(top:05.0,bottom: 05.0),
//                                 child: Icon(Icons.mail_outline, size: 23.0),
//                               ), // Profile icon at the left end
//                               SizedBox(width: 8.0), // Space between icon and text
//                               Padding(
//                                 padding: EdgeInsets.only(top:05.0,bottom: 05.0),
//                                 child: Text('From', style: TextStyle(fontWeight : FontWeight.bold),),
//                               ), // Text widget in the first column
//                               Spacer(), // Pushes the arrow icon to the right end
//                               IconButton(
//                                 icon: Icon(Icons.arrow_forward_ios, color: Colors.blue[900]),
//                                 onPressed: () async {
//                                   final Map<String, dynamic>? result = await Navigator.push<Map<String, dynamic>>(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => business_info(
//                                         businessName: businessName,
//                                         businessPhone: businessPhone ,
//                                         businessEmailAddress: businessEmailAddress,
//                                         businessWebsite: businessWebsite,
//                                         businessBillingAddress: businessBillingAddress,
//                                       ),
//                                     ),
//                                   );
//
//                                   // Check if the result is not null and then update the state variables
//                                   if (result != null) {
//                                     setState(() {
//                                       businessName = result['businessName'];
//                                       businessWebsite = result['businessWebsite'];
//                                       businessEmailAddress = result['businessEmailAddress'];
//                                       businessBillingAddress = result['businessBillingAddress'];
//                                       businessPhone = int.parse(result['businessPhone']);
//
//                                       // Update other variables as necessary
//                                     });
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start, // Adjusted to start for alignment
//                             children: [
//                               SizedBox(width: 3.0), // Offset to align text under the first one
//                               Text('Add Business'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10.0, left: 20.0),
//                       child: Column( // Second Column, placed below the first Column
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start, // Ensures alignment to the start
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(top: 16.0, bottom: 1.0),
//                                 child: Icon(Icons.receipt_long, size: 23.0),
//                               ), // Icon with specific padding
//                               SizedBox(width: 8.0 ), // Space between icon and text
//                               Padding(
//                                 padding: EdgeInsets.only(top: 16.0, bottom: 1.0),
//                                 child: Text(
//                                   'Bill To',
//                                   style: TextStyle(fontWeight: FontWeight.bold,),
//
//                                 ),
//                               ), // Bold text label
//                               Spacer(), // This pushes the IconButton to the far right
//                               IconButton(
//                                 icon: Icon(Icons.arrow_forward_ios, size: 23.0,color: Colors.indigo[900],),
//                                 onPressed: () {
//                                   // Ensure you have a route or logic to navigate to
//                                   print("Navigate to invoice info screen");
//                                   // Example navigation to a new page named invoice_info
//                                   // Make sure you have invoice_info widget defined in your project
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => client_info()), // Adjusted class name to follow Dart naming conventions
//                                   );
//                                 },
//                               ),
//                             ],
//                           ),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start, // Adjusted to start for alignment
//                             children: [
//                               SizedBox(width: 3.0), // Offset to align text under the first one
//                               Text('Add Client'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }

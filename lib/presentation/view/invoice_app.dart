import 'package:flutter/material.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:invoice/presentation/view/sign_in/login.dart';
import 'package:invoice/presentation/view/tabs/all_invoice.dart';
import 'package:invoice/presentation/view/create_invoice.dart';
import 'package:invoice/presentation/view/tabs/paid_invoice.dart';
import 'package:invoice/presentation/view/tabs/unpaid_invoice.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestApp(),
    );


  }

}
class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController= TabController(length: 3, vsync: this,initialIndex: 0,);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        leading: IconButton(
          icon: const Text('<', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const login()),
            );
            print('Floating Action Button Pressed');
          },
        ),
        title:  const Center(
            child: Text("Invoice",style: TextStyle(fontSize: 30.0,color:Colors.black ),)
        ),
        actions: <Widget>[
          IconButton(
            icon: const  Icon(Icons.search),
            onPressed: () {

              print('Search icon pressed');
            },
          ),
        ],

        bottom: TabBar(
          indicatorColor: Colors.blue[900],
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'ALL',),
            Tab(text:"PAID"),
            Tab(text:"UNPAID")

          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            all( ),
            paid(),
            unpaid(),
          ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
          print('Floating Action Button Pressed');
        },
         // The add symbol
        backgroundColor: Colors.blue[900],

        shape: const CircleBorder(),
        child:  const Icon(Icons.add),// Background color of the button
      ),

    );

  }
}



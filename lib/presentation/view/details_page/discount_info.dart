import 'package:flutter/material.dart';

class discount_info extends StatefulWidget {
  const discount_info({super.key});

  @override
  State<discount_info> createState() => _discount_infoState();
}

class _discount_infoState extends State<discount_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Center(
    child: ElevatedButton(
    onPressed: () => showDiscountDialog(context),
    child: Text('Discount'),
    ),
    ),
    );

  }

  void showDiscountDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Discount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter discount code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implement save functionality here
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }    );

  }
}

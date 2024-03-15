import 'package:invoice/data/datasources/db_helper.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:sqflite/sqlite_api.dart';

class InvoiceDataSource{

  Future<bool?> insertInvoiceData( Invoice invoice) async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.database!;
    final invoiceMap = invoice.toJson();

    // Insert a row into the table.
    await db.insert(
      invoiceTableName,invoiceMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("invoice insert");
    return null;
  }


  Future<List<Invoice>?> getInvoice() async {
    List<Invoice> invoices = [];
    Database? dbClient = DatabaseHelper.database;
    if (dbClient != null) {
      List<Map<String, dynamic>> result =
      await dbClient.rawQuery("select * from $invoiceTableName");
      for (var res in result) {
        invoices.add(Invoice.fromJson(res));
      }
      return invoices;
    }
    return null;
  }


}
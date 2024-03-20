import 'package:invoice/data/datasources/db_helper.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:invoice/domain/models/item.dart';
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


    print("invoice insert gyuuy");
    return null;
  }



  Future<bool?> insertItemData( Item item) async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.database!;
    final itemMap = item.toJson();

    // Insert a row into the table.
    await db.insert(
      itemTableName,itemMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  getInvoice();
  getItem();
    // print("item insert ");
    return null;
  }



  Future<List<Invoice>?> getInvoice() async {
    List<Invoice> invoices = [];
    Database? dbClient = DatabaseHelper.database;
    if (dbClient != null) {
      List<Map<String, dynamic>> result =
      await dbClient.rawQuery("select * from $invoiceTableName");
      for (var res in result) {
         print("$res tableinsert");
        invoices.add(Invoice.fromJson(res));
      }
      return invoices;
    }
    return null;
  }


  Future<List<Item>?> getItem() async {
    List<Item> items = [];
    Database? dbClient = DatabaseHelper.database;
    if (dbClient != null) {
      List<Map<String, dynamic>> result =
      await dbClient.rawQuery("select * from $itemTableName ");
      for (var res in result) {

        items.add(Item.fromJson(res));
      }
      return items;
    }
    return null;
  }


  Future<void> deleteInvoiceById(String inId) async {
    // Get a reference to the database.
    final Database db = await DatabaseHelper.database!;

    // Delete the invoice from the table.
    await db.delete(
      invoiceTableName,
      where: "invoiceId = ?",
      whereArgs: [inId],
    );

    print("Invoice deleted");
  }


}
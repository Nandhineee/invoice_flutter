import 'package:invoice/domain/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/models/invoice_list.dart';
import '../../domain/models/item.dart';

class DatabaseHelper {
  static Database? database;

  Future<Database> get db async {
    print("db1");
    final path = await getDatabasesPath();
    final databasePath = join(path, "invoice_app.db");
    print(databasePath);
    // await deleteDatabase(databasePath);
    if (database != null) {
      return database!;
    }
    database = await initDatabase();
      // loadUserDetails();
      // loadInvoiceDetails();
      // loadItemDetails();
    return database!;
  }

  Future<Database> initDatabase() async {
    print("db");
    final path = await getDatabasesPath();
    final databasePath = join(path, "invoice_app.db");

    return await openDatabase(databasePath, version: 1, onCreate: _onCreate);
  }

  // Future _onConfigure(Database db) async {
  //   await db.execute("");
  // }

  Future<void> loadUserDetails() async {
    Database? db = DatabaseHelper.database;
    for (User user in userDetails) {
      print(user);
      if (db != null) {
        await db.insert(UserTableName, user.toJson());
      } else {
      }
    }
  }


  Future<void> loadInvoiceDetails() async {
    Database? db = DatabaseHelper.database;
    for (Invoice invoiceDetails in invoice) {
      print(invoiceDetails);
      if (db != null) {
        await db.insert(invoiceTableName, invoiceDetails.toJson());

      } else {
      }
    }
  }

  Future<void> loadItemDetails() async {
    Database? db = DatabaseHelper.database;
    for (Item itemDetails in item) {
      print("$itemDetails loading");
      if (db != null) {
        await db.insert(itemTableName, itemDetails.toJson());
      } else {
      }
    }
  }



  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE $UserTableName ($userId INTEGER PRIMARY KEY,$userPassword TEXT,
        $userName TEXT,$userEmail TEXT);''');
    await db.execute('''CREATE TABLE $invoiceTableName( 
      $invoiceId TEXT,
            $invoiceTableId INTEGER PRIMARY KEY AUTOINCREMENT,

      $invoiceCreateName TEXT,
      $invoicePrice TEXT ,
      $invoicePaid INTEGER,
      $invoiceCreatedDate TEXT,
      $invoiceDueDate TEXT,
      $invoiceDueTerms TEXT,
      $invoiceBusinessName TEXT,
      $invoiceBusinessEmailAddress TEXT,
      $invoiceBusinessPhone  INTEGER,
      $invoiceBusinessBillingAddress  TEXT,
      $invoiceBusinessWebsite TEXT,
      $invoiceClientName TEXT,
      $invoiceClientEmailAddress TEXT,
      $invoiceClientPhone INTEGER,
      $invoiceClientBillingAddress TEXT,
      $invoiceClientShippingAddress TEXT,
      $invoiceDiscount TEXT,
      $invoiceTax TEXT,
      $invoiceShipping TEXT);''');


    await db.execute(
        '''CREATE TABLE $itemTableName ($invoiceId TEXT ,$itemId INTEGER PRIMARY KEY AUTOINCREMENT,
        $itemName TEXT,$itemPrice INTEGER,$itemQuantity INTEGER,$itemDiscount INTEGER,
        $itemTax INTEGER,
        FOREIGN KEY (invoiceId) REFERENCES $invoiceTableName($invoiceId));''');
  }






}

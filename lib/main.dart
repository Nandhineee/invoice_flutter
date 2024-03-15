import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/data/datasources/db_helper.dart';
import 'package:invoice/presentation/pages/invoice_app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = DatabaseHelper();
  db.db;
  runApp(const ProviderScope(child: MyApp()));
}



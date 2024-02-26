import 'package:flutter/material.dart';

class Invoice {
  String invoiceId;
  String invoiceName;
  num price;

  Invoice(this.invoiceId, this.invoiceName,this.price);
}

List<Invoice> invoice = [
  Invoice("#INV001", "Nandhini", 200.00),
  Invoice("#INV002", "Deepa", 500.00),
  Invoice("#INV003", "Kavi", 1000.00),
  Invoice("#INV004", "keerthi", 700.00),
  Invoice("#INV005", "David", 900.00),
  Invoice("#INV006", "John", 650.00),
  Invoice("#INV007", "Harish", 300.00),
  Invoice("#INV008", "Jai", 400.00),

];
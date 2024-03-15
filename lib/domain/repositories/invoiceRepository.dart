import 'package:invoice/domain/models/invoice_list.dart';

abstract class InvoiceRepository{
  Future<bool> invoice(Invoice invoice);

}
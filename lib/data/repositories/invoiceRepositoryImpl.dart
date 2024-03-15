import 'package:invoice/data/datasources/local/invoiceDataSource.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:invoice/domain/repositories/invoiceRepository.dart';

class InvoiceRepositoryImpl extends InvoiceRepository {

  final InvoiceDataSource invoiceDataSource;

  InvoiceRepositoryImpl(this.invoiceDataSource);

  @override
  Future<bool> invoice(Invoice invoice) async {


    bool? result = await invoiceDataSource.insertInvoiceData( invoice);

    if (result!) {
      return true;
    } else {
      return false;
    }
  }
  }


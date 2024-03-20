import 'package:invoice/data/datasources/local/invoiceDataSource.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:invoice/domain/repositories/invoiceRepository.dart';

class InvoiceRepositoryImpl extends InvoiceRepository {

  final InvoiceDataSource invoiceDataSource;

  InvoiceRepositoryImpl(this.invoiceDataSource);






  @override
  Future<bool> invoice(Invoice invoice) async {
      print(invoice);

    bool? result = await invoiceDataSource.insertInvoiceData( invoice);

    if (result!) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<Invoice>?> getInvoice() async {
List<Invoice>? result= await invoiceDataSource.getInvoice();
if(result!.isNotEmpty) {
  print("$result  impl");
  return result;

}
return null;

}

  @override
  Future<void> deleteInvoice(String inId) async {
    await invoiceDataSource.deleteInvoiceById(inId );
    print("$inId impl");

  }
  }




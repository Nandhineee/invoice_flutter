import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/data/datasources/local/invoiceDataSource.dart';
import 'package:invoice/data/repositories/invoiceRepositoryImpl.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:invoice/domain/repositories/invoiceRepository.dart';

final invoiceDataSourceProvider= Provider((ref) => InvoiceDataSource());

final invoiceRepositoryProvider=Provider<InvoiceRepository>((ref) {
  final invoiceDetailsDataSource=ref.read(invoiceDataSourceProvider);
  return InvoiceRepositoryImpl(invoiceDetailsDataSource);
});


final invoiceDetailsProvider = StateNotifierProvider((ref) {
  InvoiceRepository invoiceRepository=ref.read(invoiceRepositoryProvider);
  return InvoiceDetailsNotifier(invoiceRepository);
});

class InvoiceDetailsNotifier extends StateNotifier<bool>{
  final InvoiceRepository invoiceRepository;
  InvoiceDetailsNotifier( this.invoiceRepository):super(false);

  Future<void> createInvoice(Invoice invoice) async {
    try {
      bool result = await invoiceRepository.invoice(invoice);
      state = result;
    } catch (e) {
      print(e);
      state = false;
    }
  }


  dynamic getCreateInvoice() {
    return state;
  }
}
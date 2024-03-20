import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/data/datasources/local/invoiceDataSource.dart';
import 'package:invoice/data/repositories/itemRepositoryImpl.dart';
import 'package:invoice/domain/models/item.dart';
import 'package:invoice/domain/repositories/itemRepository.dart';

final itemDataSourceProvider = Provider((ref)=> InvoiceDataSource());


final  itemDataRepository = Provider<ItemRepository>((ref){

  final itemDetailsDataSource= ref.read(itemDataSourceProvider);
  return ItemRepositoryImpl(itemDetailsDataSource);

});


final itemDetailsProvider = StateNotifierProvider((ref) {
  ItemRepository itemRepository=ref.read(itemDataRepository);
  return InvoiceDetailsNotifier(itemRepository);
});

class InvoiceDetailsNotifier extends StateNotifier<bool> {
  final ItemRepository itemRepository;

  InvoiceDetailsNotifier(this.itemRepository) :super(false);


  Future<void> createItem(Item item) async {
    try {
      bool result = await itemRepository.item(item);
      state = result;
      print('result provider ');
    } catch (e) {
      print(e);
      state = false;
    }
  }

  // Future<void> getItem()async {
  //   state = (await invoiceRepository.getItem())!;
  //   print("$state getinvoice");
  // }

  getInvoices(){
    print("$state  testing");
    return state;
  }

}
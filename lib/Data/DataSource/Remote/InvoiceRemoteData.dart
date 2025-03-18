import '../../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class InvoiceRemoteData {
  CRUD crud;

  InvoiceRemoteData(this.crud);

  getDataInvoice(users_id,room_id,orders_id  ) async {
    var response = await crud.postData(LinksApp.linkinvoice, {
      "users_id":users_id,
      "room_id":room_id,
      "orders_id":orders_id,

    });
    return response.fold((l) => l, (r) => r);
  }
}


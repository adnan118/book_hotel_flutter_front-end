
import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  CheckoutRemoteData {
  CRUD crud;
  CheckoutRemoteData(this.crud);

  checkout(Map data)async{
    var response = await crud.postData(LinksApp.linkcheckout,data);
    return response.fold((l) => l, (r) => r);
  }
}
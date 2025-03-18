import '../../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class OffersRemoteData {
  CRUD crud;

  OffersRemoteData(this.crud);

  getData() async {
    var response = await crud.postData(LinksApp.linkRoomOffers, {});
    return response.fold((l) => l, (r) => r);
  }
}

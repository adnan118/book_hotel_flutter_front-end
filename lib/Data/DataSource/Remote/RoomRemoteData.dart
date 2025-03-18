
import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  RoomRemoteData {
  CRUD crud;
  RoomRemoteData(this.crud);

  getData(categories_id,users_id)async{
    var response = await crud.postData(LinksApp.linkRoomData, {
      "categories_id":categories_id,
      "users_id":users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}

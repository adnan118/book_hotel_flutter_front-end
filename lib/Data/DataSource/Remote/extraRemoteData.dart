import '../../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class ExtraRemoteData {
  CRUD crud;

  ExtraRemoteData(this.crud);

  getDataExtra(typeExtra1Service0Popular) async {
    var response = await crud.postData(LinksApp.linkRoomDataExtra, {
      "extra_isServices":typeExtra1Service0Popular.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}


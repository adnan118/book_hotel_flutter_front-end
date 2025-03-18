import '../../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class ViewProfileRemoteData {
  CRUD crud;

  ViewProfileRemoteData(this.crud);

  getDataProfile(usersId) async {
    var response = await crud.postData(LinksApp.linkProfileData, {
      "users_id":usersId
    });
    return response.fold((l) => l, (r) => r);
  }
}


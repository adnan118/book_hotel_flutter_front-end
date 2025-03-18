
import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  FavoritViewRemoteData {
  CRUD crud;
  FavoritViewRemoteData(this.crud);


  getData( String favorite_usersid)async{
    var response = await crud.postData(LinksApp.linkFavoritAndSaveView, {
      "favorite_usersid":favorite_usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
  //remove

  favoritDeleteRemoteData(   favorite_id)async{
    var response = await crud.postData(LinksApp.linkFavoritAndSaveDelete, {
      "favorite_id":favorite_id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
//add
  favoritAddRemoteData(  usersid, favorite_roomid)async{
    var response = await crud.postData(LinksApp.linkFavoritAndSaveAdd, {
      "favorite_usersid":usersid.toString(),
      "favorite_roomid":favorite_roomid.toString(),

    });
    return response.fold((l) => l, (r) => r);
  }
  // delet on line
  favoritRemoveRemoteData( usersid,  favorite_roomid)async{
    var response = await crud.postData(LinksApp.linkFavoritAndSaveremove, {
      "favorite_usersid":usersid,
      "favorite_roomid":favorite_roomid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
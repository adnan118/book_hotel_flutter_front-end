import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class FavoritDeleteRemoteData {
  CRUD crud;
  FavoritDeleteRemoteData(this.crud);



  AddFavData(  usersid, favorite_roomid)async{
    var response = await crud.postData(LinksApp.linkFavoritAndSaveAdd, {
      "favorite_usersid":usersid,
      "favorite_roomid":favorite_roomid,

    });
    return response.fold((l) => l, (r) => r);
  }

  /*
  //remove

  RemoveFavData(   usersid,  favorite_roomid)async{
    var response = await crud.postData(LinksApp.linkProdRemoveFavorite, {
      "favorite_usersid":usersid,
      "favorite_roomid":favorite_roomid,
    });
    return response.fold((l) => l, (r) => r);
  }
  */
}


import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  HomePageHotelAppRemoteData {
  CRUD crud;
  HomePageHotelAppRemoteData(this.crud);

  getData()async{
    var response = await crud.postData(LinksApp.linkHome, {

    });
    return response.fold((l) => l, (r) => r);
  }

  //search

  getSearchData(search)async{
     var response = await crud.postData(LinksApp.linkSearch, {
      "room_desc":search,
     });
    return response.fold((l) => l, (r) => r);
  }
}

import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  NotificationRemoteData {
  CRUD crud;
  NotificationRemoteData(this.crud);

  getDataNotification(users_id)async{
    var response = await crud.postData(LinksApp.linkNotification, {
      "notification_users":users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}

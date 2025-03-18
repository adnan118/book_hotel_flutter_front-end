class NotificationModel {
  int? notificationId;
  String? notificationTitle;
  String? notificationTitleAr;
  String? notificationBody;
  String? notificationBodyAr;
  int? notificationUsers;

  NotificationModel(
      {this.notificationId,
        this.notificationTitle,
        this.notificationTitleAr,
        this.notificationBody,
        this.notificationBodyAr,
        this.notificationUsers});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationTitleAr = json['notification_titleAr'];
    notificationBody = json['notification_body'];
    notificationBodyAr = json['notification_bodyAr'];
    notificationUsers = json['notification_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_title'] = this.notificationTitle;
    data['notification_titleAr'] = this.notificationTitleAr;
    data['notification_body'] = this.notificationBody;
    data['notification_bodyAr'] = this.notificationBodyAr;
    data['notification_users'] = this.notificationUsers;
    return data;
  }
}
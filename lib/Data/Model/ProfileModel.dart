

class ProfileModel {
  int? usersId;
  String? usersName;
  String? usersFullName;
  String? usersDesc;
  String? usersEmail;
  String? usersPhone;
  String? usersPassword;
  int? usersVerflyCode;
  int? usersApprove;
  String? usersCreateTime;
  String? usersImage;

  ProfileModel(
      {this.usersId,
        this.usersName,
        this.usersFullName,
        this.usersDesc,
        this.usersEmail,
        this.usersPhone,
        this.usersPassword,
        this.usersVerflyCode,
        this.usersApprove,
        this.usersCreateTime,
        this.usersImage});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersFullName = json['users_fullName'];
    usersDesc = json['users_desc'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersPassword = json['users_password'];
    usersVerflyCode = json['users_verflyCode'];
    usersApprove = json['users_approve'];
    usersCreateTime = json['users_createTime'];
    usersImage = json['users_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_fullName'] = this.usersFullName;
    data['users_desc'] = this.usersDesc;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_password'] = this.usersPassword;
    data['users_verflyCode'] = this.usersVerflyCode;
    data['users_approve'] = this.usersApprove;
    data['users_createTime'] = this.usersCreateTime;
    data['users_image'] = this.usersImage;
    return data;
  }
}
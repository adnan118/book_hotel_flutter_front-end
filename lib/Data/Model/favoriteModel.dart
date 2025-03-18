class FavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteRoomid;
  int? roomId;
  int? roomCategories;
  String? roomDesc;
  String? roomDescAr;
  int? roomDiscount;
  int? roomNumfloor;
  int? roomNumroom;
  String? roomImg;
  int? roomPrice;
  int? roomActive;
  int? roomType;
  int? usersId;

  FavoriteModel(
      {this.favoriteId,
        this.favoriteUsersid,
        this.favoriteRoomid,
        this.roomId,
        this.roomCategories,
        this.roomDesc,
        this.roomDescAr,
        this.roomDiscount,
        this.roomNumfloor,
        this.roomNumroom,
        this.roomImg,
        this.roomPrice,
        this.roomActive,
        this.roomType,
        this.usersId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteRoomid = json['favorite_roomid'];
    roomId = json['room_id'];
    roomCategories = json['room_categories'];
    roomDesc = json['room_desc'];
    roomDescAr = json['room_desc_ar'];
    roomDiscount = json['room_discount'];
    roomNumfloor = json['room_numfloor'];
    roomNumroom = json['room_numroom'];
    roomImg = json['room_img'];
    roomPrice = json['room_price'];
    roomActive = json['room_active'];
    roomType = json['room_type'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_roomid'] = this.favoriteRoomid;
    data['room_id'] = this.roomId;
    data['room_categories'] = this.roomCategories;
    data['room_desc'] = this.roomDesc;
    data['room_desc_ar'] = this.roomDescAr;
    data['room_discount'] = this.roomDiscount;
    data['room_numfloor'] = this.roomNumfloor;
    data['room_numroom'] = this.roomNumroom;
    data['room_img'] = this.roomImg;
    data['room_price'] = this.roomPrice;
    data['room_active'] = this.roomActive;
    data['room_type'] = this.roomType;
    data['users_id'] = this.usersId;
    return data;
  }
}
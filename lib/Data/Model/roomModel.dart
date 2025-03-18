class RoomModel {
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
  int? roomIsfavorite;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImg;
  String? categoriesDatetime;
  int? roomPriceDiscount;

  RoomModel(
      {this.roomId,
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
        this.roomIsfavorite,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImg,
        this.categoriesDatetime,
        this.roomPriceDiscount});

  RoomModel.fromJson(Map<String, dynamic> json) {
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
    roomIsfavorite = json['room_isfavorite'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImg = json['categories_img'];
    categoriesDatetime = json['categories_datetime'];
    roomPriceDiscount = json['roomPriceDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['room_isfavorite'] = this.roomIsfavorite;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_img'] = this.categoriesImg;
    data['categories_datetime'] = this.categoriesDatetime;
    data['roomPriceDiscount'] = this.roomPriceDiscount;
    return data;
  }
}
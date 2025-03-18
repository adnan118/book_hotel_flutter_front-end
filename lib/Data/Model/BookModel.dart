class BookModel {
  dynamic? roomTotalPrice;
  int? countRoom;
  int? bookId;
  int? bookUsersid;
  int? bookRoomid;
  int? bookOrders;
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

  BookModel(
      {this.roomTotalPrice,
        this.countRoom,
        this.bookId,
        this.bookUsersid,
        this.bookRoomid,
        this.bookOrders,
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
        this.roomIsfavorite});

  BookModel.fromJson(Map<String, dynamic> json) {
    roomTotalPrice = json['roomTotalPrice'];
    countRoom = json['countRoom'];
    bookId = json['book_id'];
    bookUsersid = json['book_usersid'];
    bookRoomid = json['book_roomid'];
    bookOrders = json['book_orders'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomTotalPrice'] = this.roomTotalPrice;
    data['countRoom'] = this.countRoom;
    data['book_id'] = this.bookId;
    data['book_usersid'] = this.bookUsersid;
    data['book_roomid'] = this.bookRoomid;
    data['book_orders'] = this.bookOrders;
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
    return data;
  }
}
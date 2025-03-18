/*class OrdersModel {
  int? roomDiscountPrice;
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
  int? ordersId;
  int? ordersUsersid;
  int? ordersType;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCoupon;
  String? ordersDatetime;
  String? ordersDatetimeEnd;
  int? ordersPayments;
  int? ordersStause;
  int? ordersRating;
  String? ordersComment;
  int? ordersDays;

  OrdersModel(
      {this.roomDiscountPrice,
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
        this.roomIsfavorite,
        this.ordersId,
        this.ordersUsersid,
        this.ordersType,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersDatetime,
        this.ordersDatetimeEnd,
        this.ordersPayments,
        this.ordersStause,
        this.ordersRating,
        this.ordersComment,
        this.ordersDays});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    roomDiscountPrice = json['RoomDiscountPrice'];
    countRoom = json['CountRoom'];
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
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersType = json['orders_type'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersDatetimeEnd = json['orders_datetime_end'];
    ordersPayments = json['orders_payments'];
    ordersStause = json['orders_stause'];
    ordersRating = json['orders_rating'];
    ordersComment = json['orders_comment'];
    ordersDays = json['orders_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RoomDiscountPrice'] = this.roomDiscountPrice;
    data['CountRoom'] = this.countRoom;
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
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_type'] = this.ordersType;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_datetime_end'] = this.ordersDatetimeEnd;
    data['orders_payments'] = this.ordersPayments;
    data['orders_stause'] = this.ordersStause;
    data['orders_rating'] = this.ordersRating;
    data['orders_comment'] = this.ordersComment;
    data['orders_days'] = this.ordersDays;
    return data;
  }
}

 */
class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersType;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCoupon;
  String? ordersDatetime;
  String? ordersDatetimeEnd;
  int? ordersPayments;
  int? ordersStause;
  int? ordersRating;
  String? ordersComment;
  int? ordersDays;

  OrdersModel(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersType,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersDatetime,
        this.ordersDatetimeEnd,
        this.ordersPayments,
        this.ordersStause,
        this.ordersRating,
        this.ordersComment,
        this.ordersDays});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersType = json['orders_type'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersDatetimeEnd = json['orders_datetime_end'];
    ordersPayments = json['orders_payments'];
    ordersStause = json['orders_stause'];
    ordersRating = json['orders_rating'];
    ordersComment = json['orders_comment'];
    ordersDays = json['orders_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_type'] = this.ordersType;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_datetime_end'] = this.ordersDatetimeEnd;
    data['orders_payments'] = this.ordersPayments;
    data['orders_stause'] = this.ordersStause;
    data['orders_rating'] = this.ordersRating;
    data['orders_comment'] = this.ordersComment;
    data['orders_days'] = this.ordersDays;
    return data;
  }
}
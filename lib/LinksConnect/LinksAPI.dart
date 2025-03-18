class LinksApp{
  static const String linkServerName= "https://app-shop-118259.000webhostapp.com/bookHotel";
  static const String linkServerNamelocal= "http://localhost";

//Auth
  static const String linkLogin="$linkServerName/auth/login.php";
  static const String linkSignUp="$linkServerName/auth/signUp.php";
  static const String linkVfcSign="$linkServerName/auth/vfc.php";
  static const String linkResendVfcSign="$linkServerName/auth/resendvfc.php";
  //FP
  static const String linkCheckEmail="$linkServerName/fgpassword/checkemail.php";
  static const String linkFPVfc="$linkServerName/fgpassword/FPvfc.php";
  static const String linkResetPassword="$linkServerName/fgpassword/resetpassword.php";

  //home
  static const String linkHome="$linkServerName/home.php";
  //offers
  static const String linkRoomOffers="$linkServerName/Room/offers.php";
  //سثشقؤا
  static const String linkSearch="$linkServerName/Room/search.php";
   //img
  static const String linkImag= "$linkServerName/images";
  static const String linkImagRoom= "$linkServerName/images/room";

  static const String linkImagProfile= "$linkServerName/Profile/Images";
  //data room
  static const String linkRoomDataExtra="$linkServerName/Room/extra.php";
  static const String linkRoomData="$linkServerName/Room/rooms.php";
  //data profile
  static const String linkProfileData="$linkServerName/Profile/profile.php";
  static const String linkEditProfileData="$linkServerName/Profile/editProfile.php";
  //favorit and save
  static const String linkFavoritAndSaveAdd="$linkServerName/Room/favorite/add.php";
  static const String linkFavoritAndSaveDelete="$linkServerName/Room/favorite/deletfromfavorite.php";
  static const String linkFavoritAndSaveremove="$linkServerName/Room/favorite/remove.php";
  static const String linkFavoritAndSaveView="$linkServerName/Room/favorite/viewmyfavorite.php";

  //book
  static const String linkBookAdd="$linkServerName/book/add.php";
  static const String linkBookRemove="$linkServerName/book/remove.php";
   static const String linkBookView="$linkServerName/book/view.php";
   //coupon
   static const String linkCoupon="$linkServerName/coupon/checkcoupon.php";
   static const String linkcheckout="$linkServerName/orders/checkout.php";
   //order
   static const String linkPandingOrder="$linkServerName/orders/pandingOrder.php";
   static const String linkArchiveOrder="$linkServerName/orders/ArchiveOrder.php";
   static const String linkOrdersdetails="$linkServerName/orders/ordersdetails.php";
   static const String linkRemoveorder="$linkServerName/orders/removeorder.php";
   static const String linkRating="$linkServerName/orders/rating.php";

   //invoice
  static const String linkinvoice="$linkServerName/orders/invoice.php";

  //Notification
  static const String linkNotification="$linkServerName/Profile/notification.php";

  /////////////////////////Admin
//Auth
  //https://app-shop-118259.000webhostapp.com/bookHotel/admin/login.php
  static const String linkLoginAdmin="$linkServerName/admin/login.php";
  static const String linkSignUpAdmin="$linkServerName/admin/signUp.php";
  static const String linkVfcSignAdmin="$linkServerName/admin/vfc.php";
  static const String linkResendVfcSignAdmin="$linkServerName/admin/resendvfc.php";
  //FP
  static const String linkCheckEmailAdmin="$linkServerName/fgpasswordAdmin/checkemail.php";
  static const String linkFPVfcAdmin="$linkServerName/fgpasswordAdmin/FPvfc.php";
  static const String linkResetPasswordAdmin="$linkServerName/fgpasswordAdmin/resetpassword.php";
  //data profile
  static const String linkProfileDataAdmin="$linkServerName/Profile/profileAdmin.php";
  static const String linkEditProfileDataAdmin="$linkServerName/Profile/editProfileAdmin.php";

  //cat
  static const String linkCatView="$linkServerName/categoiresAdmin/view.php";
  static const String linkCatEdit="$linkServerName/categoiresAdmin/edit.php";
  static const String linkCatAdd="$linkServerName/categoiresAdmin/add.php";
  static const String linkCatDeleted="$linkServerName/categoiresAdmin/delete.php";

  //rooms
  static const String linkRoomView="$linkServerName/roomsAdmin/view.php";
  static const String linkRoomEdit="$linkServerName/roomsAdmin/edit.php";
  static const String linkRoomAdd="$linkServerName/roomsAdmin/add.php";
  static const String linkRoomDeleted="$linkServerName/roomsAdmin/delete.php";

  //order
  static const String linkApproveOrderAdmin="$linkServerName/ordersAdmin/approve.php";
  static const String linkArchiveOrderAdmin="$linkServerName/ordersAdmin/ArchiveOrder.php";
  static const String linkCurrentOrderAdmin="$linkServerName/ordersAdmin/currentOrder.php";
  static const String linkPandingOrderAdmin="$linkServerName/ordersAdmin/pandingOrder.php";
  static const String linkOrdersdetailsAdmin="$linkServerName/ordersAdmin/ordersdetails.php";
  static const String linkRemoveorderAdmin="$linkServerName/ordersAdmin/removeorder.php";
  static const String linkRatingAdmin="$linkServerName/ordersAdmin/rating.php";
  //users
  static const String linkUsersView="$linkServerName/users/view.php";
  static const String linkUsersEdit="$linkServerName/users/edit.php";
  static const String linkUsersAdd="$linkServerName/users/add.php";
  static const String linkUsersDeleted="$linkServerName/users/delete.php";

  //img
  static const String linkImagAdmin= "$linkServerName/images/categories";
  static const String linkImagAdminRoom= "$linkServerName/images/room";
 }
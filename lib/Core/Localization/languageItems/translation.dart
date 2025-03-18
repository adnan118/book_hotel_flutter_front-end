import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "myLang": "ar",
          //OnBoarding
          "title1": "نحن محظوظون جدًا بانضمامك لنا",
          "body1": "مرحبا بكم في أفاميا الشام \nاستمتع بتجربة تطبيقنا",

          "title2": "ما الذي يجعلنا مميزين",
          "body2":
              "الآن يمكنك تخصيص \n غرفتك بالإضافة إلى تصنيفات الغرف \nالعائلية والصحية والرومانسية وغيرها...",

          "title3": "الخدمات والفعاليات",
          "body3":
              "اختر ما تريد\n المزيد لغرفتك، بما في ذلك الخدمات،\n المرافق، المطاعم، حمام السباحة، المنتجع الصحي، إلخ....",

          "title4": "طريقنا",
          "body4":
              "لقد قدمنا لك \n خريطة ترشدك\n للوصول إلينا وحساب المسافة بالكيلومتر",

          "title5": "استعد للتجربة",
          "body5": "احجز الآن واستمتع بتجربة فندقنا المميز",

          //////////////////////////////////////////btn Continue
          "btnContinue": "متابعة",

          ////////////////////////Choose Language
          "chooseLanguage": "اختر اللغة",

          /////////////////////Alert exite

          "Alert": "تنبيه",
          "bodyAlert": "هل تريد الخروج؟ ",
          "btnConfirm": "متابعة",
          "btnCancel": "تجاهل",

          ////////////////////// validinput
          "vEmpty": "لا يمكن أن تكون القيمة فارغة",
          "vUsername": "اسم مستخدم غير صالح",
          "vEmail": "بريد إلكتروني غير صالح",
          "vPhone": "هاتف غير صالح",
          "vMin": "لا يمكن أن تكون القيمة أقل من",
          "vMax": "لا يمكن أن تكون القيمة أكبر من",

          /////////////////////////  Auth
          "titleAuthLogin": "تسجيل دخول",
          "WelcomApp": "مرحبا بكم، نحن نقدركم، أيها الضيوف الأعزاء ",
          "WelcomAppHint": "شارع ابي نواس ساحة العاصي منطقة الزنبقي ",
          "titleBtnAuthLogin": "تسجيل دخول",
          "titleBtnAuthSignUp": "انشاء حساب",
          "titleBtnForgetpassword": "نسيت كلمة المرور",

          "fildEmail": "البريد الالكتروني",
          "fildPassword": "كلمة المرور",
          "fildUsername": "اسم المستخدم",
          "fildFullname": "اسم المستخدم الكامل",
          "fildPhone": "هاتف",

          "titleAppBarrAuthVfc": "كود التحقق",
          "bodyAuthVfc": "من فضلك ادخل كود التحقق",
          "ResendCode": "اعد ارسال الرمز",

          "vfctitleDone": "اشعار افاميا الشام",
          "vfcbodyDone": "تم ارسال كود التحقق بنجاح الى بريدك الالكتروني",

          "errortitleresendcode": "خطأ",
          "errorbodyresendcode": "كود التحقق خاطئ، حاول مرة أخرى..",

          "titlebtnSuccsessSignup": "تسجيل دخول",
          "SuccessSignUp": " تهانينا\n لقد تم التسجيل بنجاح",

          "titleCongratulations": "تهانينا ",
          //FP
          "titleFP": "نسيت كلمة المرور",
          "bodyFP": "هل نسيت كلمة المرور\n لا تقلق",
          "ChickEmailbtnFB": "التحقق",
          "titleRestPassword": "Rest Password",
          "bodyRestPassword": "اوشكت على الانتهاء\n ادخل كلمة المرور الجديدة",
          "fildPasswordRestPassword": "كلمة المرور",
          "fildRePasswordRestPassword": "اعد كلمة المرور",
          "CheckPass": "تاكيد",
          "warningPasswordandRePasswordMatch": "تحذير",
          "PasswordandRePasswordMatch":
              "كلمة المرور وكلمة المرور غير متطابقتين",
          "sampassword": "كلمة المرور الجديدة نفس القديمة",
          "Successrepas": " تهانينا\n لقد تم اعاة كلمة المرور بنجاح",

          //// home
          //////////home
          "intro": "ابحث عن إقامتك القادمة",
          "intro2": "ابحث عن عروض على الغرف وغير ذلك الكثير...",
          "Categories": "التصنيفات",
          "SeasonOffers": "عروض الموسم",
          "TopRated": "الأعلى تقييمًا",

          "Notifications": "الاشعارات",
          "InformationBooking": "معلومات الغرفة",

          "Cardofferstitle": "عروض بطاقاتك",
          "Cardoffersbody":
              "اكتشف الآن العروض المتوفرة بأرخص الأسعار التي تناسب بطاقتك",
          "numberfloor": "رقم الطابق",
          "numberroom": "رقم الغرفة",
          "Price": "السعر",
          "Home": "الرئيسية",
          "Findus": "اوجدنا",
          "Saving": "محفوظات",
          "Scanner": "مسح فاتورة",
          "numtimebooked": "عدد مرات الحجز",
          "TopBooking": "الاكثر حجزا مؤخرا",
          "Search": "بحث",

          //profile
          "tooltipMyProfile": "الملف الشخصي",
          "ViewProfile": "الملف الشخصي",
          "Settings": "الاعدادات",
          "MyBookings": "حجوزاتي",
          "Logout": "خروج",
          "Editprofile": "تعديل",
          "Loading": "تحميل",
          "Joined": "الانضمام",
          "saveEdit": "حفظ",
          "titleerrorprofile": "خطا",
          "bodyerrorprofile": "نفس المعلومات حاول مجددا",
          "fildDesc": "الوصف",

          "Note":"ملحوظة",
          "bodyNote":"سيؤدي هذا الخيار إلى فتح نافذة عائمة",
          "Continuebtn":"متابعة",
          //room data
          "Booking": "حجز",
          "Rate": "التقييم",
          "Services": "الخدمات",
          "Popularamenities": "وسائل الراحة",
          "Highlights": "الإضاءات المميزة",
          "PriceforOneday": "السعر ليوم واحد",
          "Sale": "خصم",

          "Done": "تم",
          "bodyDoneAdd": "تم ,الاضافة الى حجوزاتك",
          "bodyDoneDelete": "تم , الحذف من حجوزاتك",
          "AddtoMyBooking": "أضف الى الحجوزات",
          "RemovedtoMyBooking": "الحذف من الحجوزات",
          "noroom": "لا توجد غرف متاحة حاليًا'",
          "PriceafterDiscount": "السعر بعد الخصم",
          "Checkin": "البداية",
          "Checkout": "النهاية",
          "CustomyourBooking": "تخصيص الغرفة",
          "bookConfirm": "تأكيد الحجز",
          "ChoosePaymentWay": "اختر طريقة الدفع",

          ////my booking
          "MyBooking": "حجوزاتي",
          "dataAboutMyBooking": "معلومات عن حجوزاتي",
          "countRoom": "عدد الغرف",
          "totalPriceOrdersRoom": "المبلغ الاجمالي",
          "Custom": "ادفع",
          "ContinueToCheckOut": "استمر لانهاء الحجز",
          "AllOrders": "جميع الحجوزات",
          "unconfirmed": "غير مثبت",
          "current": "حالي",
          "expired": "منتهي",
          "Days": "عدد الايام",
          "TotalPrice": " الاجمالي",
          "numfloor": " الدور",
          "numroom": " الغرفة ",
          "textPayCash":
              "رائع اوشكت على الانتهاء.. \nتابع اجراءات تثبيت الحجز في مكتب الاستقبال في الفندق",
          "cash": "كاش",
          "accountbank": "حساب بنكي",
          "bodydonerorder": "تم الانتهاء من الحجز",
          "Warning": "تحذير",
          "bodyWarning": "خطا في الحجز",
          "Bookingdetails": "تفاصيل الحجز",
          "textmoredata": "لا قيمة للمال مقابل السعادة\n هذا شعارنا في فندقنا",
          "coast": "الكلفة",
          "time": "الوقت",
          "status": "الحالة",
          "start": "بداية الحجز",
          "end": "نهاية الحجز",
          "delete": "تم الحذف",
          "Current": "حالي",
          "Processes": "قيد المعالجة",
          "Archive": "ارشيف",
          "Room":"غرفة",
          "Coupon":" كوبون",
          "Calculator":" الحاسبة",
          "IhaveCoupon":"لدي كوبون خصم",
          "thankyouforusedCoupon":"شكرا لاستخدامك كوبون",
         "Couponisnotvalid":"كوبون غير صالح",
          "Days*Price=":"عدد الايام * السعر الافرادي =",
          "discount=":"مقدار الخصم =",
          "priceafterdiscount=":"السعر الافرادي بعد الخصم =",
          "totalprice=":"السعر الاجمالي بعد الخصم =",
          "thisisnotfinalinvoice": "هذه ليست فاتورة نهائية",
          "bodyNotedelete":"هل أنت متأكد أنك تريد الحذف؟",
          // RatingBook archive
          "RatingBook": "تقييم الحجز",
          "descrating":
              "اضغط على نجمة لتعيين تقييمك. أضف المزيد من الوصف هنا إذا كنت تريد",
          "commentRating": "قم بتعيين التعليق الخاص بك",
          "Submit": "تاكيد",
          "thnks": "شكرا على تقييمك نحن سعداء برأيك",
          "nothnks": "يوجد محارف غير صالحة في تعليقك, حاول مجددا",
          "yourRatingIs":"تقييمك هو",

          //find us
          "TapstoGetinfoMylocation":"انقر للحصول على المسافة",
          //offers
          "introoffer":"العروض لفترة محدودة",
          "intro2offer":"ابحث عن العرض المناسب لك\n ودعنا نكتشف مكان إقامتك الجديد",
          // notification
          "intro2notification" :"كم هو رائع\n أن يكون لديك لوحة تحكم لإشعاراتك المهمة!",
        },
        "en": {
          "myLang": "en",
          //OnBoarding
          "title1": "We are so lucky \nto have you join us",
          "body1":
              "Welcome to Afamia Alcham \n Enjoy the experience of our application",

          "title2": "What Makes Us Special",
          "body2":
              "Now you can customize \n your room In addition to classifications of rooms \nfor family, health, romantic, etc",

          "title3": "Services And Events",
          "body3":
              "Choose what you want from\n extra for your room, including your services,\n facilities, restaurants, swimming pool, spa, etc....",

          "title4": "The Our Way",
          "body4":
              "We have provided you \n with a map that will guide you\n to reach us and calculate the distance in kilometers",

          "title5": "Get Ready to Experiment",
          "body5": "Booking now and experience our distinctive hotel",

          //////////////////////////////////////////btn Continue
          "btnContinue": "Continue",

          ////////////////////////Choose Language
          "chooseLanguage": "Choose Language",

          /////////////////////Alert exite
          "Alert": "Alert",
          "bodyAlert": "Are you want Exit? ",
          "btnConfirm": "Ok",
          "btnCancel": "Cancel",

          ////////////////////// validinput
          "vEmpty": "Value can not be Empty",
          "vUsername": "not valid Username",
          "vEmail": "not valid Email",
          "vPhone": "not valid Phone",
          "vMin": "Value can not be less than",
          "vMax": "Value can not be larger than",

          /////////////////////////  Auth
          "titleAuthLogin": "Login",
          "WelcomApp": "Welcome\n we appreciate you, dear guests",
          "WelcomAppHint": "Abi Nawas Street, Al-Asi Square, Al-Zanbaqi area",
          "titleBtnAuthLogin": "Login",
          "titleBtnForgetpassword": "Forget password",

          "titleBtnAuthSignUp": "Sign Up",
          "fildEmail": "Email",
          "fildPassword": "Password",
          "fildUsername": "Username",
          "fildFullname": "اFullName",
          "fildPhone": "Phone",

          "titleAppBarrAuthVfc": "verification code",
          "bodyAuthVfc": "Please enter the verification code",
          "ResendCode": "Resend Code",

          "vfctitleDone": "note afamia alcham",
          "vfcbodyDone":
              "The verification code has been successfully sent to your email",

          "errortitleresendcode": "Error",
          "errorbodyresendcode": "VerflyCode is Wrong, Try again..",

          "titlebtnSuccsessSignup": "Login",

          "titleCongratulations": "Congratulations",
          "SuccessSignUp":
              " Congratulations\n you have successfully registered",

          //FP
          "titleFP": "Forget Password",
          "bodyFP": "Are you forget your password ,don not worry",
          "ChickEmailbtnFB": "Check Email",
          "titleRestPassword": "Reset Password",
          "bodyRestPassword":
              "You are almost finished.\n Enter your new password",
          "fildPasswordRestPassword": "Password",
          "fildRePasswordRestPassword": "Re-Password",
          "CheckPass": "Submit",
          "warningPasswordandRePasswordMatch": "Warning",
          "PasswordandRePasswordMatch": "Password and RePassword Not Match",
          "sampassword": "new password is same old password",
          "Successrepas":
              "Congratulations, your password has been successfully restored",

          //////////home
          "intro": "Find your next stay",
          "intro2": "Search deals rooms, and much more...",
          "Categories": "Categories",
          "SeasonOffers": "Season Offers",
          "TopRated": "Top Rated",
          "Notifications": "Notifications",
          "InformationBooking": "Information Booking",
          "Cardofferstitle": "Card offers",
          "Cardoffersbody":
              "Discover now the available offers at the cheapest prices that suit your card",
          "numberfloor": "number floor",
          "numberroom": "number room",
          "Home": "Home",
          "Findus": "Find us",
          "Saving": "Saving",
          "Scanner": "Scanner",
          "Price": "Price",
          "numtimebooked": "Number of time booked",
          "TopBooking": "Top Booking Recently ",
          "Search": "Search",

          //profile
          "tooltipMyProfile": "My Profile",
          "ViewProfile": "View Profile",
          "Settings": "Settings",
          "MyBookings": "My Bookings",
          "Logout": "Log out",

          "Editprofile": "Edit ",
          "Loading": "Loading",
          "Joined": "Joined",
          "saveEdit": "Save",
          "titleerrorprofile": "Error",
          "bodyerrorprofile": "Same Information, Try again..",
          "fildDesc": "Description",
          "Note":"Note",
          "bodyNote":"This option will open a floating window",
          "Continuebtn":"Continue",
          //room data
          "Booking": "Booking",
          "Rate": "Rate",
          "Services": "Services",
          "Popularamenities": "Popular amenities",
          "Highlights": "Highlights",
          "PriceforOneday": "Price for One day",
          "Sale": "Sale",

          "Done": "Done",
          "bodyDoneAdd": "Done ,Added to your Booking",
          "bodyDoneDelete": "Done ,Removed from your Booking",
          "AddtoMyBooking": "Add to My Booking",
          "RemovedtoMyBooking": "Removed from My Booking",
          "noroom": "No rooms available at the moment",
          "PriceafterDiscount": "Price after Discount :",
          "Checkin": "Checkin",
          "Checkout": "Checkout",
          "CustomyourBooking": "Custom your Booking",
          "bookConfirm": "Book Confirmation",
          "ChoosePaymentWay": "Choose Payment Way",
          ////my booking
          "MyBooking": "My Booking",
          "dataAboutMyBooking": "Data About My Booking",
          "countRoom": "Number of rooms",
          "totalPriceOrdersRoom": "Total amount",
          "Custom": "Pay",
          "ContinueToCheckOut": " Compile booking",
          "AllOrders": "All Booking",
          "unconfirmed": "Unconfirmed",
          "current": "Current",
          "expired": "Expired",
          "Days": "Days",
          "TotalPrice": "Total",
          "numfloor": "floor",
          "numroom": "room",
          "textPayCash":
              "Great, you are almost done..\n Follow the procedures for confirming your reservation at the hotel reception desk",
          "cash": "cash",
          "accountbank": "Account Bank",
          "bodydonerorder": "Your booking has been completed",
          "Warning": "Warning",
          "bodyWarning": "error in booking",
          "Bookingdetails": "Booking details",
          "textmoredata":
              "Money has no value for happiness, \nthis is our motto at our hotel",
          "coast": "Coast",
          "time": "Time",
          "status": "Status",
          "start": "Start",
          "end": "End",
          "delete": "Deleted",
          "Current": "Current",
          "Processes": "Processes",
          "Archive": "Archive",
          "Room":"Room",
          "Coupon":"Coupon",
          "Calculator":" Calculator",
          "IhaveCoupon":"I have Coupon",
         "thankyouforusedCoupon":"thank you for used Coupon",
          "Couponisnotvalid":"Coupon is not valid",
          "Days*Price=":"Number of days * individual price=",
          "discount=":"Discount amount=",
          "priceafterdiscount=":"Individual price after discount=",
          "totalprice=":"Total price after discount=",
          "thisisnotfinalinvoice":"this is not final invoice",
          "bodyNotedelete":"Are you sure you want to delete?",
          // RatingBook archive
          "RatingBook": "Rating Book",
          "descrating":
              "Tap a star to set your rating. Add more description here if you want.",
          "commentRating": "Set your comment",
          "Submit": "Submit",
          "thnks": "Thank you for your Rating. We are happy with your opinion.",
          "nothnks": "There are invalid characters in your comment, try again",
          "yourRatingIs":"your Rating Is",

          //find us
          "TapstoGetinfoMylocation":"Taps to get distance",
          //offers
          "introoffer":"Offers for a limited time",
          "intro2offer":"Find the right offer for you \n and let us discover your new residence",

          // notification
          "intro2notification" :"How great \n it is to have a dashboard for your important notifications!",
        },
      };
}



class ExtraModel {
  int? extraId;
  String? extraName;
  String? extraNameAr;
  int? extraIsPopularAmenities;
  int? extraIsServices;
  int? extraAvailable;
  int? extraPrice;
  String? extraImg;

  ExtraModel(
      {this.extraId,
        this.extraName,
        this.extraNameAr,
        this.extraIsPopularAmenities,
        this.extraIsServices,
        this.extraAvailable,
        this.extraPrice,
        this.extraImg});

  ExtraModel.fromJson(Map<String, dynamic> json) {
    extraId = json['extra_id'];
    extraName = json['extra_name'];
    extraNameAr = json['extra_nameAr'];
    extraIsPopularAmenities = json['extra_isPopularAmenities'];
    extraIsServices = json['extra_isServices'];
    extraAvailable = json['extra_available'];
    extraPrice = json['extra_price'];
    extraImg = json['extra_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['extra_id'] = this.extraId;
    data['extra_name'] = this.extraName;
    data['extra_nameAr'] = this.extraNameAr;
    data['extra_isPopularAmenities'] = this.extraIsPopularAmenities;
    data['extra_isServices'] = this.extraIsServices;
    data['extra_available'] = this.extraAvailable;
    data['extra_price'] = this.extraPrice;
    data['extra_img'] = this.extraImg;
    return data;
  }
}
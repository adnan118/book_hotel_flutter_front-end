class CatModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImg;
  String? categoriesDatetime;

  CatModel(
      {this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImg,
        this.categoriesDatetime});

  CatModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImg = json['categories_img'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_img'] = this.categoriesImg;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
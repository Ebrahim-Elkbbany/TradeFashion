class CategoryModel{
  String? categoryName;
  List<ProductModel>productData=[];
  CategoryModel.fromJson(Map<String,dynamic> json){
    categoryName=json['categoryName'];
    json['products'].forEach((element) {
      productData.add(ProductModel.fromJson(element));
    });
  }
}

class ProductModel{
  int? id;
  String? name;
  String? brandName;
  List<Price>? price;
  String? color;
  String? imgUrl;
  List<String>?allImgUrl;

  ProductModel({ this.id, this.name,this.brandName, this.price, this.color, this.imgUrl, this.allImgUrl,});
  ProductModel.fromJson( Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    brandName=json['brandName'];
    color=json['colour'];
    imgUrl=json['imageUrl'];
    json['price'].forEach((element){
      price?.add(Price.fromJson(element));
    });
    allImgUrl?.add(json['additionalImageUrls']);
  }

}
// class ImgUrl{
//   String? imgUrl;
//   ImgUrl({this.imgUrl});
//   ImgUrl.fromJson(Map<String,dynamic>json){
//     imgUrl=json['imgUrl'];
//   }
// }
class Price {
  List<CurrentPrice>current=[];
  List<PreviousPrice>previous=[];
  Price.fromJson(Map<String,dynamic> json){

    json['current'].forEach((element){
      current.add(CurrentPrice.fromJson(element));
    });
    json['previous'].forEach((element){
      previous.add(PreviousPrice.fromJson(element));
    });

  }
}
class CurrentPrice{
  int? value;
  String? text;
  CurrentPrice.fromJson(Map<String,dynamic> json){
    value=json['value'];
    text=json['text'];
  }
}
class PreviousPrice{
  int? value;
  String? text;
  PreviousPrice.fromJson(Map<String,dynamic> json){
    value=json['value'];
    text=json['text'];
  }
}
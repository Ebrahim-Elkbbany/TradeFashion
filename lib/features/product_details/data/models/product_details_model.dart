class ProductDetailsModel {
  final String ? name;
  final String ? gender;
  final String ?description;
  final Rating ? rating;
  final Media ? media;

  ProductDetailsModel(  {this.name, this.description,this.gender,this.rating,this.media});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      name: json['name'],
      description: json['description'],
      gender: json['gender'],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      media:  json['media'] ==null ? null :Media.fromJson(json['media']),
    );
  }
}

class Rating {
  final int ? averageOverallRating;
  final int ? averageOverallStarRating;
  final int ? totalReviewCount;

  Rating({this.averageOverallRating, this.averageOverallStarRating, this.totalReviewCount});

  factory Rating.fromJson(Map<String,dynamic> json) {
    return Rating(
      averageOverallRating: json['averageOverallRating'],
      averageOverallStarRating: json['averageOverallStarRating'],
        totalReviewCount: json['totalReviewCount'],
    );
  }


}

class Media{
 final List<Image> ? images;

  Media({this.images});
  factory Media.fromJson(Map<String,dynamic>json){
    return Media(
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    );
  }

}

class Image{
  final String? url;
  Image({this.url});

  factory Image.fromJson(Map<String,dynamic> json){
    return Image(
      url: json['url']
    );
  }
}

import 'dart:convert';
ProductListRespponseModel productListRespponseModelFromJson(String str) => ProductListRespponseModel.fromJson(json.decode(str));
String productListRespponseModelToJson(ProductListRespponseModel data) => json.encode(data.toJson());
class ProductListRespponseModel {
  ProductListRespponseModel({
      List<Products>? products, 
      dynamic total, 
      dynamic skip, 
      dynamic limit,}){
    _products = products;
    _total = total;
    _skip = skip;
    _limit = limit;
}

  ProductListRespponseModel.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }
  List<Products>? _products;
  dynamic _total;
  dynamic _skip;
  dynamic _limit;
ProductListRespponseModel copyWith({  List<Products>? products,
  dynamic total,
  dynamic skip,
  dynamic limit,
}) => ProductListRespponseModel(  products: products ?? _products,
  total: total ?? _total,
  skip: skip ?? _skip,
  limit: limit ?? _limit,
);
  List<Products>? get products => _products;
  dynamic get total => _total;
  dynamic get skip => _skip;
  dynamic get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['skip'] = _skip;
    map['limit'] = _limit;
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      dynamic id, 
      dynamic title, 
      dynamic description, 
      dynamic category, 
      dynamic price, 
      dynamic discountPercentage, 
      dynamic rating, 
      dynamic stock, 
      List<String>? tags, 
      dynamic brand, 
      dynamic sku, 
      dynamic weight, 
      Dimensions? dimensions, 
      dynamic warrantyInformation, 
      dynamic shippingInformation, 
      dynamic availabilityStatus, 
      List<Reviews>? reviews, 
      dynamic returnPolicy, 
      dynamic minimumOrderQuantity, 
      Meta? meta, 
      List<String>? images, 
      dynamic thumbnail,}){
    _id = id;
    _title = title;
    _description = description;
    _category = category;
    _price = price;
    _discountPercentage = discountPercentage;
    _rating = rating;
    _stock = stock;
    _tags = tags;
    _brand = brand;
    _sku = sku;
    _weight = weight;
    _dimensions = dimensions;
    _warrantyInformation = warrantyInformation;
    _shippingInformation = shippingInformation;
    _availabilityStatus = availabilityStatus;
    _reviews = reviews;
    _returnPolicy = returnPolicy;
    _minimumOrderQuantity = minimumOrderQuantity;
    _meta = meta;
    _images = images;
    _thumbnail = thumbnail;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _category = json['category'];
    _price = json['price'];
    _discountPercentage = json['discountPercentage'];
    _rating = json['rating'];
    _stock = json['stock'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _brand = json['brand'];
    _sku = json['sku'];
    _weight = json['weight'];
    _dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    _warrantyInformation = json['warrantyInformation'];
    _shippingInformation = json['shippingInformation'];
    _availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _returnPolicy = json['returnPolicy'];
    _minimumOrderQuantity = json['minimumOrderQuantity'];
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _thumbnail = json['thumbnail'];
  }
  dynamic _id;
  dynamic _title;
  dynamic _description;
  dynamic _category;
  dynamic _price;
  dynamic _discountPercentage;
  dynamic _rating;
  dynamic _stock;
  List<String>? _tags;
  dynamic _brand;
  dynamic _sku;
  dynamic _weight;
  Dimensions? _dimensions;
  dynamic _warrantyInformation;
  dynamic _shippingInformation;
  dynamic _availabilityStatus;
  List<Reviews>? _reviews;
  dynamic _returnPolicy;
  dynamic _minimumOrderQuantity;
  Meta? _meta;
  List<String>? _images;
  dynamic _thumbnail;
Products copyWith({  dynamic id,
  dynamic title,
  dynamic description,
  dynamic category,
  dynamic price,
  dynamic discountPercentage,
  dynamic rating,
  dynamic stock,
  List<String>? tags,
  dynamic brand,
  dynamic sku,
  dynamic weight,
  Dimensions? dimensions,
  dynamic warrantyInformation,
  dynamic shippingInformation,
  dynamic availabilityStatus,
  List<Reviews>? reviews,
  dynamic returnPolicy,
  dynamic minimumOrderQuantity,
  Meta? meta,
  List<String>? images,
  dynamic thumbnail,
}) => Products(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  category: category ?? _category,
  price: price ?? _price,
  discountPercentage: discountPercentage ?? _discountPercentage,
  rating: rating ?? _rating,
  stock: stock ?? _stock,
  tags: tags ?? _tags,
  brand: brand ?? _brand,
  sku: sku ?? _sku,
  weight: weight ?? _weight,
  dimensions: dimensions ?? _dimensions,
  warrantyInformation: warrantyInformation ?? _warrantyInformation,
  shippingInformation: shippingInformation ?? _shippingInformation,
  availabilityStatus: availabilityStatus ?? _availabilityStatus,
  reviews: reviews ?? _reviews,
  returnPolicy: returnPolicy ?? _returnPolicy,
  minimumOrderQuantity: minimumOrderQuantity ?? _minimumOrderQuantity,
  meta: meta ?? _meta,
  images: images ?? _images,
  thumbnail: thumbnail ?? _thumbnail,
);
  dynamic get id => _id;
  dynamic get title => _title;
  dynamic get description => _description;
  dynamic get category => _category;
  dynamic get price => _price;
  dynamic get discountPercentage => _discountPercentage;
  dynamic get rating => _rating;
  dynamic get stock => _stock;
  List<String>? get tags => _tags;
  dynamic get brand => _brand;
  dynamic get sku => _sku;
  dynamic get weight => _weight;
  Dimensions? get dimensions => _dimensions;
  dynamic get warrantyInformation => _warrantyInformation;
  dynamic get shippingInformation => _shippingInformation;
  dynamic get availabilityStatus => _availabilityStatus;
  List<Reviews>? get reviews => _reviews;
  dynamic get returnPolicy => _returnPolicy;
  dynamic get minimumOrderQuantity => _minimumOrderQuantity;
  Meta? get meta => _meta;
  List<String>? get images => _images;
  dynamic get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['category'] = _category;
    map['price'] = _price;
    map['discountPercentage'] = _discountPercentage;
    map['rating'] = _rating;
    map['stock'] = _stock;
    map['tags'] = _tags;
    map['brand'] = _brand;
    map['sku'] = _sku;
    map['weight'] = _weight;
    if (_dimensions != null) {
      map['dimensions'] = _dimensions?.toJson();
    }
    map['warrantyInformation'] = _warrantyInformation;
    map['shippingInformation'] = _shippingInformation;
    map['availabilityStatus'] = _availabilityStatus;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['returnPolicy'] = _returnPolicy;
    map['minimumOrderQuantity'] = _minimumOrderQuantity;
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['images'] = _images;
    map['thumbnail'] = _thumbnail;
    return map;
  }

}

/// createdAt : "2024-05-23T08:56:21.618Z"
/// updatedAt : "2024-05-23T08:56:21.618Z"
/// barcode : "9164035109868"
/// qrCode : "https://assets.dummyjson.com/public/qr-code.png"

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      dynamic createdAt, 
      dynamic updatedAt, 
      dynamic barcode, 
      dynamic qrCode,}){
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _barcode = barcode;
    _qrCode = qrCode;
}

  Meta.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _barcode = json['barcode'];
    _qrCode = json['qrCode'];
  }
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _barcode;
  dynamic _qrCode;
Meta copyWith({  dynamic createdAt,
  dynamic updatedAt,
  dynamic barcode,
  dynamic qrCode,
}) => Meta(  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  barcode: barcode ?? _barcode,
  qrCode: qrCode ?? _qrCode,
);
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get barcode => _barcode;
  dynamic get qrCode => _qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['barcode'] = _barcode;
    map['qrCode'] = _qrCode;
    return map;
  }

}

/// rating : 2
/// comment : "Very unhappy with my purchase!"
/// date : "2024-05-23T08:56:21.618Z"
/// reviewerName : "John Doe"
/// reviewerEmail : "john.doe@x.dummyjson.com"

Reviews reviewsFromJson(String str) => Reviews.fromJson(json.decode(str));
String reviewsToJson(Reviews data) => json.encode(data.toJson());
class Reviews {
  Reviews({
      dynamic rating, 
      dynamic comment, 
      dynamic date, 
      dynamic reviewerName, 
      dynamic reviewerEmail,}){
    _rating = rating;
    _comment = comment;
    _date = date;
    _reviewerName = reviewerName;
    _reviewerEmail = reviewerEmail;
}

  Reviews.fromJson(dynamic json) {
    _rating = json['rating'];
    _comment = json['comment'];
    _date = json['date'];
    _reviewerName = json['reviewerName'];
    _reviewerEmail = json['reviewerEmail'];
  }
  dynamic _rating;
  dynamic _comment;
  dynamic _date;
  dynamic _reviewerName;
  dynamic _reviewerEmail;
Reviews copyWith({  dynamic rating,
  dynamic comment,
  dynamic date,
  dynamic reviewerName,
  dynamic reviewerEmail,
}) => Reviews(  rating: rating ?? _rating,
  comment: comment ?? _comment,
  date: date ?? _date,
  reviewerName: reviewerName ?? _reviewerName,
  reviewerEmail: reviewerEmail ?? _reviewerEmail,
);
  dynamic get rating => _rating;
  dynamic get comment => _comment;
  dynamic get date => _date;
  dynamic get reviewerName => _reviewerName;
  dynamic get reviewerEmail => _reviewerEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['date'] = _date;
    map['reviewerName'] = _reviewerName;
    map['reviewerEmail'] = _reviewerEmail;
    return map;
  }

}

/// width : 23.17
/// height : 14.43
/// depth : 28.01

Dimensions dimensionsFromJson(String str) => Dimensions.fromJson(json.decode(str));
String dimensionsToJson(Dimensions data) => json.encode(data.toJson());
class Dimensions {
  Dimensions({
      dynamic width, 
      dynamic height, 
      dynamic depth,}){
    _width = width;
    _height = height;
    _depth = depth;
}

  Dimensions.fromJson(dynamic json) {
    _width = json['width'];
    _height = json['height'];
    _depth = json['depth'];
  }
  dynamic _width;
  dynamic _height;
  dynamic _depth;
Dimensions copyWith({  dynamic width,
  dynamic height,
  dynamic depth,
}) => Dimensions(  width: width ?? _width,
  height: height ?? _height,
  depth: depth ?? _depth,
);
  dynamic get width => _width;
  dynamic get height => _height;
  dynamic get depth => _depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = _width;
    map['height'] = _height;
    map['depth'] = _depth;
    return map;
  }

}
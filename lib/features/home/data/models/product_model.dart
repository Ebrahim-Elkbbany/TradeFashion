// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final String? searchTerm;
  final String? categoryName;
  final int? itemCount;
  final String? redirectUrl;
  final List<ProductModelProduct>? products;
  final List<Facet>? facets;
  final Diagnostics? diagnostics;
  final SearchPassMeta? searchPassMeta;
  final dynamic queryId;
  final List<dynamic>? discoverSearchProductTypes;
  final Campaigns? campaigns;

  ProductModel({
    this.searchTerm,
    this.categoryName,
    this.itemCount,
    this.redirectUrl,
    this.products,
    this.facets,
    this.diagnostics,
    this.searchPassMeta,
    this.queryId,
    this.discoverSearchProductTypes,
    this.campaigns,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    searchTerm: json["searchTerm"],
    categoryName: json["categoryName"],
    itemCount: json["itemCount"],
    redirectUrl: json["redirectUrl"],
    products: json["products"] == null ? [] : List<ProductModelProduct>.from(json["products"]!.map((x) => ProductModelProduct.fromJson(x))),
    facets: json["facets"] == null ? [] : List<Facet>.from(json["facets"]!.map((x) => Facet.fromJson(x))),
    diagnostics: json["diagnostics"] == null ? null : Diagnostics.fromJson(json["diagnostics"]),
    searchPassMeta: json["searchPassMeta"] == null ? null : SearchPassMeta.fromJson(json["searchPassMeta"]),
    queryId: json["queryId"],
    discoverSearchProductTypes: json["discoverSearchProductTypes"] == null ? [] : List<dynamic>.from(json["discoverSearchProductTypes"]!.map((x) => x)),
    campaigns: json["campaigns"] == null ? null : Campaigns.fromJson(json["campaigns"]),
  );

  Map<String, dynamic> toJson() => {
    "searchTerm": searchTerm,
    "categoryName": categoryName,
    "itemCount": itemCount,
    "redirectUrl": redirectUrl,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "facets": facets == null ? [] : List<dynamic>.from(facets!.map((x) => x.toJson())),
    "diagnostics": diagnostics?.toJson(),
    "searchPassMeta": searchPassMeta?.toJson(),
    "queryId": queryId,
    "discoverSearchProductTypes": discoverSearchProductTypes == null ? [] : List<dynamic>.from(discoverSearchProductTypes!.map((x) => x)),
    "campaigns": campaigns?.toJson(),
  };
}

class Campaigns {
  final List<dynamic>? imageTiles;
  final List<dynamic>? promoBanners;
  final List<dynamic>? sponsoredProducts;

  Campaigns({
    this.imageTiles,
    this.promoBanners,
    this.sponsoredProducts,
  });

  factory Campaigns.fromJson(Map<String, dynamic> json) => Campaigns(
    imageTiles: json["imageTiles"] == null ? [] : List<dynamic>.from(json["imageTiles"]!.map((x) => x)),
    promoBanners: json["promoBanners"] == null ? [] : List<dynamic>.from(json["promoBanners"]!.map((x) => x)),
    sponsoredProducts: json["sponsoredProducts"] == null ? [] : List<dynamic>.from(json["sponsoredProducts"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "imageTiles": imageTiles == null ? [] : List<dynamic>.from(imageTiles!.map((x) => x)),
    "promoBanners": promoBanners == null ? [] : List<dynamic>.from(promoBanners!.map((x) => x)),
    "sponsoredProducts": sponsoredProducts == null ? [] : List<dynamic>.from(sponsoredProducts!.map((x) => x)),
  };
}

class Diagnostics {
  final String? requestId;
  final int? processingTime;
  final int? queryTime;
  final bool? recommendationsEnabled;
  final RecommendationsAnalytics? recommendationsAnalytics;
  final bool? advertisementsEnabled;
  final AdvertisementsAnalytics? advertisementsAnalytics;

  Diagnostics({
    this.requestId,
    this.processingTime,
    this.queryTime,
    this.recommendationsEnabled,
    this.recommendationsAnalytics,
    this.advertisementsEnabled,
    this.advertisementsAnalytics,
  });

  factory Diagnostics.fromJson(Map<String, dynamic> json) => Diagnostics(
    requestId: json["requestId"],
    processingTime: json["processingTime"],
    queryTime: json["queryTime"],
    recommendationsEnabled: json["recommendationsEnabled"],
    recommendationsAnalytics: json["recommendationsAnalytics"] == null ? null : RecommendationsAnalytics.fromJson(json["recommendationsAnalytics"]),
    advertisementsEnabled: json["advertisementsEnabled"],
    advertisementsAnalytics: json["advertisementsAnalytics"] == null ? null : AdvertisementsAnalytics.fromJson(json["advertisementsAnalytics"]),
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "processingTime": processingTime,
    "queryTime": queryTime,
    "recommendationsEnabled": recommendationsEnabled,
    "recommendationsAnalytics": recommendationsAnalytics?.toJson(),
    "advertisementsEnabled": advertisementsEnabled,
    "advertisementsAnalytics": advertisementsAnalytics?.toJson(),
  };
}

class AdvertisementsAnalytics {
  final int? status;
  final bool? customerOptIn;
  final int? numberOfItemsFromPartner;
  final List<dynamic>? items;
  final List<dynamic>? itemsFromPartner;
  final PlacementBeacons? placementBeacons;

  AdvertisementsAnalytics({
    this.status,
    this.customerOptIn,
    this.numberOfItemsFromPartner,
    this.items,
    this.itemsFromPartner,
    this.placementBeacons,
  });

  factory AdvertisementsAnalytics.fromJson(Map<String, dynamic> json) => AdvertisementsAnalytics(
    status: json["status"],
    customerOptIn: json["customerOptIn"],
    numberOfItemsFromPartner: json["numberOfItemsFromPartner"],
    items: json["items"] == null ? [] : List<dynamic>.from(json["items"]!.map((x) => x)),
    itemsFromPartner: json["itemsFromPartner"] == null ? [] : List<dynamic>.from(json["itemsFromPartner"]!.map((x) => x)),
    placementBeacons: json["placementBeacons"] == null ? null : PlacementBeacons.fromJson(json["placementBeacons"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "customerOptIn": customerOptIn,
    "numberOfItemsFromPartner": numberOfItemsFromPartner,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
    "itemsFromPartner": itemsFromPartner == null ? [] : List<dynamic>.from(itemsFromPartner!.map((x) => x)),
    "placementBeacons": placementBeacons?.toJson(),
  };
}

class PlacementBeacons {
  final dynamic onLoadBeacon;
  final dynamic onViewBeacon;

  PlacementBeacons({
    this.onLoadBeacon,
    this.onViewBeacon,
  });

  factory PlacementBeacons.fromJson(Map<String, dynamic> json) => PlacementBeacons(
    onLoadBeacon: json["onLoadBeacon"],
    onViewBeacon: json["onViewBeacon"],
  );

  Map<String, dynamic> toJson() => {
    "onLoadBeacon": onLoadBeacon,
    "onViewBeacon": onViewBeacon,
  };
}

class RecommendationsAnalytics {
  final int? personalisationStatus;
  final int? numberOfItems;
  final int? numberOfRecs;
  final String? personalisationType;
  final String? experimentTrackerkey;
  final List<dynamic>? items;

  RecommendationsAnalytics({
    this.personalisationStatus,
    this.numberOfItems,
    this.numberOfRecs,
    this.personalisationType,
    this.experimentTrackerkey,
    this.items,
  });

  factory RecommendationsAnalytics.fromJson(Map<String, dynamic> json) => RecommendationsAnalytics(
    personalisationStatus: json["personalisationStatus"],
    numberOfItems: json["numberOfItems"],
    numberOfRecs: json["numberOfRecs"],
    personalisationType: json["personalisationType"],
    experimentTrackerkey: json["experimentTrackerkey"],
    items: json["items"] == null ? [] : List<dynamic>.from(json["items"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "personalisationStatus": personalisationStatus,
    "numberOfItems": numberOfItems,
    "numberOfRecs": numberOfRecs,
    "personalisationType": personalisationType,
    "experimentTrackerkey": experimentTrackerkey,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
  };
}

class Facet {
  final String? id;
  final String? name;
  final List<FacetValue>? facetValues;
  final DisplayStyle? displayStyle;
  final FacetType? facetType;
  final bool? hasSelectedValues;

  Facet({
    this.id,
    this.name,
    this.facetValues,
    this.displayStyle,
    this.facetType,
    this.hasSelectedValues,
  });

  factory Facet.fromJson(Map<String, dynamic> json) => Facet(
    id: json["id"],
    name: json["name"],
    facetValues: json["facetValues"] == null ? [] : List<FacetValue>.from(json["facetValues"]!.map((x) => FacetValue.fromJson(x))),
    displayStyle: displayStyleValues.map[json["displayStyle"]]!,
    facetType: facetTypeValues.map[json["facetType"]]!,
    hasSelectedValues: json["hasSelectedValues"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "facetValues": facetValues == null ? [] : List<dynamic>.from(facetValues!.map((x) => x.toJson())),
    "displayStyle": displayStyleValues.reverse[displayStyle],
    "facetType": facetTypeValues.reverse[facetType],
    "hasSelectedValues": hasSelectedValues,
  };
}

enum DisplayStyle {
  PRICE_SLIDER,
  SINGLE_COLUMN
}

final displayStyleValues = EnumValues({
  "Price-Slider": DisplayStyle.PRICE_SLIDER,
  "Single-Column": DisplayStyle.SINGLE_COLUMN
});

enum FacetType {
  RANGE,
  TEXT_MULTI_SELECT
}

final facetTypeValues = EnumValues({
  "Range": FacetType.RANGE,
  "TextMultiSelect": FacetType.TEXT_MULTI_SELECT
});

class FacetValue {
  final int? count;
  final String? id;
  final String? name;
  final bool? isSelected;

  FacetValue({
    this.count,
    this.id,
    this.name,
    this.isSelected,
  });

  factory FacetValue.fromJson(Map<String, dynamic> json) => FacetValue(
    count: json["count"],
    id: json["id"],
    name: json["name"],
    isSelected: json["isSelected"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "id": id,
    "name": name,
    "isSelected": isSelected,
  };
}

class ProductModelProduct {
  final int? id;
  final String? name;
  final Price? price;
  final String? colour;
  final int? colourWayId;
  final String? brandName;
  final bool? hasVariantColours;
  final bool? hasMultiplePrices;
  final dynamic groupId;
  final int? productCode;
  final ProductType? productType;
  final String? url;
  final String? imageUrl;
  final List<String>? additionalImageUrls;
  final dynamic videoUrl;
  final bool? showVideo;
  final bool? isSellingFast;
  final dynamic sponsoredCampaignId;
  final List<FacetGrouping>? facetGroupings;
  final dynamic advertisement;

  ProductModelProduct({
    this.id,
    this.name,
    this.price,
    this.colour,
    this.colourWayId,
    this.brandName,
    this.hasVariantColours,
    this.hasMultiplePrices,
    this.groupId,
    this.productCode,
    this.productType,
    this.url,
    this.imageUrl,
    this.additionalImageUrls,
    this.videoUrl,
    this.showVideo,
    this.isSellingFast,
    this.sponsoredCampaignId,
    this.facetGroupings,
    this.advertisement,
  });

  factory ProductModelProduct.fromJson(Map<String, dynamic> json) => ProductModelProduct(
    id: json["id"],
    name: json["name"],
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    colour: json["colour"],
    colourWayId: json["colourWayId"],
    brandName: json["brandName"],
    hasVariantColours: json["hasVariantColours"],
    hasMultiplePrices: json["hasMultiplePrices"],
    groupId: json["groupId"],
    productCode: json["productCode"],
    productType: productTypeValues.map[json["productType"]]!,
    url: json["url"],
    imageUrl: json["imageUrl"],
    additionalImageUrls: json["additionalImageUrls"] == null ? [] : List<String>.from(json["additionalImageUrls"]!.map((x) => x)),
    videoUrl: json["videoUrl"],
    showVideo: json["showVideo"],
    isSellingFast: json["isSellingFast"],
    sponsoredCampaignId: json["sponsoredCampaignId"],
    facetGroupings: json["facetGroupings"] == null ? [] : List<FacetGrouping>.from(json["facetGroupings"]!.map((x) => FacetGrouping.fromJson(x))),
    advertisement: json["advertisement"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price?.toJson(),
    "colour": colour,
    "colourWayId": colourWayId,
    "brandName": brandName,
    "hasVariantColours": hasVariantColours,
    "hasMultiplePrices": hasMultiplePrices,
    "groupId": groupId,
    "productCode": productCode,
    "productType": productTypeValues.reverse[productType],
    "url": url,
    "imageUrl": imageUrl,
    "additionalImageUrls": additionalImageUrls == null ? [] : List<dynamic>.from(additionalImageUrls!.map((x) => x)),
    "videoUrl": videoUrl,
    "showVideo": showVideo,
    "isSellingFast": isSellingFast,
    "sponsoredCampaignId": sponsoredCampaignId,
    "facetGroupings": facetGroupings == null ? [] : List<dynamic>.from(facetGroupings!.map((x) => x.toJson())),
    "advertisement": advertisement,
  };
}

class FacetGrouping {
  final List<FacetGroupingProduct>? products;
  final String? type;

  FacetGrouping({
    this.products,
    this.type,
  });

  factory FacetGrouping.fromJson(Map<String, dynamic> json) => FacetGrouping(
    products: json["products"] == null ? [] : List<FacetGroupingProduct>.from(json["products"]!.map((x) => FacetGroupingProduct.fromJson(x))),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "type": type,
  };
}

class FacetGroupingProduct {
  final int? productId;

  FacetGroupingProduct({
    this.productId,
  });

  factory FacetGroupingProduct.fromJson(Map<String, dynamic> json) => FacetGroupingProduct(
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
  };
}

class Price {
  final Current? current;
  final Current? previous;
  final Current? rrp;
  final bool? isMarkedDown;
  final bool? isOutletPrice;
  final Currency? currency;

  Price({
    this.current,
    this.previous,
    this.rrp,
    this.isMarkedDown,
    this.isOutletPrice,
    this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
    previous: json["previous"] == null ? null : Current.fromJson(json["previous"]),
    rrp: json["rrp"] == null ? null : Current.fromJson(json["rrp"]),
    isMarkedDown: json["isMarkedDown"],
    isOutletPrice: json["isOutletPrice"],
    currency: currencyValues.map[json["currency"]]!,
  );

  Map<String, dynamic> toJson() => {
    "current": current?.toJson(),
    "previous": previous?.toJson(),
    "rrp": rrp?.toJson(),
    "isMarkedDown": isMarkedDown,
    "isOutletPrice": isOutletPrice,
    "currency": currencyValues.reverse[currency],
  };
}

enum Currency {
  USD
}

final currencyValues = EnumValues({
  "USD": Currency.USD
});

class Current {
  final double? value;
  final String? text;

  Current({
    this.value,
    this.text,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    value: json["value"]?.toDouble(),
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}

enum ProductType {
  PRODUCT
}

final productTypeValues = EnumValues({
  "Product": ProductType.PRODUCT
});

class SearchPassMeta {
  final bool? isPartial;
  final bool? isSpellcheck;
  final List<dynamic>? searchPass;
  final List<dynamic>? alternateSearchTerms;

  SearchPassMeta({
    this.isPartial,
    this.isSpellcheck,
    this.searchPass,
    this.alternateSearchTerms,
  });

  factory SearchPassMeta.fromJson(Map<String, dynamic> json) => SearchPassMeta(
    isPartial: json["isPartial"],
    isSpellcheck: json["isSpellcheck"],
    searchPass: json["searchPass"] == null ? [] : List<dynamic>.from(json["searchPass"]!.map((x) => x)),
    alternateSearchTerms: json["alternateSearchTerms"] == null ? [] : List<dynamic>.from(json["alternateSearchTerms"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "isPartial": isPartial,
    "isSpellcheck": isSpellcheck,
    "searchPass": searchPass == null ? [] : List<dynamic>.from(searchPass!.map((x) => x)),
    "alternateSearchTerms": alternateSearchTerms == null ? [] : List<dynamic>.from(alternateSearchTerms!.map((x) => x)),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class ProductModel {
  final String? id;
  final String? en_name;
  final String? ar_name;
  final String? userName;
  final String? userId;
  final String? modelId;
  final String? modelName;
  final String? imageUrl;
  final double? price;
  final int? offer;
  final String? brand;
  final String? catId;
  final String? categoryNameEN;
  final String? categoryNameAR;
  final List? images;
  final List? special;
  final List? general;


  ProductModel(
      {this.id,
      this.en_name,
        this.general,
        this.special,
        this.images,
      this.ar_name,
      this.modelId,
      this.imageUrl,
      this.price,
      this.offer,
      this.brand,
        this.catId,
        this.userName,
        this.categoryNameAR,
        this.categoryNameEN,
        this.modelName,
        this.userId,
    });


}


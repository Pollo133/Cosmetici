import 'colore.dart';

class Prodotto{
  int? _id;
  String? _brand;
  String? _price;
  String? _name;
  String? _priceSign;
  String? _imageLink;
  String? _productLink;
  String? _description;
  String? _category;
  String? _productType;
  List<Colore> _colore = [];

  Prodotto(
      this._name,
      this._id,
      this._brand,
      this._price,
      this._priceSign,
      this._imageLink,
      this._productLink,
      this._description,
      this._category,
      this._productType,
      this._colore);

  Prodotto.fromJson(Map<String, dynamic> variabile){
    _id = variabile['id'];
    print(id);
    _brand = variabile['brand'];
    print(brand);
    _price= variabile['price'];
    print(price);
    _name = variabile['name'];
    print(name);
    _priceSign= variabile['price_sign'];
    print(priceSign);
    _imageLink= variabile['image_link'];
    print(imageLink);
    _productLink= variabile['product_link'];
    print(productLink);
    _description= variabile['description'];
    print(description);
    _category= variabile['category'];
    print(category);
    _productType= variabile['product_type'];
    print(productType);
    _colore= variabile['product_colors'];
    print(colore);

  }

  String get name => _name!;

  set name(String value) {
    _name = value;
  }

  List<Colore> get colore => _colore;

  set colore(List<Colore> value) {
    _colore = value;
  }

  String get productType => _productType!;

  set productType(String value) {
    _productType = value;
  }

  String get category => _category!;

  set category(String value) {
    _category = value;
  }


  String get description => _description!;

  set description(String value) {
    _description = value;
  }

  String get productLink => _productLink!;

  set productLink(String value) {
    _productLink = value;
  }

  String get imageLink => _imageLink!;

  set imageLink(String value) {
    _imageLink = value;
  }

  String get priceSign => _priceSign!;

  set priceSign(String value) {
    _priceSign = value;
  }

  String get price => _price!;

  set price(String value) {
    _price = value;
  }

  String get brand => _brand!;

  set brand(String value) {
    _brand = value;
  }

  int get id => _id!;

  set id(int value) {
    _id = value;
  }
}






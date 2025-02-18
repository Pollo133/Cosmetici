import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Prodotto{
  int? _id;
  String? _brand;
  String? _price;
  String? _name;
  String? _imageLink;
  String? _productLink;
  String? _description;
  String? _category;
  String? _productType;
  List<String> _colori = [];


  Prodotto(
      this._name,
      this._id,
      this._brand,
      this._price,
      this._imageLink,
      this._productLink,
      this._description,
      this._category,
      this._productType,
      this._colori);

  Prodotto.fromJson(Map<String, dynamic> variabile){
    _colori.removeRange(0, _colori.length);
    _id = variabile['id']?? '';
    //print(id);
    _brand = variabile['brand'] ?? '';
    //print(brand);
    _price= variabile['price']?? 'unavaible';
    //print(price);
    _name = variabile['name'].trim() ?? '';
    //print(name);
    _imageLink= variabile['image_link'] ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';
    checkImage();
    //print(imageLink);
    _productLink= variabile['product_link']?? '';
    //print(productLink);
    _description= variabile['description']?? '';
    //print(description);
    _category= variabile['category'] ??'';
    //print(category);
    _productType= variabile['product_type']??'';
    //print(productType);
    if (variabile["product_colors"] is List) {
      _colori = variabile["product_colors"].map<String>((color) => color["hex_value"].toString()).toList();
    }
    else if (variabile["product_colors"] is String) {
      _colori.add(variabile["product_colors"]);
    }
  }


  String get name => _name!;

  set name(String value) {
    _name = value;
  }

  List<String> get colori => _colori;

  set colori(List<String> value) {
    _colori = value;
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
  void checkImage() async {
    Uri uri = Uri.parse(imageLink);
    http.Response response = await http.get(uri);

    try {
      if (response.statusCode != 200) {
        _imageLink = "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg";
      }
    } on SocketException{
      _imageLink = "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg";
    }
  }
}
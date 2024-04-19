class CategoryA{
  String? _linkImage;
  String? _categoryName;

  CategoryA(this._linkImage, this._categoryName);

  CategoryA.name(this._linkImage, this._categoryName);

  String get categoryName => _categoryName!;

  set categoryName(String value) {
    _categoryName = value;
  }

  String get linkImage => _linkImage!;

  set linkImage(String value) {
    _linkImage = value;
  }

  @override
  String toString() {
    return 'Categoria{_linkImage: $_linkImage, _categoryName: $_categoryName}';
  }
}
import 'package:flutter/cupertino.dart';
import 'categoria.dart';

class ShowProducts extends StatefulWidget{
  ShowProducts({super.key, required this.categories});
  List<CategoryA> categories;

  @override
  State<StatefulWidget> createState(categories) {

  }

}

class _ShowProductsState extends ShowProducts{
  Widget build(BuildContext context) {
    return const Expanded(child: SingleChildScrollView());

  }
}
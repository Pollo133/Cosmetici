import 'package:cosmetici/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailProdotto.dart';
import 'prodotto.dart';
import 'productItem.dart';


class ShowProducts extends StatefulWidget {

  List<Prodotto> products;
  ShowProducts({super.key, required this.products});

  @override
  _ShowProductsState createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  String? _selectedCategory;
  String? _selectedBrand;
  List<String> brands = [];
  List<Prodotto> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    searchBrands();
    if(_selectedBrand == null)
      _selectedBrand = brands[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cosmetici", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showFilter(context);
            },
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        padding: EdgeInsets.all(10.0),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ShowDetails(product: widget.products[index])));
            },
            child: ProductItem(
              product: widget.products[index],
            ),
          );
        },
      ),
    );
  }

  void showFilter(BuildContext context) {
    RangeValues _currentRangeValues = const RangeValues(0, 100);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
              items: brands.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value));
              }).toList(),
              //hint: Text(_selectedBrand!),
              value: _selectedBrand,
              onChanged: (value) {
                setState(() {
                  _selectedBrand = value;
                });
              }),
              SizedBox(height: 16.0),
              Text('Price', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 20,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString()),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowProducts(products: filteredProducts),
                    ),
                  );
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        );
      },
    );
  }

  void searchBrands(){
    brands.removeRange(0, brands.length);
    for(int i = 0; i < widget.products.length; i++){
      if(!brands.contains(widget.products[i].brand ) && widget.products[i].brand.isNotEmpty){
        brands.add(widget.products[i].brand);
      }
    }
  }

}
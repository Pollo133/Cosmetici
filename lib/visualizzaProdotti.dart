
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
  String? _selectedColor;
  String? _selectedCategory;
  List<String> _selectedBrands = [];
  double _currentPrice = 10;

  @override
  Widget build(BuildContext context) {
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
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                hint: Text('Color'),
                value: _selectedColor,
                onChanged: (value) {
                  setState(() {
                    _selectedColor = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('None'),
                    value: 'None',
                  ),
                  DropdownMenuItem(
                    child: Text('Color1'),
                    value: 'Color1',
                  ),
                  DropdownMenuItem(
                    child: Text('Color2'),
                    value: 'Color2',
                  ),
                ],
              ),

              DropdownButton<String>(
                hint: Text('Category'),
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('None'),
                    value: 'None',
                  ),
                  DropdownMenuItem(
                    child: Text('Primo'), value: 'Primo',),
                  DropdownMenuItem(
                    child: Text('Secondo'), value: 'Secondo',),
                  DropdownMenuItem(
                    child: Text('Terzo'), value: 'Terzo',),
                ],
              ),

              DropdownButton<String>(
                hint: Text('Brand'),
                value: _selectedBrands.isNotEmpty ? _selectedBrands.first : null,
                onChanged: (value) {
                  setState(() {
                    if (_selectedBrands!.contains(value!)) {
                      _selectedBrands.remove(value);
                    }
                    else {
                      _selectedBrands.add(value!);
                    }
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('None'),
                    value: 'None',
                  ),
                  DropdownMenuItem(
                    child: Text('Brand1'),
                    value: 'Brand1',),
                  DropdownMenuItem(
                    child: Text('Brand2'), value: 'Brand2',),
                  DropdownMenuItem(
                    child: Text('Brand3'), value: 'Brand3',),
                ],
              ),
              SizedBox(height: 16.0),
              Text('Price', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              Slider(
                min: 0,
                max: 50,
                divisions: 2,
                label: '\$${_currentPrice.toStringAsFixed(0)}',
                onChanged: (value) {
                  setState(() {
                    _currentPrice = value;
                  });
                },
                value: _currentPrice,
              ),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  List<Prodotto> filteredProducts = widget.products.where((product) {
                    return (product.colori == _selectedColor || _selectedColor == null || _selectedColor == '') &&
                        (product.category == _selectedCategory || _selectedCategory == null || _selectedCategory == '') &&
                        (_selectedBrands.isEmpty || _selectedBrands.contains(product.brand)) ;
                    //&& product.price <= _currentPrice;
                  }).toList();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowProducts(products: filteredProducts),
                    ),
                  );
                },
                child: Text('Apply'),
              ),


            ],
          ),
        );
      },
    );
  }

}
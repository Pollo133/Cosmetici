import 'package:flutter/material.dart';
import 'detailProdotto.dart';
import 'prodotto.dart';
import 'productItem.dart';


class ShowProducts extends StatefulWidget {
  final List<Prodotto> products;
  const ShowProducts({super.key, required this.products});

  @override
  _ShowProductsState createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  List<String> brands = [];
  String? _selectedBrand;
  RangeValues _currentRangeValues = const RangeValues(10, 70);


  @override
  Widget build(BuildContext context) {
    searchBrands();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cosmetici", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white,),
            onPressed: () {
              showFilter(context);
            },
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        padding: const EdgeInsets.all(10.0),
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton(
                  value: _selectedBrand,
                  hint: const Text("Brand"),
                  items: brands.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value));
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      _selectedBrand = value!;
                    });
                  }
              ),
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 20,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  List<Prodotto> filteredProducts = widget.products.where((product) {
                    return (_selectedBrand == null|| product.brand == _selectedBrand) &&
                        double.parse(product.price)>= _currentRangeValues.start.toDouble() &&
                        double.parse(product.price) <= _currentRangeValues.end.toDouble();}).toList();

                  if (filteredProducts.isEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.purple,),
                          body: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.warning, size: 30,),
                                Text("Nessun prodotto disponibile", style: TextStyle(fontSize: 30),),],
                            ),),),),);}
                  else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowProducts(products: filteredProducts),
                      ),
                    );
                  }},
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
      if(!brands.contains(widget.products[i].brand) && widget.products[i].brand.isNotEmpty){
        brands.add(widget.products[i].brand);
      }
    }
    brands.sort();
  }
}
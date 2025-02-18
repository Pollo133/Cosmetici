import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'prodotto.dart';
import 'visualizzaProdotti.dart';
import 'categoria.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _errorResearchText;
  TextEditingController ctrResearch = TextEditingController();
  String _result = "";
  bool isResearchValid= false;
  String? productType;
  List<CategoryA> categories = [];
  List<Prodotto> products = [];
  List<String> categoriesName = [];


  @override
  Widget build(BuildContext context) {
    populateCategory();
    return Scaffold(
      appBar: AppBar(title: const Text("Cosmetici", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple,),
      body: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                labelText: "Cerca cosmetico",
                hintText: "Inseriesci il nome di un cosmetico",
                errorText: _errorResearchText,
                border: const OutlineInputBorder(),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    textSearchName();
                  },
                ),
              ),
              controller: ctrResearch,
              onSubmitted: (value){
                textSearchName();
              }
          ),
          const SizedBox(height: 15,),
          const Text("CATEGORIES", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Align(alignment: Alignment.center,
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {allProducts();},
                    child: const Text("Mostra tutti i prodotti", style: TextStyle(fontSize: 14, color: Colors.black ),),))),
          const SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, index){
                return GestureDetector(
                    onTap: () {
                      productType = categories[index].categoryName.toLowerCase();
                      findProductctr();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: MediaQuery.of(context).size.height * 0.01,),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),),
                      child: Row(children:[
                        Image.network(categories[index].linkImage, height: 80, width: 80,),
                        const SizedBox(width: 16),
                        Expanded(child:
                        Text(categories[index].categoryName, style: const TextStyle(fontSize: 20),),),
                        IconButton(
                           icon: const Icon(Icons.manage_search),
                            onPressed: () {
                              productType = categories[index].categoryName.toLowerCase();
                              findProductctr();
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProducts(products: products)));
                            }
                        )
                      ],
                      ),
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  void textSearchName() {
    isResearchValid = true;

    setState(() {
      _errorResearchText = null;

      if(ctrResearch.text.isEmpty){
        isResearchValid = false;
        _errorResearchText = "Prodotto non valido";
        print("Prodotto non valido");
      }
      else{
        isResearchValid = true;
        productType = ctrResearch.text;
        findProductctr();
      }
    });
  }


  Future findProductctr() async{

    const dominio = 'makeup-api.herokuapp.com';
    const percorsoFile = '/api/v1/products.json';

    Map<String, dynamic> parametri = {'product_type': productType};
    Uri uri = Uri.https(dominio, percorsoFile, parametri);
    //print(uri);
    http.get(uri).then((result) {
      _result = result.body;
      setState(() {
        if (_result == "[]") {
          isResearchValid = false;
          _errorResearchText = "Prodotto non valido";
          return;
        }
        else {
          isResearchValid= true;
        }
        //print(result.body);
        final productsMap = json.decode(result.body);
        products = productsMap.map<Prodotto>((var productMap) => Prodotto.fromJson(productMap)).toList();
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProducts(products: products),),);
      });
    });
  }

  List<String> populateCategory(){
    categories.removeRange(0, categories.length);
    categories.add(CategoryA("https://img.alicdn.com/imgextra/i1/6000000003078/O1CN01quuyrl1YbldlylkVM_!!6000000003078-0-tbvideo.jpg", "Blush"));
    categories.add(CategoryA("https://cdn.mos.cms.futurecdn.net/whowhatwear/posts/298134/best-bronzer-for-fair-skin-298134-1645826297301-main.jpg?interlace=true&quality=70", "Bronzer"));
    categories.add(CategoryA("https://www.thetimes.co.uk/imageserver/image/methode/sundaytimes/prod/web/bin/dd4e7a6e-2490-11e9-9ff0-49a5245b8995.jpg?crop=2667%2C1500%2C0%2C0", "Eyebrow"));
    categories.add(CategoryA("https://i5.walmartimages.com/asr/72984064-a515-4d0f-8746-803fbaa6f8ed.ff3842fafc5ab8c4fe45c01bfafd72f8.jpeg", "Eyeliner"));
    categories.add(CategoryA("https://images-na.ssl-images-amazon.com/images/I/81WEr65nPJL._SL1500_.jpg", "Eyeshadow"));
    categories.add(CategoryA("https://i.notino.com/view/helena-rubinstein/hrusemw_kmup20__22.jpg", "Foundation"));
    categories.add(CategoryA("https://ae01.alicdn.com/kf/HTB1jqhdoS_I8KJjy0Foq6yFnVXay/12pcs-Lot-Set-12-Colors-Professional-Lipliner-Makeup-Waterproof-Lip-Liner-Pencil-F905.jpg", "Lip liner"));
    categories.add(CategoryA("https://keyassets-p2.timeincuk.net/wp/prod/wp-content/uploads/sites/57/2016/12/brave1.jpg", "Lipstick"));
    categories.add(CategoryA("https://i5.walmartimages.com/asr/b2efa6b2-8a2b-4f66-9ced-16bfc4673cc8.3841b4860002757967cbdac3797fb49a.jpeg", "Mascara"));
    categories.add(CategoryA("https://www.newbeauty.com/wp-content/uploads/2020/02/32710-OPI-1024x810.jpg", "Nail polish"));

    categoriesName.removeRange(0, categoriesName.length);
    for(int i = 0; i < categories.length; i++){
      if(!categoriesName.contains(categories[i].categoryName)){
        categoriesName.add(categories[i].categoryName);
      }
    }
    //print(categories);
    return categoriesName;
  }

  Future allProducts() async{

    const dominio = 'makeup-api.herokuapp.com';
    const percorsoFile = '/api/v1/products.json';
    Uri uri = Uri.https(dominio, percorsoFile);
    //print(uri);
    http.get(uri).then((result) {
      _result = result.body;
      //print(result.body);
      final productsMap = json.decode(result.body);
      products = productsMap.map<Prodotto>((var productMap) => Prodotto.fromJson(productMap)).toList();
      Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProducts(products: products),),);
    });
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // gli do un nome con as
import 'dart:convert';
import 'categoria.dart' as category;

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
  late List<Category> categories;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cosmetici", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple,),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: "Cerca cosmetico",
                hintText: "Inseriesci il nome di un cosmetico",
                errorText: _errorResearchText,
                border: const OutlineInputBorder(),
                prefixIcon: IconButton(
                    icon: new Icon(Icons.search),
                    onPressed: () { textSearchName();},
                ),
            ),
            controller: ctrResearch,
            onSubmitted: (value){textSearchName();}
          ),
          Visibility(visible: isResearchValid, child: Text(_result),),
          SingleChildScrollView(
            child: ListView.builder(
              itemBuilder: (context, index){
                return ListTile(
                  leading: ,
                )
              },
            )
          )
        ],
      )
    );
  }

  void textSearchName() {
    isResearchValid = true;

    setState(() {
      _errorResearchText = null;

      if(ctrResearch.text.isEmpty){
        isResearchValid = false;
        _errorResearchText = "Tipo del prodotto non valido";
        print("Prodotto non valido");
      }
      else{
        isResearchValid = true;
        findProduct();
      }
    });
  }


  Future findProduct() async{

    const dominio = 'makeup-api.herokuapp.com';
    const percorsoFile = '/api/v1/products.json';

    Map<String, dynamic> parametri = {'product_type': ctrResearch.text}; //dynamic perchè non so che variabile passo
    Uri uri = Uri.https(dominio, percorsoFile, parametri);
    print(uri);
    http.get(uri).then((result){
      setState(() {
        _result = result.body;
        if(_result == "[]"){
          isResearchValid = false;
          _errorResearchText = "Tipo del prodotto non valido";
        }
      });

      //setState(() {
        //final libriMap = json.decode(result.body);
        //final libriMapItems = libriMap['items'];
        //print(result.body);

        //libri = libriMapItems.map<Libro>((var libroMap) => Libro.fromMap(libroMap)).toList();});
    });
  }

  void populateCategory(){
    categories = [
      imageLink : "https://img.alicdn.com/imgextra/i1/6000000003078/O1CN01quuyrl1YbldlylkVM_!!6000000003078-0-tbvideo.jpg"

    ]
    }

  }

}

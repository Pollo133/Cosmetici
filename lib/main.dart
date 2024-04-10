import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // gli do un nome con as
import 'dart:convert';

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
  String? _errorNameText;
  TextEditingController ctrNome = TextEditingController();
  String _risultato = "";



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
                errorText: _errorNameText,
                border: const OutlineInputBorder(),
                prefixIcon: IconButton(
                    icon: new Icon(Icons.search),
                    onPressed: () { textSearchName();},
                ),
            ),
            controller: ctrNome,
            onSubmitted: (value){textSearchName();}
          ),
          Visibility(child: Text(""),
          )

        ],
      )
    );
  }

  void textSearchName() {
    findBook();
  }

  Future findBook() async{

    const dominio = 'makeup-api.herokuapp.com';
    const percorsoFile = '/api/v1/products.json';

    Map<String, dynamic> parametri = {'product_type': ctrNome.text}; //dynamic perchè non so che variabile passo
    Uri uri = Uri.https(dominio, percorsoFile, parametri);
    print(uri);
    http.get(uri).then((result){
      setState(() {
        Text(result.body);
      });

      //setState(() {
        //final libriMap = json.decode(result.body);
        //final libriMapItems = libriMap['items'];
        //print(result.body);

        //libri = libriMapItems.map<Libro>((var libroMap) => Libro.fromMap(libroMap)).toList();});
    });
  }
}

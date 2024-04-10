import 'package:flutter/material.dart';

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

        ],
      )
    );
  }

  void textSearchName() {
    print(" a");
  }
}

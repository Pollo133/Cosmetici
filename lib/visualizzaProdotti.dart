import 'package:cosmetici/prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'categoria.dart';
import 'main.dart';


class ShowProducts extends StatelessWidget{

  const ShowProducts({super.key, required this.products});
  final List<Prodotto> products;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cosmetici", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple,),
        body: Column(children: [


        ])
    );
  }
}


//button navigation bar flutter
//segmented button flutter

/*
Expanded(child: ListView.builder(
            itemCount: products.length,

            itemBuilder: (context, index){
              return ListTile(
                leading: Image.network(products[index].imageLink!), // Immagine
                title: Text(
                  products[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${products[index].id}'),
                    Text('Categoria: ${products[index].category}'),
                    Text(''),
                  ],
                ),
                trailing: Icon(Icons.add_circle),
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => xxx(libro: libri[index])));
                },
              );
            },
          ),

          )

 */
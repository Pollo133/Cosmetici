
import 'package:cosmetici/prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ShowDetails extends StatelessWidget{
  Prodotto product;
  ShowDetails({super.key, required this.product});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar : AppBar(title: Text(product.name, style: TextStyle(
            color: Colors.white)), backgroundColor: Colors.purple),
        body:
        Center(
            child:
            Column(
                children:[
                  SizedBox(height: 10),
                  Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Image.network(product.imageLink),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                          boxShadow:[ BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),)],),
                        child: Icon(CupertinoIcons.minus, size: 18),
                      ),
                      Container(margin: EdgeInsets.symmetric(horizontal:10 ),
                        child: Text("01", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold
                        ),),),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                          boxShadow:[ BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),)],),
                        child: Icon(CupertinoIcons.plus, size: 18),
                      ),

                    ],
                  ),


                  Padding(padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(product.description, textAlign: TextAlign.justify, style: TextStyle(fontSize: 17),),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        for(int i=0; i<product.colore.length; i++)
                          Text("Color: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                        SizedBox(width: 10,),
                        Row(children: [
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              //color: hexToColor(product.colore[i]),
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8
                                  )
                                ]
                            ),


                          ),

                        ],)
                      ],
                    ),)
                ])

        )
    );
  }
}
Color hexToColor(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

/*Future<void> launchUrl(buyLink) async {
  if (!await launch(buyLink)) {
    throw Exception('Could not launch $buyLink');
  }
}*/



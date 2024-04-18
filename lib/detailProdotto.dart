import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'prodotto.dart';


class ShowDetails extends StatelessWidget{
  Prodotto product;
  ShowDetails({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: Text(product.name, style: TextStyle(
          color: Colors.white)), backgroundColor: Colors.purple),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 8,),],),

              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Image.network(product.imageLink),),),

            SizedBox(height: 10),
            Padding(padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(product.description, textAlign: TextAlign.justify, style: TextStyle(fontSize: 17),),),
            Padding(padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text("Color: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      for (int i = 0; i < product.colori.length; i++)
                        Container(height: 30, width: 30,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: hexToColor(product.colori[i]),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 8,),],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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



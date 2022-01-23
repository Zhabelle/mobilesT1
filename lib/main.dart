import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffKey = GlobalKey<ScaffoldState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffKey,
        appBar: AppBar(
          title: Text('App ITESO'),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage("image.jpg"), fit: BoxFit.fill),
            //Image.network("https://www.iteso.mx/image/journal/article?img_id=1781803",),
            SizedBox(width: 10, height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(left: 10.0),child: 
                  Column(
                    children: [
                      Text("El ITESO, Universidad Jesuita de Guadalajara", style: TextStyle(fontWeight: FontWeight.w900),),
                      Text("San Pedro, Tlaquepaque, Jal", style: TextStyle(color: Colors.grey),),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ,),
                MyAppPage(),
              ],
            ),
            SizedBox(width: 10, height: 40,),
            ContactInfo(),
            SizedBox(width: 10, height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 30.0, right: 45.0),child: 
                  Text("El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metroppolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación, se presenta la historia de la institución en periodos de décadas."),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfo extends StatefulWidget{
  State<ContactInfo> createState()=> ContactState();
}

class ContactState extends State<ContactInfo>{
  var icons=[false,false,false];
  var textos=["Enviar correo","Hacer llamada","Ir a ITESO"];
  void _changeIcons(int i, BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textos[i], textAlign: TextAlign.center,),
        duration: const Duration(milliseconds: 1000),
        backgroundColor: Colors.indigo,
      ),
    );
    setState(() {
      icons[i] = !icons[i];
    });
  }

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
              onPressed:(){_changeIcons(0, context);},
              icon: Icon(Icons.mail, color: icons[0]?Colors.indigo:Colors.black,),
            ), Text("Correo"),],
        ),
        Column(
          children: [
            IconButton(
              onPressed:(){_changeIcons(1, context);},
              icon: Icon(Icons.phone, color: icons[1]?Colors.indigo:Colors.black,),
            ), Text("Teléfono"),],
        ),
        Column(
          children: [
            IconButton(
              onPressed:(){_changeIcons(2, context);},
              icon: Icon(Icons.directions, color: icons[2]?Colors.indigo:Colors.black,),
            ), Text("Ubicación"),],
        ),
      ],
    );
  }
}

class MyAppPage extends StatefulWidget{
  State<MyAppPage> createState()=>MyAppState();
}

class MyAppState extends State<MyAppPage>{
  int likes = 0;
  void _like(int x){
    setState((){
      likes += x;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              IconButton(
                onPressed:(){_like(1);},
                icon: Icon(Icons.thumb_up, color: Colors.indigo,),
              ),
              Text('$likes'),
              IconButton(
                onPressed:(){_like(-1);},
                icon: Icon(Icons.thumb_down, color: Colors.red,),
              ),
            ],
          ); 
  }
}

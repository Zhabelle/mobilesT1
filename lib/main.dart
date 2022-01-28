import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App ITESO',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _likes = 0;
  var textos=["Enviar correo","Hacer llamada","Ir a ITESO"];
  var icons=[false,false,false];

  void changeState(int i){
    icons[i]=!icons[i];
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
        content: Text(textos[i], textAlign: TextAlign.center,),
        duration: Duration(milliseconds: 600),
        backgroundColor: Colors.indigo,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Iteso'),
      ),
      body: Column(
        children:[
          Image.network("https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("El ITESO, Universidad Jesuita de Guadalajara", style: TextStyle(fontWeight: FontWeight.w900),),
                      Text("San Pedro, Tlaquepaque, Jal", style: TextStyle(color: Colors.grey),),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: (){setState((){});_likes++;}, icon: Icon(Icons.thumb_up, color: Colors.indigo,)),
                  Text("$_likes"),
                  IconButton(onPressed: (){setState((){});_likes--;}, icon: Icon(Icons.thumb_down, color: Colors.red,)),
                ],
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2,),
              Column(children: [
                  IconButton(onPressed: ()=>changeState(0), icon: Icon(Icons.mail,color: icons[0]?Colors.indigo:Colors.black,), iconSize: 48,),
                  Text("Correo")
                ],),
              Spacer(),
              Column(children: [
                  IconButton(onPressed: ()=>changeState(1), icon: Icon(Icons.phone,color: icons[1]?Colors.indigo:Colors.black,), iconSize: 48,),
                  Text("Llamada")
                ],),
              Spacer(),
              Column(children: [
                  IconButton(onPressed: ()=>changeState(2), icon: Icon(Icons.directions,color: icons[2]?Colors.indigo:Colors.black,), iconSize: 48,),
                  Text("Ruta")
                ],),
              Spacer(flex: 2,),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 45.0),
            child: Text("El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metroppolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación, se presenta la historia de la institución en periodos de décadas.")
          ),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}

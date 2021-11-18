import 'package:barnak_savasi/IkinciSayfa.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Finger Battle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<bool> geriDonusTusu(BuildContext context) async {
    return false;
  }

  var tfController1 = TextEditingController();
  var tfController2 = TextEditingController();

  String alinanVeri1 = "kırmızı";
  String alinanVeri2 = "mavi";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => geriDonusTusu(context),
      child: Scaffold(
        /*appBar: AppBar(
          title: Text(widget.title),
        ),*/
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF68998c),
                Color(0xFF701ebd),
                Color(0xFF873bcc),
                Color(0xFFfe4a97),
                Color(0xFFe17763),
              ],
              stops: [
                0.1,
                0.3,
                0.7,
                0.9,
                1,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Barnak", style: TextStyle(color: Colors.blue,fontSize: 65,fontWeight: FontWeight.normal, fontFamily: 'RoadRage'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Savaşı", style: TextStyle(color: Colors.red,fontSize: 65, fontWeight: FontWeight.normal, fontFamily: 'RoadRage'),),
                      ),
                    ],
                  ),
                  TextField(
                    controller: tfController1,
                    maxLength: 15,
                    style: TextStyle(
                        color: Colors.red
                    ),
                    decoration: InputDecoration(
                      hintText: "İsim Giriniz",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      label: Text("Kırmızı Oyuncu Adı", style: TextStyle(color: Colors.red, fontSize: 20),),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1.75),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.5),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      prefixIcon: Icon(Icons.account_circle_rounded, color: Colors.red,),
                    ),
                  ),

                  TextField(
                    controller: tfController2,
                    maxLength: 15,
                    style: TextStyle(
                        color: Colors.blue
                    ),
                    decoration: InputDecoration(
                      hintText: "İsim Giriniz",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      label: Text("Mavi Oyuncu Adı", style: TextStyle(color: Colors.blue, fontSize: 20),),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.75),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.5),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      prefixIcon: Icon(Icons.account_circle_rounded,color: Colors.blue,),
                    ),
                  ),

                  ElevatedButton(child: Text("Başla"), onPressed: (){

                    if(tfController1.text.isEmpty && tfController2.text.isEmpty){
                      Fluttertoast.showToast(
                        msg: "Lütfen Oyuncu Adları Giriniz!",
                        fontSize: 16,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                      );
                    }

                    if(tfController1.text.isEmpty && !tfController2.text.isEmpty){
                      Fluttertoast.showToast(
                        msg: "Kırmızı Oyuncu Adı Girmediniz!",
                        fontSize: 16,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                      );
                    }

                    if(tfController2.text.isEmpty && !tfController1.text.isEmpty){
                      Fluttertoast.showToast(
                        msg: "Mavi Oyuncu Adı Girmediniz!",
                        fontSize: 16,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.blue,
                      );
                    }

                    if(!tfController1.text.isEmpty && !tfController2.text.isEmpty){
                      alinanVeri1 = tfController1.text;
                      alinanVeri2 = tfController2.text;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => IkinciSayfa(kirmiziOyuncuAdi: alinanVeri1, maviOyuncuAdi: alinanVeri2,)));
                    }

                  },),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

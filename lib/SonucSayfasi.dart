import 'package:barnak_savasi/main.dart';
import 'package:flutter/material.dart';

class SonucSayfasi extends StatefulWidget {
  //const SonucSayfasi({Key? key}) : super(key: key);

  String kazananOyuncu;
  String kaybedenOyuncu;

  var kazananOyuncuRengi;
  var kaybedenOyuncuRengi;

  SonucSayfasi({required this.kazananOyuncu, required this.kaybedenOyuncu, required this.kazananOyuncuRengi, required this.kaybedenOyuncuRengi});

  @override
  _SonucSayfasiState createState() => _SonucSayfasiState();
}

class _SonucSayfasiState extends State<SonucSayfasi> {

  Future<bool> geriDonusTusu(BuildContext context) async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Kazanan : ${widget.kazananOyuncu}", style: TextStyle(fontSize: 35, color: widget.kazananOyuncuRengi),),
              Text("Kaybeden :  ${widget.kaybedenOyuncu}", style: TextStyle(fontSize: 35, color: widget.kaybedenOyuncuRengi),),
              ElevatedButton(child: Text("Tekrar Oyna"), onPressed: (){
                //Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
              },)
            ],
          ),
        ),
      ),
    );
  }
}

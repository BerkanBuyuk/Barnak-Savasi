import 'package:barnak_savasi/SonucSayfasi.dart';
import 'package:flutter/material.dart';

class IkinciSayfa extends StatefulWidget {
  //const IkinciSayfa({Key? key}) : super(key: key);

  String kirmiziOyuncuAdi;
  String maviOyuncuAdi;

  var kirmiziOyuncuRengi = Colors.red;
  var maviOyuncuRengi = Colors.blue;


  IkinciSayfa({required this.kirmiziOyuncuAdi, required this.maviOyuncuAdi});

  @override
  _IkinciSayfaState createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {

  Future<bool> geriDonusTusu(BuildContext context) async {
    return false;
  }

  double yukseklik1 = 390.0;
  double yukseklik2 = 390.0;


  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    var ekranYuksekligi1 = ekranBilgisi.padding;
    var ekranYuksekligi2 = ekranBilgisi.padding;


    return WillPopScope(
      onWillPop: () => geriDonusTusu(context),
      child: SingleChildScrollView(
        child: Column(
          children: [

            GestureDetector(
              onTap: (){
                setState(() {
                  yukseklik1 = yukseklik1 + 15;
                  yukseklik2 = yukseklik2 - 15;
                  if(yukseklik1 == 780){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SonucSayfasi(
                      kazananOyuncu: widget.kirmiziOyuncuAdi, kaybedenOyuncu: widget.maviOyuncuAdi,
                      kazananOyuncuRengi: widget.kirmiziOyuncuRengi, kaybedenOyuncuRengi: widget.maviOyuncuRengi,
                    )));
                  }
                });
              },
              child: SizedBox(
                height: yukseklik1,
                width: ekranGenisligi,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.kirmiziOyuncuRengi,
                  ),
                  child: Center(child: Text(widget.kirmiziOyuncuAdi, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                setState(() {
                  yukseklik2 = yukseklik2 + 15;
                  yukseklik1 = yukseklik1 - 15;
                  if(yukseklik2 == 780){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SonucSayfasi(
                      kazananOyuncu: widget.maviOyuncuAdi, kaybedenOyuncu: widget.kirmiziOyuncuAdi,
                      kazananOyuncuRengi: widget.maviOyuncuRengi, kaybedenOyuncuRengi: widget.kirmiziOyuncuRengi,
                    )));
                  }
                });
              },
              child: SizedBox(
                height: yukseklik2,
                width: ekranGenisligi,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.maviOyuncuRengi,
                  ),
                  child: Center(child: Text(widget.maviOyuncuAdi, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

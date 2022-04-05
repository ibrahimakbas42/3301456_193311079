import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Foto extends StatefulWidget {
  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Gezilecek Yerler', style: TextStyle(color: Colors.black)),
      ),
      body: Fotograflar(),
    );
    // );
  }
}

class Fotograflar extends StatefulWidget {
  const Fotograflar({Key? key}) : super(key: key);

  @override
  _FotograflarState createState() => _FotograflarState();
}

class _FotograflarState extends State<Fotograflar> {
  int fotoNo = 1;
  int fotooNo = 2;
  int fotoooNo = 3;

  List<String> fotoAdlari = [
    'Nemrut Dağı - Adıyaman',
    'Amasra Kasabası - Bartın',
    'Amasya Evleri - Amasya',
    'Şirince Kasabası - İzmir',
    'Gökçeada - Çanakkale'
  ];

  List<String> fotooAdlari = [
    'Yedigöller - Bolu',
    'Alaçatı - İzmir',
    'Ölüdeniz - Muğla',
    'Saklıkent - Antalya',
    'Adalar - İstanbul'
  ];

  List<String> fotoooAdlari = [
    'Sille - Konya',
    'Kapadokya - Nevşehir',
    'Harran - Şanlıurfa',
    'Pamukkale - Denizli',
    'Aspendos - Antalya'
  ];

  void fotolariYenile() {
    setState(() {
      fotooNo = Random().nextInt(5) + 1;
      fotoNo = Random().nextInt(5) + 1;
      fotoooNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                  //color: Colors.red,
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: fotolariYenile,
                  child: Image.asset('assets/foto/foto_$fotoNo.jpg')),
            ),
          ),
          Text(
            fotoAdlari[fotoNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                  //color: Colors.red,
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: fotolariYenile,
                  child: Image.asset('assets/foto/fotoo_$fotooNo.jpg')),
            ),
          ),
          Text(
            fotooAdlari[fotooNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                //color: Colors.red,
                highlightColor: Colors.white,
                splashColor: Colors.white,
                onPressed: fotolariYenile,

                child: Image.asset('assets/foto/fotooo_$fotoooNo.jpg'),
              ),
            ),
          ),
          Text(
            fotoooAdlari[fotoooNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/hakkinda');
              },
              child: Text('Önceki Sayfaya Dön'),
            ),
          ),
        ],
      ),
    );
  }
}

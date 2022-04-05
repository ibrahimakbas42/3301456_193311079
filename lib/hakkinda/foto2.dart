import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Foto2 extends StatefulWidget {
  @override
  _Foto2State createState() => _Foto2State();
}

class _Foto2State extends State<Foto2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Dünyada Gezilebilecek Yerler',
            style: TextStyle(color: Colors.black)),
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
  int foto2No = 1;
  int fotoo2No = 2;
  int fotooo2No = 3;

  List<String> foto2Adlari = [
    'Arashiyama Bambu Korusu  - Japonya',
    'Banff Ulusal Parkı - Kanada',
    'Büyük Kanyon - ABD',
    'Cinque Terre - İtalya',
    'Giza - Mısır'
  ];

  List<String> fotoo2Adlari = [
    'Kilimanjaro Dağı - Tanzanya',
    'Krabi - Tayland',
    'Macha Picchu - Peru',
    'Mavi Lagün - İzlanda',
    'Moher Kayalıkları - İrlanda'
  ];

  List<String> fotooo2Adlari = [
    'Reynisfjara - İzlanda',
    'Salar de Uyuni - Bolivya',
    'Santorini - Yunanistan',
    'Skye Adası - İskoçya',
    'Uluru - Avustralya'
  ];

  void fotolariYenile() {
    setState(() {
      fotoo2No = Random().nextInt(5) + 1;
      foto2No = Random().nextInt(5) + 1;
      fotooo2No = Random().nextInt(5) + 1;
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
                  child: Image.asset('assets/foto/foto2_$foto2No.jpg')),
            ),
          ),
          Text(
            foto2Adlari[foto2No - 1],
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
                  child: Image.asset('assets/foto/fotoo2_$fotoo2No.jpg')),
            ),
          ),
          Text(
            fotoo2Adlari[fotoo2No - 1],
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

                child: Image.asset('assets/foto/fotooo2_$fotooo2No.jpg'),
              ),
            ),
          ),
          Text(
            fotooo2Adlari[fotooo2No - 1],
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

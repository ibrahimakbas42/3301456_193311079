import 'dart:async';
import 'package:e_sinav/sorular/bitir.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sorular extends StatefulWidget {
  @override
  _SorularState createState() => _SorularState();
}

String zamaniFormatla(int milisaniye) {
  var saniye = milisaniye ~/ 1000; // ~/ Tam sayı bölme işlemidir
  var dakika = ((saniye % 3600) ~/ 60).toString().padLeft(2, '0');
  var saniyeler = (saniye % 60).toString().padLeft(2, '0');

  return "$dakika:$saniyeler";
}

class _SorularState extends State<Sorular> {
  String adSoyad = '';
  String ogrNo = '';

  int mevcutsoru = 0;
  String mevcutcevap = '';
  int puan = 0;
  int kullanilansure = 0;

  late Stopwatch _sayac;
  late Timer _timer;

  get values => null;

  @override
  void initState() {
    super.initState();
    _sayac = Stopwatch();
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {});
    });
    mevcutsoru = 0;
    mevcutcevap = '';
    puan = 0;
    kullanilansure = 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void BitireYolla() {
    var data = [];
    data.add(adSoyad);
    data.add(ogrNo);
    data.add(puan.toString());
    data.add(zamaniFormatla(kullanilansure));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bitir(),
          settings: RouteSettings(
            arguments: data,
          ),
        ));
  }

  var sorular = [
    {
      'soru': "'Sinekli Bakkal' Romanının Yazarı Aşağıdakilerden Hangisidir?",
      'cevaplar': [
        'Reşat Nuri Güntekin',
        'Halide Edip Adıvar',
        'Ziya Gökalp ',
        'Ömer Seyfettin'
      ],
      'dogrucevap': 'Halide Edip Adıvar'
    },
    {
      'soru':
          'Aşağıda Verilen İlk Çağ Uygarlıklarından Hangisi Yazıyı İcat Etmiştir?',
      'cevaplar': ['Hititler ', 'Elamlar ', 'Sümerler ', 'Urartular'],
      'dogrucevap': 'Sümerler'
    },
    {
      'soru':
          'Tsunami Felaketinde En Fazla Zarar Gören Güney Asya Ülkesi Aşağıdakilerden Hangisidir?',
      'cevaplar': ['Endonezya ', 'Srilanka ', 'Tayland ', 'Hindistan'],
      'dogrucevap': 'Endonezya'
    },
    {
      'soru':
          "2003 Yılında Euro Vizyon Şarkı Yarışmasında Ülkemizi Temsil Eden ve Yarışmada Birinci Gelen Sanatçımız Kimdir?",
      'cevaplar': [
        'Grup Athena',
        'Sertap Erener',
        'Şebnem Paker',
        'Ajda Pekkan'
      ],
      'dogrucevap': 'Sertap Erener'
    },
    {
      'soru': 'Mustafa Kemal Atatürk’ün Nüfusa Kayıtlı Olduğu İl Hangisidir?',
      'cevaplar': ['Bursa ', 'Ankara', 'İstanbul', 'Gaziantep'],
      'dogrucevap': 'Gaziantep'
    },
    {
      'soru':
          'Aşağıdakilerden Hangisi Dünya Sağlık Örgütünün Kısaltılmış İsmidir?',
      'cevaplar': ['Uhw', 'Unicef', 'Who', 'Nato'],
      'dogrucevap': 'Who'
    },
    {
      'soru': "Romen Rakamında Hangi Sayı Yoktur?",
      'cevaplar': ['0', '50', '100', '1000'],
      'dogrucevap': '0'
    },
    {
      'soru': "Bir Gün Kaç Saniyedir?",
      'cevaplar': ['86000', '88600', '86400', '84800'],
      'dogrucevap': '86400'
    },
    {
      'soru': "Üç Büyük Dince Kutsal Sayılan Şehir Hangisidir?",
      'cevaplar': ['Mekke', 'Kudüs', 'Roma', 'İstanbul'],
      'dogrucevap': 'Kudüs'
    },
    {
      'soru': 'Hangi İlimizde Demiryolu Yoktur?',
      'cevaplar': ['Batman', 'Kütahya', 'Aydın', 'Muğla'],
      'dogrucevap': 'Muğla'
    },
  ];

  void kontrolEt() {
    if (mevcutsoru > 8) {
      mevcutsoru = 0;
      _timer.cancel();
      BitireYolla();
    } else {
      if (mevcutcevap == sorular[mevcutsoru]['dogrucevap']) {
        puan = puan + 10;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      } else {
        puan = puan - 10;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Object? data = [];
    // var data = [];
    data = ModalRoute.of(context)!.settings.arguments;
    // adSoyad = data[0];
    // ogrNo = data[1];
    adSoyad = ['adSoyad'] as String;
    ogrNo = ['ogrNo'] as String;

    _sayac.start();
    if (_sayac.elapsedMilliseconds > 9999 && mevcutsoru < 9) {
      kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
      _sayac.reset(); // 10 saniyede cevap verilmezse diğer soruya geçiyor
      mevcutsoru++;
    }

    if (mevcutsoru == 9 && _sayac.elapsedMilliseconds > 9999) {
      Future.delayed(Duration.zero, () async {
        _sayac.reset(); // Sıfırlama
        _sayac.stop(); // Bitiş ekranına geldik artık
        _timer.cancel(); // Yeni ekrana geçtiğinde saymayı bitirsin
        mevcutsoru = 0;
        BitireYolla();
      });
    }

    List cevaplistesi = [];
    if (sorular != null) {
      for (var u in sorular /*[mevcutsoru]['cevaplar']*/) {
        // Cevaplistesi cevaplistesi = Cevaplistesi(
        // sorular[mevcutsoru];
        // sorular('cevaplar');
        cevaplistesi.add(u);
      }
    }
    //[mevcutsoru]['cevaplar']
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bil Bakalım',
              style:
                  GoogleFonts.pacifico(fontSize: 25.0, color: Colors.cyan[400]),
            ),
            Text('Ad-Soyad: ' + adSoyad, style: TextStyle(fontSize: 15.0)),
            Text('Öğrenci No: ' + ogrNo, style: TextStyle(fontSize: 15.0)),
            Text(
              'Mevcut Soru /Toplam Soru: ' +
                  mevcutsoru.toString() +
                  ' / ' +
                  sorular.length.toString(),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Puan: ' + puan.toString(),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              sorular[mevcutsoru]['soru'].toString(),
              style: TextStyle(fontSize: 19),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevaplistesi[0].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevaplistesi[0],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevaplistesi[1].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevaplistesi[1],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevaplistesi[2].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevaplistesi[2],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevaplistesi[3].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevaplistesi[3],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Text(zamaniFormatla(_sayac.elapsedMilliseconds),
                style: TextStyle(fontSize: 22.0)),
            Text('Kullanılan Süre: ' + zamaniFormatla(kullanilansure),
                style: TextStyle(fontSize: 22.0)),
            // SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Anasayfaya Dön'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

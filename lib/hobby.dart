import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:whoo/utils.dart';




List<String> sporHobbyList = ["Atletizm","Avcılık Ve Atıcılık","Badminton","Basketbol","Bilardo","Binicilik","Bisiklet","Bowling","Bocce","Dart","Box","Kick Box","Briç","Buz Hokeyi","Buz Pateni","Cimnastik",
  "Dağcılık","Eskrim","Futbol","Golf","Güreş","Halk Oyunları","Halter","Hentbol","Hokey","İzcilik","Judo","Kano","Karate","Kayak","Kürek","Modern Pentatlon","Muay Thai","Okçuluk","Oryantiring","Ragbi",
  "Satranç","Su Altı Sporları","Su Topu","Taekwon-do","Tenis","Triatlon","Voleybol","Vücut Geliştirme","Wushu","Yelken","Yüzme","Atlı Okçuluk"];

List<String> acikHavaVeDogaHobbyList = ["Amatör meteorolojik gözlemciliği", "Bulut izleme", "Geocaching", "Kuş gözlemciliği", "Fotoğrafçılık", "Stargazing", "Herping", "Jimnastik", "Sörf yapmak", "Yürüyüş",
  "Ayağına ip bağlayıp atlamak","Tüplü dalış", "Nehir raftingi", "Kayak yapma", "Buz pateni", "Yarış", "Avcılık", "Kuş besleyicileri / Kuş evleri yapma",  "Peyzaj bahçeciliği",  "Organik tarım", "Geri dönüşüm",
  "Hayvan bakımı",  "Geri dönüştürülmüş kağıt yapımı",  "Kullanılmış malzemelerden sanat yaratmak", "Kart yarışı",  "Kamp yapmak", "Balık tutma",  "Seyahat", "Kano",  "Kaykay yapmak",];

List<String> koleksyonculukHobbyList = [
  "Kuş tüyleri toplama", "Sikke toplama","Kelebek toplama", "Fosil ve kayaların toplanması", "Deniz kabuklarını toplama",  "Pul koleksiyonu yapma", "Kurutulmuş çiçeklerin toplanması",  "Çizgi roman toplama",
  "Tanıştığın kişilerin fotoğraflarını toplama",  "Ziyaret / tebrik kartı toplama", "Posta pulu toplama", "Piedras Pintades a Mano Koleksiyonculuğu", "Kartpostal koleksiyonculuğu", "Peçete koleksiyonculuğu",
  "DVD veya CD koleksiyonculuğu", "Kitap koleksiyonculuğu", "Kitap ayracı koleksiyonculuğu", "Oyun koleksiyonculuğu","Post-it koleksiyonculuğu", "Kalem koleksiyonculuğu","Silgi koleksiyonculuğu",
  "Oyuncak araba koleksiyonculuğu", "Çanta koleksiyonculuğu", "Taso koleksiyonculuğu", "Kapak koleksiyonculuğu", "Madeni ya da kağıt para koleksiyonculuğu","Deniz kabuğu koleksiyonculuğu"];

List<String> onlineHobbyList = ["Haber, Dergi veya Makale Okumak","Forumlarda, Sözlüklerde Takılmak","e-Spor Oyunları Oynamak","Blog Açmak","Web Sitesi Kurmak","Bir Şeyler Satmak","Kodlama Öğrenmek",
  "Dizi – Film İzlemek","Youtube’da Takılmak", "Freelance İş Yapmak","Sosyal Medyada Gezinmek"];

List<String> socialHobbyList = ["Fotoğrafçılık",  "Resim",  "Müzik",  "Dans",  "Oyunculuk",  "El Sanatları",  "Geleneksel Oyunlar ve Zeka Oyunları", "Seramik ve Cam Sanatları",  "Ebru Sanatı",
  "Dokuma ve Nakış",  "Heykel", "Ahşap Oymacılığı ve Boyama", "Minyatür ve Hat",  "Takı Yapımı",  "Kukla Yapımı",  "Çini Yapımı",  "Origami",  "Sinema ve Tiyatro Etkinlikleri", "Konserler",  "Festivaller",
  "Alışveriş Merkezleri Gezme", "Doğa Sporları",  "Kamp Yapmak",  "Arkadaş Kutlamaları",  "Dans Geceleri",  "Kültürel Zenginlikleri Ziyaret Etmek", "Sosyal Sorumluluk Projelerine Katılmak", "Mandala",
  "Hayvansever Topluluklara Katılım", "İşaret Dili", "Yemek Yapmak",];






int itemCount = sporHobbyList.length;

String str;

class HobbieLists extends StatefulWidget {
  String choosenOne;
  HobbieLists(String s){
    choosenOne = s;
    str = s;
  }

  @override
  _HobbieListsState createState() => _HobbieListsState();
}

String strPicker(String val){
  switch(val){
    case "spor":
      return "sp";
      break;
    case "acikhava":
      return "ac";
      break;
    case "koleksyon":
      return "ko";
      break;
    case "online":
      return "on";
      break;
    case "sosyal":
      return "so";
      break;
  }
}

int valPicker(String val){
  switch(val){
    case "spor":
      return sporHobbyList.length;
      break;
    case "acikhava":
      return acikHavaVeDogaHobbyList.length;
      break;
    case "koleksyon":
      return koleksyonculukHobbyList.length;
      break;
    case "online":
      return onlineHobbyList.length;
      break;
    case "sosyal":
      return socialHobbyList.length;
      break;
  }
}

List<String> listPicker(){
  switch(str){
    case "spor":
      return sporHobbyList;
      break;
    case "acikhava":
      return acikHavaVeDogaHobbyList;
      break;
    case "koleksyon":
      return koleksyonculukHobbyList;
      break;
    case "online":
      return onlineHobbyList;
      break;
    case "sosyal":
      return socialHobbyList;
      break;
  }
}

class _HobbieListsState extends State<HobbieLists> {
  @override
  Widget build(BuildContext context) {
    List<String> myList = listPicker();
    List<String> selectedhobbies = new List<String>();// = [""];
    int itemCount = valPicker(str);
    //itemCount = sporHobbyList.length;
    return Scaffold(
      //backgroundColor: Colors.red,
      appBar: AppBar(title: const Text('Selection Part')),
      body: itemCount > 0
          ? ListView.builder(
            itemCount: (itemCount/3).floor(),
            itemBuilder: (BuildContext context, int index) {
            return Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                      ),
                      onPressed: () {

                        selectedhobbies.add('${strPicker(str) + index.toString() + ","}');

                        print('${myList[index]}');
                      },
                      child: Text('${myList[index]}'),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ),
                      onPressed: () {
                        selectedhobbies.add('${strPicker(str) + (index + (itemCount/3).floor()).toString() + ","}');
                        print('${myList[index + (itemCount/3).floor()]}');
                      },
                      child: Text('${myList[index + (itemCount/3).floor()]}'),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        //padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(20, 20, 20, 20)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                      ),
                      onPressed: () {
                        selectedhobbies.add('${strPicker(str) + (index+ (itemCount/3).floor() + (itemCount/3).floor()).toString() + ","}');
                        print('${myList[index+ (itemCount/3).floor() + (itemCount/3).floor()]}');

                      },
                      child: Text('${myList[index + (itemCount/3).floor() + (itemCount/3).floor()]}'),
                    ),
                  ),
                ],
            );
        },
      )
          : const Center(child: Text('No items')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          print(selectedhobbies);

          _dbNonAsync(selectedhobbies,context);


        },
        child: Text("Onay"),
        backgroundColor: Colors.green,
      ),
    );
  }
}




Future _dbNonAsync(myList, BuildContext context) async{
  final conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '165.22.75.147',
        port: 3306,
        user: 'admin_strategy',
        db: 'admin_strategy',
        password: 'web123'
      )
  );


  var concat = StringBuffer();

  for(int i = 0; i < myList.length; i++){
    concat.write(myList[i]);
  }
  String a = "anyid";

  await conn.query("call favs_whoo_procedure('${concat.toString()}','$a')");


  await conn.close();
    /*Navigator.push(
        context,
        MaterialPageRoute(
          //builder: (context) => RandomChatPage()));
            builder: (context) => HobbieSelection()));*/
}

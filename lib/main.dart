import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class birthdayPerson {
  static String birthdayPersonName;
  static String currentBirthdayPhoto = 'assets/default.jpg';
  static var numberOfBirthdayPhotos;
  static String birthdayMessage;
  static DateTime birthdayDate;
  static String birthdayMusic;
  static String backgroundImage;

  static String loadImages(counter) {
    currentBirthdayPhoto = 'assets/$counter.jpg';
  }
}

void main() {
  //To personalize the app just change the data of birthdayPerson object.

  birthdayPerson.birthdayPersonName = 'Mamãe';
  birthdayPerson.birthdayMessage =
      'Muitos anos de vida, muita saúde e muita paz!';
  birthdayPerson.birthdayDate = DateTime.parse('2020-23-03');
  birthdayPerson.numberOfBirthdayPhotos = 10;
  birthdayPerson.birthdayMusic = 'assets/sound.mp3';
  birthdayPerson.backgroundImage = 'assets/background.gif';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AssetsAudioPlayer.newPlayer().open(
      Audio(birthdayPerson.birthdayMusic),
      autoStart: true,
      showNotification: false,
      loopMode: LoopMode.single,
    );

    return MaterialApp(
      title: 'Feliz Aniversário!',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          title: "Feliz Aniversário, ${birthdayPerson.birthdayPersonName}!"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 1;

  void _incrementCounter() {
    setState(() {
      if (counter <= birthdayPerson.numberOfBirthdayPhotos) {
        birthdayPerson.loadImages(counter);
        print(birthdayPerson.currentBirthdayPhoto);
        counter++;
      } else {
        print('Out of Bonds');
        counter = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String birthdayPersonPhotos = 'assets/1.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('${birthdayPerson.backgroundImage}'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              birthdayPerson.birthdayMessage,
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Image(
              image: AssetImage('${birthdayPerson.currentBirthdayPhoto}'),
              height: 450,
              width: 350,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

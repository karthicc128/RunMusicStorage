import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AudioPlayer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Audio Player'),
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

  AudioPlayer audioPlayer;
  AudioPlayer player;
  @override
  Color play=Colors.green;
  Color stop=Colors.red;
  Color resume=Colors.yellow;
  Color pause=Colors.blueAccent;
  List songs=[1,2,3,4,5,6,7,8,9];

  var link="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
  int _value=1;


  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void playaudio(int n) async {
    try {
      link="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-$n.mp3";
      player.play(link);

    }
    catch (e){
      print("sorry");
    }

  }
  playAudioFromLocalStorage(path) async {
    int response = await audioPlayer.play(path, isLocal: true);
    if (response == 1) {
      // success

    } else {
      print('Some error occured in playing from storage!');
    }
  }
  pauseAudio() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
      // success

    } else {
      print('Some error occured in pausing');
    }
  }
  stopAudio() async {
    int response = await audioPlayer.stop();
    if (response == 1) {
      // success

    } else {
      print('Some error occured in stopping');
    }
  }
  resumeAudio() async {
    int response = await audioPlayer.resume();
    if (response == 1) {
      // success

    } else {
      print('Some error occured in resuming');
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RUN MUSIC FINAL'),
      ),
      body:Center(
        child: Column(children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: play,
            ),
            child: Text("play"),
            onPressed: (){

            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: pause,
            ),
            child: Text("pause "),
            onPressed: (){
             pauseAudio();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: resume,
            ),
            child: Text("resume"),
            onPressed: (){
              resumeAudio();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: stop,
            ),
            child: Text("stop"),
            onPressed: (){
             stopAudio();
            },
          ),
          RaisedButton(

            child: Text("load file",style:TextStyle(color: Colors.green),),
            onPressed: () async {
              var path =
              await FilePicker.getFilePath(type: FileType.audio);

              playAudioFromLocalStorage(path);
            },
          ),
          Container(
            child: DropdownButton(
              value: 1,
              items: [
                DropdownMenuItem(child: Text("song1"),value: 1,),
                DropdownMenuItem(child: Text("song2"),value: 2,),
                DropdownMenuItem(child: Text("song3"),value: 3,),
                DropdownMenuItem(child: Text("song4"),value: 4,),
                DropdownMenuItem(child: Text("song5"),value: 5,),
                DropdownMenuItem(child: Text("song6"),value: 6,),
              ],
              onChanged: (value){
                setState(() {
                  _value=value;
                });


              },
            ),
          ),


        ]),
      )
    );

  }
}
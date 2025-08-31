import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textController = TextEditingController();

  double _pitch = 1.0;
  double _rate = 0.5;

  Future _speak() async{          //start the speaking when this function will be called.
    if(textController.text.isNotEmpty){
      await flutterTts.setLanguage("en-IN");   //sets the languaue
      await flutterTts.setPitch(_pitch);         //sets pitch
      await flutterTts.setSpeechRate(_rate);    //sets rate
      await flutterTts.speak(textController.text);    //pass the text provided by the user to the flutterTts.speak
    }
  }
  
  Future _stop() async{  //stop speaking when it will be called.
    await flutterTts.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Text To Speech', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
        backgroundColor: Colors.lightBlue[400],
      ),

      body: Center(
        child: Container(         //main container that contans every widgets
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width/1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 5,
                spreadRadius: 4,
                offset: Offset(2, 2),
              )
            ],
            border: Border.all(
              color: Colors.grey[400]!,
              width: 3,
          ),

          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(            //container for textField
                  decoration: BoxDecoration(      //decoration for Container of textField
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        spreadRadius: 4,
                        blurRadius: 2,
                      )
                    ]
                  ),
                  child: TextField(    //textField to take input text from the user
                    controller: textController,
                    minLines: 1,
                    maxLines: 10,    //textField will expand till the 10th line.
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: "Type Here",
                      hintText: "Type Something...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),   //space between button and textField

                //Slider..
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(         //padding for Pitch
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Pitch", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                    ),
                    Slider(              //pitch Slider
                        value: _pitch,
                        min: 0.5,
                        max: 2.0,
                        divisions: 15,
                        label: _pitch.toStringAsFixed(1),
                        onChanged: (value){
                          setState(() {
                            _pitch=value;
                          });
                        }
                    ),
                    
                    Padding(      //padding for rate
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Rate", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                    ),
                    Slider(       //rate slider
                        value: _rate,
                        min: 0.1,
                        max: 1.0,
                        divisions: 10,
                        label: _rate.toStringAsFixed(1),
                        onChanged: (value){
                          setState(() {
                            _rate = value;
                          });
                        }
                    )
                  ],
                ),

                //buttons..
                Row(       //Row for buttons
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(         //elevated button for speak
                        onPressed: _speak,
                        icon: Icon(Icons.play_arrow),    //set the play icon.
                        label: Text("Speak", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent
                        ),
                    ),

                    ElevatedButton.icon(        //second icon button to stop.
                        onPressed: _stop,      //calling the stop function when button will be pressed.
                        icon: Icon(Icons.stop),
                        label: Text("Stop", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20))
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

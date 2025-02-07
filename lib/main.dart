import 'dart:ffi';

import 'package:flutter/material.dart';
import 'question.dart';
import 'app_brain.dart';

void main() {
  runApp(const oktibar());
}

class oktibar extends StatelessWidget {
  const oktibar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 218, 231, 225),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 88, 134, 112),
            title: Text('ikhtibar '),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Exampage(),
          )),
    );
  }
}

class Exampage extends StatefulWidget {
  const Exampage({super.key});
  
  @override
  State<Exampage> createState() => _ExampageState();
}

class _ExampageState extends State<Exampage> {
  List anserresualts=[];
  //List<String> question=['yasou','ashe','smolder','aphelios','veigo','garen','teemo','khazix','ambress'];
  //List<bool> ansers=[true,true,true,false,false,true,false,true,false] ;
  int i=0;
  int j=1;
  Appbrain appbrain =Appbrain();
void condition(){
  if(i==appbrain.questiongroupe.length){
                i=0;
                j=1;
              }
}
  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Row( children:[ ...anserresualts,]
            
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/$j.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                appbrain.questiongroupe[i].questiontext,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            style: TextButton.styleFrom(
               backgroundColor: Colors.green,
              foregroundColor: Colors.black
            ),
            onPressed: () {
              bool youranser=appbrain.questiongroupe[i].anser;
              if(youranser==true){
                setState(() {
                
                anserresualts.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.thumb_up,
                            color: Colors.green,),
                ),);
          
              }
              );
                
              }else{
                setState(() {
                
                anserresualts.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.thumb_up,
                            color: const Color.fromARGB(255, 231, 14, 7),),
                ),);
              }
              );
              } 
              i++;
              j++;
              condition();
            },
            child: Text('yes',
            style: TextStyle(fontSize: 30),),
          ),
        ),
        SizedBox(height: 40,),
        Expanded(
          flex: 1,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.black
            ),
            onPressed: () {
              bool youranser=appbrain.questiongroupe[i].anser;
              if(youranser==false){
                setState(() {
                anserresualts.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.thumb_down,
                            color: const Color.fromARGB(255, 5, 196, 53),),
                ),);
              });
              }else{
                setState(() {
                anserresualts.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.thumb_down,
                            color: Colors.red,),
                ),);
              });
              }
              
              i++; 
              j++;
              condition();
            },
            child: Text('No',
            style: TextStyle(fontSize: 30),),
          ),
        )
      ],
    );
  }
}


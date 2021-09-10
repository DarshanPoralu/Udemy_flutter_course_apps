import 'package:flutter/material.dart';
import 'story_brain.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();


class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  TextButton button(int choice, Color color){
    return TextButton(
      onPressed: () {
        setState(() {
          storyBrain.nextStory(choice);
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        storyBrain.getChoice(choice),
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('images/background.png'),
             fit: BoxFit.cover,
           ),
         ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: button(1, Colors.red),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.isVisible(),
                  child: button(2, Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



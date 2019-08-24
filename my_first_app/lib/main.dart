import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: new HomePage());
  }
}
class HomePage extends StatefulWidget
{
  @override
  State createState() => new MyHomePageState();
}
class MyHomePageState extends State<HomePage> with TickerProviderStateMixin
{
  AnimationController _controller;
  static const List<IconData> icons = const [Icons.sms, Icons.mail,Icons.phone];
  @override
  void initState()
  {
    _controller = new AnimationController(vsync: this,
                                          duration: const Duration(milliseconds: 500));
  }
  Widget build(BuildContext context)
  {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    return new Scaffold(appBar: new AppBar(title: new Text('Speed Dialer')),
                        floatingActionButton: new Column(mainAxisSize: MainAxisSize.min,
                                                        children: new List.generate(icons.length, (int index)
                                                        {
                                                          Widget child = new Container(height: 70,
                                                                                      width: 56,
                                                                                      alignment: FractionalOffset.topCenter,
                                                                                      child: new ScaleTransition(scale: new CurvedAnimation(parent: _controller,
                                                                                                                                            curve: new Interval(0.0,
                                                                                                                                                                1.0-index/icons.length/2.0,
                                                                                                                                                                curve: Curves.easeOut)),
                                                                                                                child: new FloatingActionButton(heroTag: null,
                                                                                                                                                backgroundColor: backgroundColor,
                                                                                                                                                mini: true,
                                                                                                                                                child: new Icon(icons[index],
                                                                                                                                                                color: foregroundColor),
                                                                                                                                                onPressed: (){})));
                                                          return child;
                                                        }).toList()..add(new FloatingActionButton(heroTag: null,
                                                                                                  child: new AnimatedBuilder(animation: _controller,
                                                                                                                             builder: (BuildContext context, Widget child)
                                                                                                                                {
                                                                                                                                  return new Transform(transform: new Matrix4.rotationZ(_controller.value * 0.5 * 3.14),
                                                                                                                                                       alignment: FractionalOffset.center,
                                                                                                                                                       child: new Icon(_controller.isDismissed ? Icons.add : Icons.close),
                                                                                                                                                       );
                                                                                                                                },
                                                                                                                              ),
                                                                                                  onPressed: ()
                                                                                                  {
                                                                                                      if (_controller.isDismissed)
                                                                                                  {
                                                                                                  _controller.forward();
                                                                                                  }
                                                                                                      else
                                                                                                  {
                                                                                                  _controller.reverse();
                                                                                                  }
                                                                                                  }

                                                                                                  ),
                                                        ),
                        ),
    );
  }

}

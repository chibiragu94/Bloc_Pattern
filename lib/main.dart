import 'package:bloc_pattern_sample/page_four.dart';
import 'package:bloc_pattern_sample/page_one.dart';
import 'package:bloc_pattern_sample/page_three.dart';
import 'package:bloc_pattern_sample/page_two.dart';
import 'package:bloc_pattern_sample/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/NewMessageBloc.dart';


// To avoid null on custom bloc
Future<void> main() async {
  return runApp(
      BlocProvider(
        create: (context) => NewMessageBloc(),
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Bloc Pattern'),
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


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          RaisedButton(onPressed: ()=>{
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return BlocProvider.value(
                value: BlocProvider.of<NewMessageBloc>(context),
                child: SecondPage());
          }))
          },
          child: Text('Next'),)
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 1,child: Row(
              children: [
                Expanded(flex : 1,
                    child: PageOne()),
                Expanded(flex : 1,
                    child: PageTwo())
              ],
            )),
            Expanded(flex: 1,child: Row(
              children: [
                Expanded(flex : 1,
                    child: PageThree()),
                Expanded(flex : 1,
                    child: PageFour()),
              ],
            ))
          ],
        )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

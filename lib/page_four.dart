
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'message_bloc.dart';

class PageFour extends StatefulWidget
{
  final MessageBloc messageBloc;

  PageFour(this.messageBloc);

     @override
    _MyPageFourState createState() => _MyPageFourState();
}

class _MyPageFourState extends State<PageFour> {
  @override
  void dispose() {
    widget.messageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<MessageBloc>(
      bloc: widget.messageBloc,
      child: Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: widget.messageBloc.valueStream,
              initialData: "inital data",
              builder: (context, snapshot) {

                if(null != snapshot.data)
                  return Text(snapshot.data);

                if(snapshot.hasError)
                  return Text('Error');

                return Text('wait');
              },
            ),
            RaisedButton(onPressed: () => {
              widget.messageBloc.valueSink.add("Four")
            },
              child: Text('4'),)
          ],
        ),
      ),
    );
  }

}
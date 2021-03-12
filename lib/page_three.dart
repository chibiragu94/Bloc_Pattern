
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'message_bloc.dart';

class PageThree extends StatefulWidget
{
  final MessageBloc messageBloc;

  PageThree(this.messageBloc);

    @override
    _MyPageThreeState createState() => _MyPageThreeState();
}

class _MyPageThreeState extends State<PageThree> {

  @override
  void dispose() {
    widget.messageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<MessageBloc>(
      bloc: widget.messageBloc,
      child: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: widget.messageBloc.valueStream,
              initialData: "inital_data on page one",
              builder: (context, snapshot) {

                if(null != snapshot.data)
                  return Text(snapshot.data);

                if(snapshot.hasError)
                  return Text('Error');

                return Text('wait');
              },
            ),
            RaisedButton(onPressed: () => {
              widget.messageBloc.valueSink.add("Three")
            },
              child: Text('3'),)
          ],
        ),
      ),
    );
  }

}
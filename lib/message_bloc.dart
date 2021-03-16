import 'package:bloc_pattern_sample/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/*
variables
StreamControllers
Stream Getter
Sink Getter
Constructor ( Add / Listen to value changes)
Dispose
*/

// Use one stream controller for input as Sink and
// other stream controller for collect Stream

class MessageBloc
{
  // StreamController
  final StreamController<String> _inputStreamController = StreamController();
  final StreamController<String> _valueStreamController = StreamController.broadcast();

  StreamSink<String> get valueSink => _inputStreamController.sink;

  // Stream (used by widgets to receive the value changes)
  Stream<String> get valueStream => _valueStreamController.stream;

  // Constructor
  MessageBloc()
  {
    // listen for the changes
    _inputStreamController.stream.listen(receiveValue);
  }

  void receiveValue(String event) {
    print('MessageBloc - receiveValue : $event');

    // Add values to the sink
    _valueStreamController.sink.add(event);
  }

  // Dispose
  void dispose()
  {
    _valueStreamController.close();
    _inputStreamController.close();
  }
}
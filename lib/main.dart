import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/app.dart';
import 'package:latihan_bloc/general_observer.dart';
import 'package:latihan_bloc/pages/home/home.dart';

void main(List<String> args) {
  Bloc.observer = MyObserver();
  runApp(App());
}


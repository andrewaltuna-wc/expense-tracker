import 'package:bloc/bloc.dart';
import 'package:expense_tracker/app.dart';
import 'package:expense_tracker/tracker_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = TrackerObserver();
  runApp(const App());
}

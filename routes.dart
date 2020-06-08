import 'package:flutter/material.dart';
import 'package:furnitureshop/main.dart';
import 'package:furnitureshop/LivingRoom.dart';
import 'package:furnitureshop/BedRoom.dart';

void main() {

  runApp(MaterialApp(
      initialRoute: '/',
      routes:{
      '/':(context)=>MyApp (),
      '/livingRoom':(context)=>LivingRoom(),
      }));}
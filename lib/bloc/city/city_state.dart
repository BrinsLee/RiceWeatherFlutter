import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CityState extends Equatable {
  const CityState();
}

@immutable
class CityInit extends CityState {
  
  CityInit();

  @override
  List<Object> get props => [];
  
}
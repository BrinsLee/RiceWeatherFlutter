import 'package:equatable/equatable.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();
}
class RequestLocationEvent extends CityEvent {

  const RequestLocationEvent();

  @override
  List<Object> get props => [];
}
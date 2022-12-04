part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {

}

class LocationLoading extends LocationState{}

class LocationError extends LocationState{
  final String message;
  LocationError({required this.message});

  @override
  List<Object> get props => [message];
}

class LocationLoaded extends LocationState{
  final Position position;
  LocationLoaded({required this.position});

  @override
  List<Object> get props => [position];
}

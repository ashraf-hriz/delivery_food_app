import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:design_test_app/core/error/failures.dart';
import 'package:design_test_app/core/strings/constans.dart';
import 'package:design_test_app/features/location/domain/usecases/get_current_location_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCurrentLocationUseCase getCurrentLocation;
  LocationBloc({required this.getCurrentLocation}) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {
      if (event is GetCurrentLocationEvent){
        emit(LocationLoading());
        final result = await getCurrentLocation();
        emit(_mapFailureOrLocationToState(result));

      }
    });
  }

  LocationState _mapFailureOrLocationToState(Either<Failure, Position> either) {
    return either.fold(
          (failure) => LocationError(message: _mapFailureToMessage(failure)),
          (position) => LocationLoaded(
        position: position,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}

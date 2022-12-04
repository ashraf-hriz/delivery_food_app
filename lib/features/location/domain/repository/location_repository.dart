
import 'package:dartz/dartz.dart';
import 'package:design_test_app/core/error/failures.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository{
  Future<Either<Failure,Position>> getCurrentLocation();
}
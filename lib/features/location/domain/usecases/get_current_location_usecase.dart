import 'package:dartz/dartz.dart';
import 'package:design_test_app/core/error/failures.dart';
import 'package:design_test_app/features/location/domain/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';

class GetCurrentLocationUseCase{
  final LocationRepository locationRepository;
  GetCurrentLocationUseCase({required this.locationRepository});

  Future<Either<Failure,Position>> call() async{
    return await locationRepository.getCurrentLocation();
  }
}
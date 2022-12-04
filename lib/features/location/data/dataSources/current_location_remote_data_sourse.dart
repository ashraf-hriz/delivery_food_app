
import 'package:design_test_app/core/error/exeptions.dart';
import 'package:geolocator/geolocator.dart';

abstract class CurrentLocationRemoteDatasource{
  Future<Position> getCurrentLocation();
}

class CurrentLocationRemoteDatasourceImpl extends CurrentLocationRemoteDatasource{

  @override
  Future<Position> getCurrentLocation() async{
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      throw ServerException();
    } else {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
  }

}
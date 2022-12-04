
import 'package:dartz/dartz.dart';
import 'package:design_test_app/core/error/exeptions.dart';
import 'package:design_test_app/core/error/failures.dart';
import 'package:design_test_app/core/network/network_info.dart';
import 'package:design_test_app/features/location/data/dataSources/current_location_remote_data_sourse.dart';
import 'package:design_test_app/features/location/domain/repository/location_repository.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

class LocationRepositoryImp extends LocationRepository{
  final CurrentLocationRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;
  LocationRepositoryImp(
      {required this.networkInfo,required this.remoteDatasource});
  @override
  Future<Either<Failure,Position>> getCurrentLocation() async{
    if (await networkInfo.isConnected){
      try{
        var position = await remoteDatasource.getCurrentLocation();
        return Right(position);
      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}
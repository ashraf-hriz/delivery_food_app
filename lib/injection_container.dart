import 'package:design_test_app/core/network/network_info.dart';
import 'package:design_test_app/features/location/data/dataSources/current_location_remote_data_sourse.dart';
import 'package:design_test_app/features/location/data/repository/location_repository_impl.dart';
import 'package:design_test_app/features/location/domain/repository/location_repository.dart';
import 'package:design_test_app/features/location/domain/usecases/get_current_location_usecase.dart';
import 'package:design_test_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => LocationBloc(getCurrentLocation: sl()));

  //Usecases
  sl.registerLazySingleton(
      () => GetCurrentLocationUseCase(locationRepository: sl()));

  //Repositories
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImp(
      networkInfo: sl(),
      remoteDatasource: sl(),
    ),
  );

  //Datasourses
  sl.registerLazySingleton<CurrentLocationRemoteDatasource>(() => CurrentLocationRemoteDatasourceImpl());

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External

  sl.registerLazySingleton(() => InternetConnectionChecker());


}

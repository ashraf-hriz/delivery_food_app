import 'package:design_test_app/core/app_router/app_router.dart';
import 'package:design_test_app/core/app_theme/app_theme.dart';
import 'package:design_test_app/features/home/presentation/pages/home_screen.dart';
import 'package:design_test_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> di.sl<LocationBloc>()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        initialRoute: AppRouter.locationScreenRoute,
        getPages: AppRouter.routes,
      ),
    );
  }
}


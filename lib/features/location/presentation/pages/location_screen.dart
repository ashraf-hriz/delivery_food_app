import 'package:design_test_app/core/app_router/app_router.dart';
import 'package:design_test_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:design_test_app/features/location/presentation/widgets/header_widget.dart';
import 'package:design_test_app/features/location/presentation/widgets/map_widget.dart';
import 'package:design_test_app/features/location/presentation/widgets/message_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(GetCurrentLocationEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: BlocBuilder<LocationBloc,LocationState>(
          builder: (context,stat){
            if (stat is LocationLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if (stat is LocationLoaded){
              return bodyWidget(stat.position);
            }else if (stat is LocationError) {
              return MessageDisplayWidget(message: stat.message);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),


      ),
    );
  }
  bodyWidget(Position position){
    return Stack(
      children:  [

        //build map body
        Container(
          width: Get.width,
          height: Get.height,
          child: GoogleMap(
            markers:
              {
                Marker(
                  markerId: MarkerId('id'),
                  infoWindow: InfoWindow(
                    title: 'current',
                    snippet: 'location',
                    onTap: () {

                    },
                  ),
                  position: LatLng(
                    position.latitude,
                    position.longitude,
                  ),
                ),
              },
            myLocationEnabled: false,
            zoomControlsEnabled: false,
            buildingsEnabled: false,
            tiltGesturesEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 15,
            ),
          ),
        ),
        //MapWidget(position),
        //build header
        Column(
          children: [
            HeaderWidget(),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.primary,
                  fixedSize: Size(200,40)),
              child: Text('Save',style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
              onPressed: (){
                Get.toNamed(AppRouter.homeScreenRoute);
              },
            )
          ],
        ).paddingSymmetric(horizontal: 20,vertical: 20),
        //build save button
      ],
    );
  }
}

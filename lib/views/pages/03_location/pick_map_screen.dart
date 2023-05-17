import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/app_colors.dart';
import '../../../controller/location/location_controller.dart';
import '../../../model/address_model.dart';
import '../../theme/text_theme.dart';
import 'location_search_dialog.dart';

class PickMapScreen extends StatefulWidget {
  final bool fromSignUp;
  final bool fromAddAddress;
  final bool canRoute;
  final String route;
  // final GoogleMapController googleMapController;
  PickMapScreen({
    required this.fromSignUp,
    required this.fromAddAddress,
    required this.canRoute,
    required this.route,
  });

  @override
  State<PickMapScreen> createState() => _PickMapScreenState();
}

class _PickMapScreenState extends State<PickMapScreen> {
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;
  late LatLng _initialPosition;
  //!default  lat log
  final lat = 23.614328;
  final log = 58.545284;

  @override
  void initState() {
    super.initState();

    if (widget.fromAddAddress) {
      Get.find<LocationController>().setPickData();
    }
    _initialPosition = LatLng(
      lat, log,
      // double.parse(Get.find<SplashController>().configModel.defaultLocation.lat ?? '0'),
      // double.parse(Get.find<SplashController>().configModel.defaultLocation.lng ?? '0'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ResponsiveHelper.isDesktop(context) ? WebMenuBar() : null,
      body: SafeArea(
          child: Center(
              child: SizedBox(
        width: double.infinity,
        child: GetBuilder<LocationController>(builder: (locationController) {
          /*print('--------------${'${locationController.pickPlaceMark.name ?? ''} '
              '${locationController.pickPlaceMark.locality ?? ''} '
              '${locationController.pickPlaceMark.postalCode ?? ''} ${locationController.pickPlaceMark.country ?? ''}'}');*/

          return Stack(children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: widget.fromAddAddress
                    ? LatLng(locationController.position.latitude,
                        locationController.position.longitude)
                    : _initialPosition,
                zoom: 17,
              ),
              onMapCreated: (GoogleMapController mapController) {
                _mapController = mapController;
                if (!widget.fromAddAddress) {
                  Get.find<LocationController>()
                      .getCurrentLocation(false, mapController: mapController);
                }
              },
              zoomControlsEnabled: false,
              onCameraMove: (CameraPosition cameraPosition) {
                _cameraPosition = cameraPosition;
              },
              onCameraMoveStarted: () {
                locationController.disableButton();
              },
              onCameraIdle: () {
                Get.find<LocationController>()
                    .updatePosition(_cameraPosition, false);
              },
            ),
            Center(
                child: !locationController.loading
                    ? Icon(Icons.location_on)
                    : CircularProgressIndicator()),
            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: InkWell(
                onTap: () => Get.dialog(
                    LocationSearchDialog(mapController: _mapController)),
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(1)),
                  child: Row(children: [
                    Icon(Icons.location_on,
                        size: 25, color: Theme.of(context).primaryColor),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${locationController.pickPlaceMark.name ?? ''} ${locationController.pickPlaceMark.locality ?? ''} '
                        '${locationController.pickPlaceMark.postalCode ?? ''} ${locationController.pickPlaceMark.country ?? ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.search, size: 25),
                  ]),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 10,
              child: FloatingActionButton(
                child: Icon(Icons.my_location,
                    color: Theme.of(context).primaryColor),
                mini: true,
                backgroundColor: Theme.of(context).cardColor,
                onPressed: () => _checkPermission(() {
                  Get.find<LocationController>()
                      .getCurrentLocation(false, mapController: _mapController);
                }),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: !locationController.isLoading
                  ? TextButton(
                      onPressed: (locationController.buttonDisabled ||
                              locationController.loading)
                          ? null
                          : () {
                              if (locationController.pickPosition.latitude !=
                                      0 &&
                                  locationController.pickPlaceMark.name !=
                                      null) {
                                if (widget.fromAddAddress) {
                                  print('-------');
                                  // widget.googleMapController.moveCamera(
                                  //     CameraUpdate.newCameraPosition(
                                  //         CameraPosition(
                                  //             target: LatLng(
                                  //               locationController
                                  //                   .pickPosition.latitude,
                                  //               locationController
                                  //                   .pickPosition.longitude,
                                  //             ),
                                  //             zoom: 17)));
                                  locationController.setAddAddressData();
                                  Get.back();
                                } else {
                                  AddressModel _address = AddressModel(
                                    latitude: locationController
                                        .pickPosition.latitude
                                        .toString(),
                                    longitude: locationController
                                        .pickPosition.longitude
                                        .toString(),
                                    addressType: 'others'.tr,
                                    address:
                                        '${locationController.pickPlaceMark.name ?? ''} '
                                        '${locationController.pickPlaceMark.locality ?? ''} '
                                        '${locationController.pickPlaceMark.postalCode ?? ''} ${locationController.pickPlaceMark.country ?? ''}',
                                  );
                                  locationController.saveAddressAndNavigate(
                                      _address,
                                      widget.fromSignUp,
                                      widget.route,
                                      widget.canRoute);
                                }
                              } else {
                                // showCustomSnackBar('pick_an_address'.tr);
                              }
                            },
                      child: Container(
                        width: Get.width * 0.8,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          locationController.inZone
                              ? widget.fromAddAddress
                                  ? 'pick_address'.tr
                                  : 'pick_location'.tr
                              : 'service_not_available_in_this_area'.tr,
                          style:
                              AppText.paragraph1.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ]);
        }),
      ))),
    );
  }

  void _checkPermission(Function onTap) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      // showCustomSnackBar('you_have_to_allow'.tr);
    } else if (permission == LocationPermission.deniedForever) {
      // Get.dialog(PermissionDialog());
    } else {
      onTap();
    }
  }
}

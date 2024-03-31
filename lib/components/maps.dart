import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modern/components/const.dart';
import 'package:modern/components/navbar.dart';
import 'package:location/location.dart';

class MapsFlutter extends StatefulWidget {
  const MapsFlutter({super.key});

  @override
  State<MapsFlutter> createState() => _MapsState();
}

class _MapsState extends State<MapsFlutter> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  static const LatLng _pGooglePlex = LatLng(33.5122, 36.2984);
  static const LatLng sarc = LatLng(33.487879, 36.349117);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) => {
        getPolylinePoints().then((Coordinates) => {
              generatepolylinefrompoints(Coordinates),
            }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        toolbarHeight: 115,
        // leading: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 40),
        //   // child: IconButton(

        //   //   onPressed: () {},
        //   //   icon: const Icon(Icons.menu),
        //   //   iconSize: 33,
        //   //   alignment: Alignment.topCenter,
        //   // ),
        // ),
        title: ClipOval(
          child: Container(
            color: Colors.white,
            child: SizedBox(
              child: Image.asset(
                'images/sarc.png',
                height: 100,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: _currentP == null
          ? const Center(
              child: Text("loading...."),
            )
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition:
                  const CameraPosition(target: _pGooglePlex, zoom: 13),
              markers: {
                Marker(
                    markerId: const MarkerId("currentlocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentP!),
                const Marker(
                    markerId: MarkerId("source location"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: sarc),
                const Marker(
                    markerId: MarkerId("destination location"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex)
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> _cameratoposition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newcameraposition = CameraPosition(target: pos, zoom: 15);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newcameraposition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serverEnabled;
    PermissionStatus _permissionGranted;

    _serverEnabled = await _locationController.serviceEnabled();
    if (_serverEnabled) {
      _serverEnabled = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameratoposition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //     GOOGLE_MAPS_API_KEY,
    //     PointLatLng(sarc.latitude, sarc.longitude),
    //     PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
    //     travelMode: TravelMode.driving);
    // if (result.points.isNotEmpty) {
    //   result.points.forEach((PointLatLng point) {
    //     polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    //   });
    // } else {
    //   print(result.errorMessage);
    // }
    return polylineCoordinates;
  }

  void generatepolylinefrompoints(List<LatLng> polylinecoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylinecoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}

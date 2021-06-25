// import 'package:client_chaliar/ui/views/commande/map/direction_repository.dart';
// import 'package:client_chaliar/ui/views/commande/map/directions_model.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(37.773972, -122.431297),
//     zoom: 11.5,
//   );
//
//   GoogleMapController _googleMapController;
//   Marker _origin;
//   Marker _destination;
//   Directions _info;
//
//   @override
//   void dispose() {
//     _googleMapController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//             myLocationButtonEnabled: false,
//             zoomControlsEnabled: false,
//             initialCameraPosition: _initialCameraPosition,
//             onMapCreated: (controller) => _googleMapController = controller,
//             markers: {
//               if (_origin != null) _origin,
//               if (_destination != null) _destination
//             },
//             polylines: {
//               if (_info != null)
//                 Polyline(
//                   polylineId: const PolylineId('overview_polyline'),
//                   color: Colors.red,
//                   width: 5,
//                   points: _info.polylinePoints
//                       .map((e) => LatLng(e.latitude, e.longitude))
//                       .toList(),
//                 ),
//             },
//             onLongPress: _addMarker,
//           );
//   }
//
//   void _addMarker(LatLng pos) async {
//     if (_origin == null || (_origin != null && _destination != null)) {
//       // Origin is not set OR Origin/Destination are both set
//       // Set origin
//       setState(() {
//         _origin = Marker(
//           markerId: const MarkerId('origin'),
//           infoWindow: const InfoWindow(title: 'Origin'),
//           icon:
//           BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//           position: pos,
//         );
//         // Reset destination
//         _destination = null;
//
//         // Reset info
//         _info = null;
//       });
//     } else {
//       // Origin is already set
//       // Set destination
//       setState(() {
//         _destination = Marker(
//           markerId: const MarkerId('destination'),
//           infoWindow: const InfoWindow(title: 'Destination'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           position: pos,
//         );
//       });
//
//       // Get directions
//       final directions = await DirectionsRepository()
//           .getDirections(origin: _origin.position, destination: pos);
//       setState(() => _info = directions);
//     }
//   }
// }

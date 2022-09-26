import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/map_click.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/map_coordinates.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/map_ui.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/marker_icons.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/move_camera.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/padding.dart';

import 'package:how_much_spend_app/app/ui/android/record/widget/page.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/place_circle.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/place_marker.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/place_polygon.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/place_polyline.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/snapshot.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/tile_overlay.dart';

import 'lite_mode.dart';
// import 'package:google_maps_flutter_example/lite_mode.dart';
// import 'animate_camera.dart';
// import 'map_click.dart';
// import 'map_coordinates.dart';
// import 'map_ui.dart';
// import 'marker_icons.dart';
// import 'move_camera.dart';
// import 'padding.dart';
// import 'page.dart';
// import 'place_circle.dart';
// import 'place_marker.dart';
// import 'place_polyline.dart';
// import 'scrolling_map.dart';
// import 'snapshot.dart';
// import 'tile_overlay.dart';

final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
  const MapUiPage(),
  const MapCoordinatesPage(),
  const MapClickPage(),
  // const AnimateCameraPage(),
  const MoveCameraPage(),
  const PlaceMarkerPage(),
  const MarkerIconsPage(),
  // const ScrollingMapPage(),
  const PlacePolylinePage(),
  const PlacePolygonPage(),
  const PlaceCirclePage(),
  const PaddingPage(),
  const SnapshotPage(),
  const LiteModePage(),
  const TileOverlayPage(),
];

/// MapsDemo is the Main Application.
class GoogleMapPage extends StatelessWidget {
  /// Default Constructor
  const GoogleMapPage({Key? key}) : super(key: key);

  void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text(page.title)),
          body: page,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoogleMaps examples')),
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
          leading: _allPages[index].leading,
          title: Text(_allPages[index].title),
          onTap: () => _pushPage(context, _allPages[index]),
        ),
      ),
    );
  }
}

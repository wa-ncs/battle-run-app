import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'page.dart';

class PlacePolylinePage extends GoogleMapExampleAppPage {
  const PlacePolylinePage({Key? key})
      : super(const Icon(Icons.linear_scale), 'Place polyline', key: key);

  @override
  Widget build(BuildContext context) {
    return const PlacePolylineBody();
  }
}

class PlacePolylineBody extends StatefulWidget {
  const PlacePolylineBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PlacePolylineBodyState();
}

class PlacePolylineBodyState extends State<PlacePolylineBody> {

  GoogleMapController? controller;
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 0;
  PolylineId? selectedPolyline;
  Position? currentPosition;
  // Values when toggling polyline color
  int colorsIndex = 0;
  List<Color> colors = <Color>[
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.pink,
  ];

  // Values when toggling polyline width
  int widthsIndex = 0;
  List<int> widths = <int>[10, 20, 5];

  int jointTypesIndex = 0;
  List<JointType> jointTypes = <JointType>[
    JointType.mitered,
    JointType.bevel,
    JointType.round
  ];

  // Values when toggling polyline end cap type
  int endCapsIndex = 0;
  List<Cap> endCaps = <Cap>[Cap.buttCap, Cap.squareCap, Cap.roundCap];

  // Values when toggling polyline start cap type
  int startCapsIndex = 0;
  List<Cap> startCaps = <Cap>[Cap.buttCap, Cap.squareCap, Cap.roundCap];

  // Values when toggling polyline pattern
  int patternsIndex = 0;
  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[],
    <PatternItem>[
      PatternItem.dash(30.0),
      PatternItem.gap(20.0),
      PatternItem.dot,
      PatternItem.gap(20.0)
    ],
    <PatternItem>[PatternItem.dash(30.0), PatternItem.gap(20.0)],
    <PatternItem>[PatternItem.dot, PatternItem.gap(10.0)],
  ];

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    print('테스트');
    await getLocation().then((value) {
      print(value.longitude);
      print(value.latitude);
      setState(() {
        currentPosition = value;
      });
    });
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    super.dispose();
  }
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }
  void _onPolylineTapped(PolylineId polylineId) {
    setState(() {
      selectedPolyline = polylineId;
    });
  }

  void _remove(PolylineId polylineId) {
    setState(() {
      if (polylines.containsKey(polylineId)) {
        polylines.remove(polylineId);
      }
      selectedPolyline = null;
    });
  }

  void _add() {
    final int polylineCount = polylines.length;

    if (polylineCount == 12) {
      return;
    }

    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.orange,
      width: 5,
      points: _createPoints(),
      onTap: () {
        _onPolylineTapped(polylineId);
      },
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  void _toggleGeodesic(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        geodesicParam: !polyline.geodesic,
      );
    });
  }

  void _toggleVisible(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        visibleParam: !polyline.visible,
      );
    });
  }

  void _changeColor(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        colorParam: colors[++colorsIndex % colors.length],
      );
    });
  }

  void _changeWidth(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        widthParam: widths[++widthsIndex % widths.length],
      );
    });
  }

  void _changeJointType(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        jointTypeParam: jointTypes[++jointTypesIndex % jointTypes.length],
      );
    });
  }

  void _changeEndCap(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        endCapParam: endCaps[++endCapsIndex % endCaps.length],
      );
    });
  }

  void _changeStartCap(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        startCapParam: startCaps[++startCapsIndex % startCaps.length],
      );
    });
  }

  void _changePattern(PolylineId polylineId) {
    final Polyline polyline = polylines[polylineId]!;
    setState(() {
      polylines[polylineId] = polyline.copyWith(
        patternsParam: patterns[++patternsIndex % patterns.length],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isIOS = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

    final PolylineId? selectedId = selectedPolyline;
    final Position? test = currentPosition;
    print('currentPosition : $currentPosition');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: SizedBox(
            width: 350.0,
            height: 300.0,
            child: test != null ? GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target:  LatLng(test.latitude!, test.longitude!),
                zoom: 7.0,
              ),
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: _onMapCreated,
            ) : GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: const CameraPosition(
                target: LatLng(53.1721, -3.5402),
                zoom: 7.0,
              ),
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: _onMapCreated,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        TextButton(
                          onPressed: _add,
                          child: const Text('add'),
                        ),
                        TextButton(
                          onPressed: (selectedId == null)
                              ? null
                              : () => _remove(selectedId),
                          child: const Text('remove'),
                        ),
                        TextButton(
                          onPressed: (selectedId == null)
                              ? null
                              : () => _toggleVisible(selectedId),
                          child: const Text('toggle visible'),
                        ),
                        TextButton(
                          onPressed: (selectedId == null)
                              ? null
                              : () => _toggleGeodesic(selectedId),
                          child: const Text('toggle geodesic'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        TextButton(
                          onPressed: (selectedId == null)
                              ? null
                              : () => _changeWidth(selectedId),
                          child: const Text('change width'),
                        ),
                        TextButton(
                          onPressed: (selectedId == null)
                              ? null
                              : () => _changeColor(selectedId),
                          child: const Text('change color'),
                        ),
                        TextButton(
                          onPressed: isIOS || (selectedId == null)
                              ? null
                              : () => _changeStartCap(selectedId),
                          child: const Text('change start cap [Android only]'),
                        ),
                        TextButton(
                          onPressed: isIOS || (selectedId == null)
                              ? null
                              : () => _changeEndCap(selectedId),
                          child: const Text('change end cap [Android only]'),
                        ),
                        TextButton(
                          onPressed: isIOS || (selectedId == null)
                              ? null
                              : () => _changeJointType(selectedId),
                          child: const Text('change joint type [Android only]'),
                        ),
                        TextButton(
                          onPressed: isIOS || (selectedId == null)
                              ? null
                              : () => _changePattern(selectedId),
                          child: const Text('change pattern [Android only]'),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    final double offset = _polylineIdCounter.ceilToDouble();
    points.add(_createLatLng(51.4816 + offset, -3.1791));
    points.add(_createLatLng(53.0430 + offset, -2.9925));
    points.add(_createLatLng(53.1396 + offset, -4.2739));
    points.add(_createLatLng(52.4153 + offset, -4.0829));
    return points;
  }

  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);
  }
}
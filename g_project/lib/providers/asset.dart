import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class Asset with ChangeNotifier {
  //caling data from db firebase

  final String assetNo;
  final String assetName;
  final String assetBrand;
  final String assetRegisterd;
  final String assetLocation;
  final String assetStatus;

  Asset({
    required this.assetNo,
    required this.assetName,
    required this.assetBrand,
    required this.assetRegisterd,
    required this.assetLocation,
    required this.assetStatus,
  });
}

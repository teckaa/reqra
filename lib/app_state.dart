import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appDefaultWebWidth =
          prefs.getInt('ff_appDefaultWebWidth') ?? _appDefaultWebWidth;
    });
    _safeInit(() {
      _userReferral = prefs.getString('ff_userReferral')?.ref ?? _userReferral;
    });
    _safeInit(() {
      _toggleBalance = prefs.getBool('ff_toggleBalance') ?? _toggleBalance;
    });
    _safeInit(() {
      _BillApiKey = prefs.getString('ff_BillApiKey') ?? _BillApiKey;
    });
    _safeInit(() {
      _adsImageList = prefs
              .getStringList('ff_adsImageList')
              ?.map((x) {
                try {
                  return AdsFieldsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _adsImageList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _appDefaultWebWidth = 1280;
  int get appDefaultWebWidth => _appDefaultWebWidth;
  set appDefaultWebWidth(int _value) {
    _appDefaultWebWidth = _value;
    prefs.setInt('ff_appDefaultWebWidth', _value);
  }

  DocumentReference? _userReferral;
  DocumentReference? get userReferral => _userReferral;
  set userReferral(DocumentReference? _value) {
    _userReferral = _value;
    _value != null
        ? prefs.setString('ff_userReferral', _value.path)
        : prefs.remove('ff_userReferral');
  }

  String _menuType = '';
  String get menuType => _menuType;
  set menuType(String _value) {
    _menuType = _value;
  }

  bool _toggleBalance = false;
  bool get toggleBalance => _toggleBalance;
  set toggleBalance(bool _value) {
    _toggleBalance = _value;
    prefs.setBool('ff_toggleBalance', _value);
  }

  double _cryptoTenderAmount = 0.0;
  double get cryptoTenderAmount => _cryptoTenderAmount;
  set cryptoTenderAmount(double _value) {
    _cryptoTenderAmount = _value;
  }

  List<double> _sumCommision = [];
  List<double> get sumCommision => _sumCommision;
  set sumCommision(List<double> _value) {
    _sumCommision = _value;
  }

  void addToSumCommision(double _value) {
    _sumCommision.add(_value);
  }

  void removeFromSumCommision(double _value) {
    _sumCommision.remove(_value);
  }

  void removeAtIndexFromSumCommision(int _index) {
    _sumCommision.removeAt(_index);
  }

  void updateSumCommisionAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _sumCommision[_index] = updateFn(_sumCommision[_index]);
  }

  void insertAtIndexInSumCommision(int _index, double _value) {
    _sumCommision.insert(_index, _value);
  }

  String _BillApiKey = '';
  String get BillApiKey => _BillApiKey;
  set BillApiKey(String _value) {
    _BillApiKey = _value;
    prefs.setString('ff_BillApiKey', _value);
  }

  List<AdsFieldsStruct> _adsImageList = [
    AdsFieldsStruct.fromSerializableMap(jsonDecode(
        '{\"ads_photo\":\"Hello World\",\"ads_image\":\"https://picsum.photos/seed/809/600\",\"ads_link\":\"URL LINK\"}')),
    AdsFieldsStruct.fromSerializableMap(jsonDecode(
        '{\"ads_photo\":\"Hello World 2\",\"ads_image\":\"https://picsum.photos/seed/509/600\",\"ads_link\":\"URL LINK 2\"}')),
    AdsFieldsStruct.fromSerializableMap(jsonDecode(
        '{\"ads_photo\":\"Hello World 3\",\"ads_image\":\"https://picsum.photos/seed/628/600\",\"ads_link\":\"URL LINK 3\"}'))
  ];
  List<AdsFieldsStruct> get adsImageList => _adsImageList;
  set adsImageList(List<AdsFieldsStruct> _value) {
    _adsImageList = _value;
    prefs.setStringList(
        'ff_adsImageList', _value.map((x) => x.serialize()).toList());
  }

  void addToAdsImageList(AdsFieldsStruct _value) {
    _adsImageList.add(_value);
    prefs.setStringList(
        'ff_adsImageList', _adsImageList.map((x) => x.serialize()).toList());
  }

  void removeFromAdsImageList(AdsFieldsStruct _value) {
    _adsImageList.remove(_value);
    prefs.setStringList(
        'ff_adsImageList', _adsImageList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAdsImageList(int _index) {
    _adsImageList.removeAt(_index);
    prefs.setStringList(
        'ff_adsImageList', _adsImageList.map((x) => x.serialize()).toList());
  }

  void updateAdsImageListAtIndex(
    int _index,
    AdsFieldsStruct Function(AdsFieldsStruct) updateFn,
  ) {
    _adsImageList[_index] = updateFn(_adsImageList[_index]);
    prefs.setStringList(
        'ff_adsImageList', _adsImageList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAdsImageList(int _index, AdsFieldsStruct _value) {
    _adsImageList.insert(_index, _value);
    prefs.setStringList(
        'ff_adsImageList', _adsImageList.map((x) => x.serialize()).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

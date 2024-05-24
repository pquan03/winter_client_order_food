import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:winter_food/common/snackbar_custom.dart';
import 'package:winter_food/models/api_error.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class UserLocationController extends GetxController {
  LatLng position = const LatLng(0.0, 0.0);

  void setPosition(LatLng newPosition) {
    position = newPosition;
    update();
  }

  RxString address = ''.obs;
  RxString postalCode = ''.obs;

  void getUserAddress(LatLng position) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        final rsAddress = responseBody['results'][0]['formatted_address'];
        address.value = rsAddress;

        final addressComponens =
            responseBody['results'][0]['address_components'];

        for (var component in addressComponens) {
          if (component['types'][0] == 'postal_code') {
            postalCode.value = component['long_name'];
            break;
          }
        }
      } else {
        final error = ApiError.fromJson(jsonDecode(response.body));
        WLoader.errorSnackBar(title: 'Error', message: error.message);
      }
    } catch (err) {
      WLoader.errorSnackBar(title: 'Error', message: err.toString());
    }
  }
}

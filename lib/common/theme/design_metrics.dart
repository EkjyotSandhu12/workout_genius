import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/screen_properties_service.dart';

//This will contain all sizes, used in entire app, to make the app consistent and use same sizes all over the app
//FONT SIZES
//WIDTHS/HEIGHTS
//PADDING AND MARGINS

class DesignMetrics {
  ///==> MARGINS/PADDING/HEIGHT/WIDTH DECLARE
  double _margin12 = 12;
  ///
  double _padding22 = 22;
  ///
  double _height330 = 330;
  ///
  double _width300 = 300;
  ///
  double _radius12 = 12;
  ///
  double _size80 = 80;
  double _size100 = 100;
  ///
  double _gap12 = 12;
  ///

  ///==> GETTERS

  //==> APP MARGINS GETTER
  double get getPageMargin  => _padding22;




  //==> APP RADIUS GETTER
  double get commonContainerRadius12 => _updateBasedOnScreenWidth(_radius12);
  double get dialogRadius => _updateBasedOnScreenWidth(_radius12);

  ///==================================================///
  _updateBasedOnScreenWidth(double moreThan400,{
    double? moreThan800,
    double? moreThan1280,
    double? moreThan1600,
  }) {
    ScreenPropertiesService screenPropertiesService = ScreenPropertiesService();

    switch (screenPropertiesService.screenWidth) {
      case > 400:
        return moreThan400;
      case > 800:
        return moreThan800 ?? moreThan400;
      case > 1280:
        return moreThan1280 ?? moreThan400;
      case > 1600:
        return moreThan1600 ?? moreThan400;
      default:
        return moreThan400;
    }
  }
}

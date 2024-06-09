import '../services/screen_properties_service.dart';

//This will contain all sizes, used in entire app, to make the app consistent and use same sizes all over the app
//WIDTHS/HEIGHTS
//PADDING AND MARGINS

class DesignMetrics {
  //==> MARGINS
  double _margin22 = 22;
  double _margin12 = 12;
  //==> PADDING
  double _padding22 = 22;
  //==> HEIGHT
  double _height330 = 330;
  //==> WIDTH
  double _width300 = 300;
  ///==> Radius
  double _radius12 = 12;
  double _radius14 = 14;
  //==> Gaps
  double _gap12 = 12;

  ///==> GETTERS

  //==> APP MARGINS GETTER
  double get getPageMargin  => _margin12;

  //==> APP RADIUS GETTER
  double get getCommonRadius14 => _radius14;
  double get getDialogRadius12 => _radius12;

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

import 'package:seven_minutes/App_Guide/Constants/constants.dart';

// model for slide update

class SlideUpdate {
  final UpdateType updateType;
  final SlideDirection direction;
  final double slidePercent;

  SlideUpdate(
    this.direction,
    this.slidePercent,
    this.updateType,
  );
}

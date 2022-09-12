import 'package:seven_minutes/App_Guide/Constants/constants.dart';
import 'package:seven_minutes/App_Guide/Model/page_view_model.dart';

//view model for page indicator

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent,
  );
}

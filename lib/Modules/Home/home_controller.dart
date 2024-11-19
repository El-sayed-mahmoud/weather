

import 'package:state_extended/state_extended.dart';

class HomeController extends StateXController {
  factory HomeController() => _this ??= HomeController._();
  static HomeController? _this;
  HomeController._();
  bool loading=false;
  List<DateTime> dates =List.generate(3, (index) => DateTime.now().add(Duration(days: index)));
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

}

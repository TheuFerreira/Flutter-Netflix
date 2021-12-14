import 'package:mobx/mobx.dart';

part 'slider_controller.g.dart';

class SliderController = SliderControllerBase with _$SliderController;

abstract class SliderControllerBase with Store {
  @observable
  int currentPage = 0;

  @action
  void setPage(int page) => currentPage = page;
}

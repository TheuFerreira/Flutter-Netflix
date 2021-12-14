import 'package:mobx/mobx.dart';

part 'question_controller.g.dart';

class QuestionController = QuestionControllerBase with _$QuestionController;

abstract class QuestionControllerBase with Store {
  @observable
  bool isOpen = false;

  @action
  void changeOpen() {
    isOpen = !isOpen;
  }
}

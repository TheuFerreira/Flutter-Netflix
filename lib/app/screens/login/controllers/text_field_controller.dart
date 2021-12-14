import 'package:mobx/mobx.dart';

part 'text_field_controller.g.dart';

class TextFieldController = TextFieldControllerBase with _$TextFieldController;

abstract class TextFieldControllerBase with Store {
  @observable
  bool isFocused = false;

  @action
  void onChangeFocus() {
    isFocused = !isFocused;
  }
}

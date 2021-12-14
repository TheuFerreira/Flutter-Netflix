import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/register/components/slider_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/text_field_widget.dart';
import 'package:flutter_netflix/app/screens/register/controllers/create_account_controller.dart';
import 'package:flutter_netflix/app/shared/controllers/State/button_state.dart';
import 'package:flutter_netflix/app/shared/controllers/State/text_field_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';

class PageCreateAccount extends StatefulWidget {
  final CreateAccountController controller;
  final CurrentAccountController currentAccountController;
  final Function()? onTapContinue;

  const PageCreateAccount(
    this.controller,
    this.currentAccountController, {
    Key? key,
    this.onTapContinue,
  }) : super(key: key);

  @override
  State<PageCreateAccount> createState() => _PageCreateAccountState();
}

class _PageCreateAccountState extends State<PageCreateAccount> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Widget _textField(
    String label,
    TextFieldState state,
    TextEditingController controller,
    Function(String) focusField,
    Function(String) validate, {
    TextInputType? keyboardType,
    bool isPassword = false,
  }) {
    var color = Colors.black;
    var invalid = false;
    var messageError = '';
    if (state is TextFieldNormal) {
      color = state.color;
    } else if (state is TextFieldFocused) {
      color = state.color;
    } else if (state is TextFieldError) {
      invalid = true;
      color = state.color;
      messageError = state.message;
    } else if (state is TextFieldValid) {
      color = state.color;
    }

    return TextFieldWidget(
      label: label,
      error: messageError,
      color: color,
      isInvalid: invalid,
      controller: controller,
      keyboardType: keyboardType,
      isPassword: isPassword,
      onGainFocus: focusField,
      onChanged: validate,
      onLostFocus: validate,
    );
  }

  Widget _email() {
    return Observer(
      builder: (_) => _textField(
        'Email',
        widget.controller.emailState,
        emailTextController,
        widget.controller.emailFocusField,
        widget.controller.validateEmail,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _password() {
    return Observer(
      builder: (_) => _textField(
        'Senha',
        widget.controller.passwordState,
        passwordTextController,
        widget.controller.passwordFocusField,
        widget.controller.validatePassword,
        isPassword: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: SliderWidget(
          onTop: true,
          header: Observer(
            builder: (_) => Visibility(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.orange[700],
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.warning, size: 40),
                    title: Text('Parece que essa conta já existe.'),
                    subtitle: Text('Accesse-a ou tente usar outro email.'),
                  ),
                ),
              ),
              visible: widget.controller.accountExists,
            ),
          ),
          subtitle: 'PASSO 1 DE 3',
          title: 'Informe seu email e senha para iniciar a assinatura',
          description: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Faltam só dois passos! Nós também detestamos formulários.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Crie sua conta.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12.0),
              _email(),
              const SizedBox(height: 12.0),
              _password(),
            ],
          ),
          footer: Row(
            children: [
              Expanded(
                child: Observer(
                  builder: (_) {
                    final state = widget.controller.buttonRegister;
                    bool isLoading = state is ButtonLoading;

                    return ElevatedButton(
                      child: isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              ),
                            )
                          : const Text('CONTINUAR'),
                      onPressed: isLoading
                          ? () {}
                          : () async {
                              final result = await widget.controller.register(
                                emailTextController.text,
                                passwordTextController.text,
                                widget.currentAccountController,
                              );

                              if (result == false) {
                                return;
                              }

                              widget.onTapContinue!();
                            },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

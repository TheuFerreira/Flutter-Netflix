import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/login/components/text_field_widget.dart';
import 'package:flutter_netflix/app/screens/login/controllers/login_controller.dart';
import 'package:flutter_netflix/app/shared/components/alert_dialog_widget.dart';
import 'package:flutter_netflix/app/shared/controllers/State/text_field_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:flutter_netflix/app/shared/services/url_service.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget loadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
        SizedBox(height: 32.0),
        Text('Acessando'),
      ],
    );
  }

  void showAlertDialog() async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialogWidget(
          title: 'Senha incorreta',
          description:
              'Senha incorreta. Tente novamente ou redefina sua senha.',
          confirm: 'RECUPERAR SENHA',
          cancel: 'TENTAR DE NOVO',
          onConfirm: () {
            URLService().open('https://www.netflix.com/br/loginhelp');
            Navigator.of(ctx).pop();
            Navigator.of(context).pop();
          },
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  void onTapEnter() async {
    final accountController = context.read<CurrentAccountController>();
    final result = await controller.validLogin(
      emailController.text,
      passwordController.text,
      accountController,
    );

    if (result == false) {
      showAlertDialog();
    } else {
      Navigator.of(context).pop(true);
    }
  }

  Observer buttonEnter() {
    return Observer(
      builder: (_) {
        final isValidFields = controller.isValidFields;
        return ElevatedButton(
          child: const Text('Entrar'),
          onPressed: isValidFields ? onTapEnter : () {},
          style: isValidFields
              ? null
              : ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(
                      color: Colors.white70,
                      width: 3,
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget fieldWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldWidget(
          emailController,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) =>
              controller.validEmail(email, passwordController.text),
        ),
        Observer(
          builder: (_) {
            final state = controller.passwordState;
            bool isError = false;
            String message = '';

            if (state is TextFieldError) {
              isError = true;
              message = state.message;
            }

            return TextFieldWidget(
              passwordController,
              label: 'Senha',
              isError: isError,
              message: message,
              isPassword: true,
              onChanged: (password) => controller.validPassword(
                emailController.text,
                password,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(
                child: buttonEnter(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        TextButton(
          child: const Text(
            'Precisa de ajuda?',
            style: TextStyle(color: Colors.white54),
          ),
          onPressed: () =>
              URLService().open('https://www.netflix.com/br/loginhelp'),
        ),
        const SizedBox(height: 8.0),
        TextButton(
          child: const Text(
            'Novo por aqui? Inscreva-se agora.',
            style: TextStyle(color: Colors.white70),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Sign in is protected by Google reCAPTCHA to ensure you\'re not a bot. Learn more',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo_netflix.png',
          height: 25,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Observer(
            builder: (_) {
              final isLoading = controller.isLoading;
              return isLoading ? loadingWidget() : fieldWidget();
            },
          ),
        ),
      ),
    );
  }
}

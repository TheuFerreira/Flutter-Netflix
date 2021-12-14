import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/register/components/card_credit_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/change_plan_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/slider_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/text_field_widget.dart';
import 'package:flutter_netflix/app/screens/register/controllers/credit_card_controller.dart';
import 'package:flutter_netflix/app/screens/register/controllers/plan_controller.dart';
import 'package:flutter_netflix/app/shared/const/colors.dart';
import 'package:flutter_netflix/app/shared/controllers/State/button_state.dart';
import 'package:flutter_netflix/app/shared/controllers/State/text_field_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PageCreditCard extends StatefulWidget {
  final PlanController planController;
  final CreditCardController controller;
  final CurrentAccountController currentAccountController;
  final Function()? onTapChangePlan;
  final Function()? onTapStartSignature;
  const PageCreditCard(
    this.controller,
    this.planController,
    this.currentAccountController, {
    Key? key,
    @required this.onTapChangePlan,
    @required this.onTapStartSignature,
  }) : super(key: key);

  @override
  State<PageCreditCard> createState() => _PageCreditCardState();
}

class _PageCreditCardState extends State<PageCreditCard> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberController = TextEditingController();
  final dateValidController = TextEditingController();
  final cvvController = TextEditingController();
  late int typePayment = 0;

  final dateValidFormarter = MaskTextInputFormatter(
    mask: "##/##",
    filter: {"#": RegExp(r'[0-9]')},
  );

  Widget _textField(
    String label,
    TextEditingController controller,
    TextFieldState state,
    Function(String) validate, {
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    Color color = Colors.black;
    bool isInvalid = false;
    String error = '';

    if (state is TextFieldError) {
      color = state.color;
      isInvalid = true;
      error = state.message;
    } else if (state is TextFieldValid) {
      color = state.color;
    } else if (state is TextFieldNormal) {
      color = state.color;
    }

    return TextFieldWidget(
      label: label,
      color: color,
      isInvalid: isInvalid,
      error: error,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: validate,
      onLostFocus: validate,
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
          subtitle: 'PASSO 3 DE 3',
          title: 'Informe os dados do seu cartão de crédito ou débito',
          description: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CardCreditWidget('assets/images/img_visa.png'),
                  SizedBox(width: 6),
                  CardCreditWidget('assets/images/img_mastercard.png'),
                  SizedBox(width: 6),
                  CardCreditWidget('assets/images/img_americam_express.png'),
                  SizedBox(width: 6),
                  CardCreditWidget('assets/images/img_elo.png'),
                  SizedBox(width: 6),
                  CardCreditWidget('assets/images/img_hipercard.png'),
                ],
              ),
              const SizedBox(height: 16.0),
              Observer(
                builder: (_) => _textField(
                  'Nome',
                  nameController,
                  widget.controller.nameState,
                  widget.controller.validateName,
                ),
              ),
              const SizedBox(height: 12.0),
              Observer(
                builder: (_) => _textField(
                  'Sobrenome',
                  lastNameController,
                  widget.controller.lastNameState,
                  widget.controller.validateLastName,
                ),
              ),
              const SizedBox(height: 12.0),
              Observer(
                builder: (_) => _textField(
                  'Número do cartão',
                  numberController,
                  widget.controller.numberState,
                  widget.controller.validateNumber,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 12.0),
              Observer(
                builder: (_) => _textField(
                  'Data de validade (MM/AA)',
                  dateValidController,
                  widget.controller.dateValidState,
                  (value) => widget.controller
                      .validateDateValid(dateValidFormarter.getMaskedText()),
                  keyboardType: TextInputType.number,
                  inputFormatters: [dateValidFormarter],
                ),
              ),
              const SizedBox(height: 12.0),
              Observer(
                builder: (_) => _textField(
                  'Código de verificação (CVV)',
                  cvvController,
                  widget.controller.cvvState,
                  widget.controller.validateCVV,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 6.0),
              FlutterRadioGroup(
                titles: const ['Crédito', 'Débito'],
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
                label: 'Escolha sua forma de pagamento preferida:',
                labelVisible: true,
                activeColor: backgroundElevatedButton,
                defaultSelected: 0,
                orientation: RGOrientation.HORIZONTAL,
                titleStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
                onChanged: (value) {
                  typePayment = value!;
                },
              ),
              const SizedBox(height: 16.0),
              Observer(
                builder: (_) {
                  final selected = widget.planController.selected!;
                  return ChangePlanWidget(
                    selected,
                    onTap: widget.onTapChangePlan,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                'Cartões que suportam transações de débito e de crédito poderão ser processados de ambas as formas.'
                '\n\n'
                'Ao clicar no botão "INICIAR ASSINATURA" abaixo, você concorda com nossos Termos de Uso e com nossa Declaração de privacidade, confirma ter mais de 18 anos e aceita que a Netflix renovará automaticamente sua assinatura e cobrará uma taxa mensal (atualmente R\$25,90) da sua forma de pagamento até você cancelar. Você pode cancelar sua assinatura quando quiser para evitar novas cobranças. Para cancelar, acesse a seção "Conta" e clique em "Cancelar assinatura".',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          footer: Row(
            children: [
              Expanded(
                child: Observer(
                  builder: (_) {
                    final state = widget.controller.buttonState;
                    final isLoading = state is ButtonLoading;

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
                          : const Text('INICIAR ASSINATURA'),
                      onPressed: isLoading
                          ? () {}
                          : () async {
                              final result =
                                  await widget.controller.startSignature(
                                nameController.text,
                                lastNameController.text,
                                numberController.text,
                                dateValidController.text,
                                cvvController.text,
                                typePayment,
                                widget.currentAccountController,
                              );
                              if (!result) {
                                return;
                              }

                              widget.onTapStartSignature!();
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

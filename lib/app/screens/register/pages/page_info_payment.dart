import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/register/components/card_credit_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/card_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/slider_widget.dart';
import 'package:flutter_netflix/app/shared/const/colors.dart';

class PageInfoPayment extends StatelessWidget {
  final Function()? onTapCreditCard;
  const PageInfoPayment({
    Key? key,
    this.onTapCreditCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: SliderWidget(
        onTop: true,
        header: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Icon(
            Icons.lock,
            color: backgroundElevatedButton,
            size: 50,
          ),
        ),
        subtitle: 'PASSO 3 DE 3',
        title: 'Informe seus dados de pagamento',
        description: Column(
          children: [
            const Text(
              'Sua assinatura começa assim que você configurar o pagamento.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sem compromisso. Cancele online quando quiser.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8),
            CardWidget(
              title: 'Cartão de crédito ou débito',
              onTap: onTapCreditCard,
              hasIcons: true,
              childrens: const [
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/register/components/check_text_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/slider_widget.dart';
import 'package:flutter_netflix/app/shared/const/colors.dart';

class PageInfoPlan extends StatelessWidget {
  final Function()? onTapContinue;
  const PageInfoPlan({
    Key? key,
    this.onTapContinue,
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
        header: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Icon(
            Icons.check_circle_outline,
            color: backgroundElevatedButton,
            size: 50,
          ),
        ),
        subtitle: 'PASSO 2 DE 3',
        title: 'Escolha seu plano.',
        description: Column(
          children: const [
            CheckTextWidget(
              'Sem compromisso, cancele quando quiser.',
            ),
            SizedBox(height: 8.0),
            CheckTextWidget(
              'Todo o contéudo da Netflix por um preço único e acessível.',
            ),
            SizedBox(height: 8.0),
            CheckTextWidget(
              'Assista o quanto quiser em todos os seus aparelhos.',
            ),
          ],
        ),
        footer: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('VEJA NOSSOS PLANOS'),
                onPressed: onTapContinue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

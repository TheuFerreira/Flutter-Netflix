import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/register/components/slider_widget.dart';

class PageSetupAccount extends StatelessWidget {
  final Function()? onTapContinue;
  const PageSetupAccount({
    Key? key,
    @required this.onTapContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SliderWidget(
        header: Image.asset(
          'assets/images/img_multiple_devices_transparent.png',
          height: 140,
          alignment: Alignment.centerLeft,
        ),
        subtitle: 'PASSO 1 DE 3',
        title: 'Configure sua conta',
        description: const Text(
          'A Netflix é personalizada para você. Use seu email e crie uma senha para assistir à Netflix em qualquer aparelho quando você quiser.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        footer: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('CONTINUAR'),
                onPressed: onTapContinue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

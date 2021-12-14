import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final bool isLogged;
  final Function()? onTapPrivacy;
  final Function()? onTapLogin;
  final Function()? onTapExit;
  final Function()? onTapQuestions;
  final Function()? onTapHelp;
  const AppBarWidget({
    Key? key,
    this.isLogged = false,
    @required this.onTapPrivacy,
    @required this.onTapLogin,
    @required this.onTapExit,
    @required this.onTapQuestions,
    @required this.onTapHelp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const globalPadding = 16.0;
    const horizontalPadding = globalPadding * 2;

    return SizedBox(
      height: 30 + horizontalPadding,
      child: Padding(
        padding: const EdgeInsets.only(
          top: globalPadding,
          bottom: globalPadding,
          left: globalPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo_netflix.png',
              height: 25,
            ),
            Row(
              children: [
                TextButton(
                  child: const Text('PRIVACIDADE'),
                  onPressed: onTapPrivacy,
                ),
                isLogged
                    ? TextButton(
                        child: const Text('SAIR'),
                        onPressed: onTapExit,
                      )
                    : TextButton(
                        child: const Text('ENTRAR'),
                        onPressed: onTapLogin,
                      ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      child: Text('Perguntas Frequentes'),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text('AJUDA'),
                      value: 1,
                    ),
                  ],
                  onSelected: (result) {
                    if (result == 0) {
                      onTapQuestions!();
                    } else if (result == 1) {
                      onTapHelp!();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

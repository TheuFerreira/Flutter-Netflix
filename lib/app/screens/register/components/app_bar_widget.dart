import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final bool isLogged;
  final Function()? onTapHelp;
  final Function()? onTapEnter;
  final Function()? onTapExit;
  const AppBarWidget({
    Key? key,
    this.isLogged = false,
    @required this.onTapHelp,
    @required this.onTapEnter,
    @required this.onTapExit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo_netflix.png', height: 30),
          Row(
            children: [
              TextButton(
                child: const Text('AJUDA'),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onPressed: onTapHelp,
              ),
              isLogged
                  ? TextButton(
                      child: const Text('SAIR'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onPressed: onTapExit,
                    )
                  : TextButton(
                      child: const Text('ENTRAR'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onPressed: onTapEnter,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

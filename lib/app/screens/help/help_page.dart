import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/help/components/button_widget.dart';
import 'package:flutter_netflix/app/screens/help/components/link_tile_widget.dart';
import 'package:flutter_netflix/app/screens/help/const/links.dart';
import 'package:flutter_netflix/app/shared/services/url_service.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo_netflix.png',
            height: 26,
          ),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0, top: 8.0),
                child: Center(
                  child: Text(
                    'Procurar ajuda online',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ...links.map((e) {
                bool isFirst = links.indexOf(e) == 0;
                return LinkTileWidget(
                  e,
                  isFirst: isFirst,
                  onTap: () => URLService().open(e.url),
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0, top: 30.0),
                      child: Text(
                        'Entrar em\ncontato com o atendimento ao cliente da Netflix',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'A chamada é grátis: usaremos sua conexão à internet.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ButtonWidget(
                      icon: Icons.message,
                      title: 'BATE-PAPO',
                      onPressed: () => URLService()
                          .open('https://help.netflix.com/mobilechat'),
                    ),
                    const SizedBox(height: 12.0),
                    ButtonWidget(
                      icon: Icons.call,
                      title: 'LIGAR',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

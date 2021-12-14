import 'package:flutter/material.dart';

class LinkModel {
  final IconData? icon;
  final String title;
  final String url;

  LinkModel(this.title, this.icon, this.url);
}

List<LinkModel> links = [
  LinkModel(
    'Centro de ajuda',
    Icons.exit_to_app,
    'https://help.netflix.com/pt',
  ),
  LinkModel(
    'Atualizar forma de pagamento',
    Icons.credit_card,
    'https://www.netflix.com/br/login?nextpage=https%3A%2F%2Fwww.netflix.com%2FYourAccountPayment',
  ),
  LinkModel(
    'Solicitar um título',
    Icons.ondemand_video,
    'https://help.netflix.com/en/titlerequest',
  ),
  LinkModel(
    'Alterar senha',
    Icons.lock,
    'https://www.netflix.com/br/Login?nextpage=http%3A%2F%2Fwww.netflix.com%2Fpassword',
  ),
  LinkModel(
    'Cancelar conta',
    Icons.block,
    'https://www.netflix.com/br/login?nextpage=https%3A%2F%2Fwww.netflix.com%2FCancelPlan',
  ),
  LinkModel(
    'Resolver problemas de conexão',
    Icons.settings,
    'https://help.netflix.com/pt/troubleshooting',
  ),
  LinkModel(
    'Privacidade',
    Icons.privacy_tip,
    'https://help.netflix.com/legal/privacy',
  ),
  LinkModel(
    'Termos de uso',
    Icons.feed,
    'https://help.netflix.com/legal/termsofuse',
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/help/help_page.dart';
import 'package:flutter_netflix/app/screens/introduction/components/app_bar_widget.dart';
import 'package:flutter_netflix/app/screens/introduction/components/dots_widget.dart';
import 'package:flutter_netflix/app/screens/introduction/components/slider_widget.dart';
import 'package:flutter_netflix/app/screens/introduction/controllers/slider_controller.dart';
import 'package:flutter_netflix/app/screens/introduction/modals/question_modal.dart';
import 'package:flutter_netflix/app/screens/introduction/model/slider_model.dart';
import 'package:flutter_netflix/app/screens/login/login_page.dart';
import 'package:flutter_netflix/app/screens/register/register_page.dart';
import 'package:flutter_netflix/app/shared/animations/page/slide_left_route.dart';
import 'package:flutter_netflix/app/shared/controllers/State/page_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:flutter_netflix/app/shared/services/url_service.dart';
import 'package:provider/provider.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = SliderController();

  void onTapPrivacy() {
    URLService().open('https://help.netflix.com/legal/privacy');
  }

  void onTapLogin() async {
    final result = await Navigator.of(context).push(
      SlideLeftRoute(widget: const LoginPage()),
    );

    if (result != true) return;
  }

  void onTapExit(CurrentAccountController currentAccountController) {
    currentAccountController.exit();
  }

  void onTapQuestions() async {
    final maxHeight = MediaQuery.of(context).size.height * 0.95;

    await showModalBottomSheet(
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      constraints: BoxConstraints(maxHeight: maxHeight),
      context: context,
      builder: (ctx) => const QuestionModal(),
    );
  }

  void onTapHelp() {
    Navigator.of(context).push(
      SlideLeftRoute(widget: const HelpPage()),
    );
  }

  void onTapLetsGo() async {
    Navigator.of(context).push(
      SlideLeftRoute(widget: const RegisterPage()),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_netflix.png',
            height: 40,
          ),
          const SizedBox(height: 32.0),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget listWidget() {
    final currentAccountController =
        Provider.of<CurrentAccountController>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: PageView.builder(
            onPageChanged: controller.setPage,
            itemCount: sliders.length,
            itemBuilder: (context, i) => SliderWidget(index: i),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.black,
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Observer(
                builder: (_) {
                  final currentPage = controller.currentPage;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < sliders.length; i++)
                        DotsWidget(isSelected: i == currentPage),
                    ],
                  );
                },
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: ElevatedButton(
                    child: Observer(
                      builder: (_) {
                        final account = currentAccountController.currentAccount;
                        final isLogged = account != null;

                        if (isLogged) {
                          final isCompletedAccount =
                              account!.isCompletedAccount();
                          if (isCompletedAccount == false) {
                            return const Text('CONCLUA O CADASTRO');
                          }
                        }

                        return const Text('VAMOS LÁ');
                      },
                    ),
                    onPressed: onTapLetsGo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentAccountController =
        Provider.of<CurrentAccountController>(context);
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Observer(
              builder: (_) {
                if (currentAccountController.state == PageState.loading) {
                  return loadingWidget();
                }

                return listWidget();
              },
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Observer(
                builder: (_) {
                  final isLogged =
                      currentAccountController.currentAccount != null;
                  return AppBarWidget(
                    isLogged: isLogged,
                    onTapPrivacy: onTapPrivacy,
                    onTapLogin: onTapLogin,
                    onTapExit: () => onTapExit(currentAccountController),
                    onTapQuestions: onTapQuestions,
                    onTapHelp: onTapHelp,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

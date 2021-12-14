import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/help/help_page.dart';
import 'package:flutter_netflix/app/screens/introduction/introduction_page.dart';
import 'package:flutter_netflix/app/screens/login/login_page.dart';
import 'package:flutter_netflix/app/screens/register/components/app_bar_widget.dart';
import 'package:flutter_netflix/app/screens/register/controllers/create_account_controller.dart';
import 'package:flutter_netflix/app/screens/register/controllers/credit_card_controller.dart';
import 'package:flutter_netflix/app/screens/register/controllers/plan_controller.dart';
import 'package:flutter_netflix/app/screens/register/controllers/register_controller.dart';
import 'package:flutter_netflix/app/screens/register/pages/page_choice_plan.dart';
import 'package:flutter_netflix/app/screens/register/pages/page_create_account.dart';
import 'package:flutter_netflix/app/screens/register/pages/page_credit_card.dart';
import 'package:flutter_netflix/app/screens/register/pages/page_info_payment.dart';
import 'package:flutter_netflix/app/screens/register/pages/page_info_plan.dart';
import 'package:flutter_netflix/app/screens/register/pages/page_setup_account.dart';
import 'package:flutter_netflix/app/shared/animations/page/slide_left_route.dart';
import 'package:flutter_netflix/app/shared/controllers/State/page_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late PageController pageController = PageController(initialPage: 0);
  late int minPage = 0;

  final planController = PlanController();
  final accountController = CreateAccountController();
  final creditController = CreditCardController();

  @override
  void initState() {
    super.initState();

    planController.getPlans();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final currentAccount =
          context.read<CurrentAccountController>().currentAccount;
      if (currentAccount == null) {
        return;
      }

      if (currentAccount.plan == null) {
        minPage = 2;
      } else if (currentAccount.payment == null) {
        minPage = 4;
      }

      pageController = PageController(initialPage: minPage);
    });
  }

  Widget appBar(CurrentAccountController currentAccountController) {
    return Observer(
      builder: (_) {
        final isLogged = currentAccountController.currentAccount != null;
        return AppBarWidget(
          isLogged: isLogged,
          onTapEnter: () async {
            final result = await Navigator.of(context).push(
              SlideLeftRoute(widget: const LoginPage()),
            );

            if (result != true) return;
            minPage = 2;
            onTapContinue(minPage);
          },
          onTapHelp: () => Navigator.of(context).push(
            SlideLeftRoute(widget: const HelpPage()),
          ),
          onTapExit: () {
            currentAccountController.exit();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('SESSÃO ENCERRADA')),
            );
            Navigator.of(context).pushReplacement(
              SlideLeftRoute(widget: const IntroductionPage()),
            );
          },
        );
      },
    );
  }

  void onTapContinue(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentAccount = Provider.of<CurrentAccountController>(context);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (pageController.page != minPage) {
            int previousPage = pageController.page!.toInt() - 1;
            onTapContinue(previousPage);
            return false;
          }

          return true;
        },
        child: Scaffold(
          body: Column(
            children: [
              appBar(currentAccount),
              Observer(
                builder: (_) {
                  final pageState = planController.pageState;
                  if (pageState == PageState.loading) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        PageSetupAccount(
                          onTapContinue: () => onTapContinue(1),
                        ),
                        PageCreateAccount(
                          accountController,
                          currentAccount,
                          onTapContinue: () {
                            minPage = 2;
                            onTapContinue(2);
                          },
                        ),
                        PageInfoPlan(
                          onTapContinue: () => onTapContinue(3),
                        ),
                        PageChoicePlan(
                          planController,
                          currentAccount,
                          onTapContinue: () {
                            minPage = 4;
                            onTapContinue(4);
                          },
                        ),
                        PageInfoPayment(
                          onTapCreditCard: () => onTapContinue(5),
                        ),
                        PageCreditCard(
                          creditController,
                          planController,
                          currentAccount,
                          onTapChangePlan: () async => onTapContinue(6),
                          onTapStartSignature: () {
                            // TODO: Finish
                          },
                        ),
                        PageChoicePlan(
                          planController,
                          currentAccount,
                          onTapContinue: () => onTapContinue(5),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  final controller = RegisterController();
}

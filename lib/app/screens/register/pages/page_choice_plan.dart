import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_netflix/app/screens/register/components/check_text_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/option_widget.dart';
import 'package:flutter_netflix/app/screens/register/components/slider_widget.dart';
import 'package:flutter_netflix/app/screens/register/controllers/plan_controller.dart';
import 'package:flutter_netflix/app/shared/const/colors.dart';
import 'package:flutter_netflix/app/shared/controllers/State/button_state.dart';
import 'package:flutter_netflix/app/shared/controllers/current_account_controller.dart';

class PageChoicePlan extends StatefulWidget {
  final PlanController controller;
  final CurrentAccountController currentAccount;
  final Function()? onTapContinue;
  const PageChoicePlan(
    this.controller,
    this.currentAccount, {
    Key? key,
    this.onTapContinue,
  }) : super(key: key);

  @override
  State<PageChoicePlan> createState() => _PageChoicePlanState();
}

class _PageChoicePlanState extends State<PageChoicePlan> {
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
          subtitle: 'PASSO 2 DE 3',
          title: 'Escolha o melhor plano para você',
          description: Column(
            children: [
              const CheckTextWidget(
                'Assista o quanto quiser. Sem anúncios.',
              ),
              const SizedBox(height: 8.0),
              const CheckTextWidget(
                'Recomendações especiais para você.',
              ),
              const SizedBox(height: 8.0),
              const CheckTextWidget(
                'Altere ou cancele seu plano quando quiser.',
              ),
              Observer(
                builder: (_) {
                  final plans = widget.controller.plans;
                  return Column(
                    children: [
                      OptionWidget(
                        options: plans.map((e) {
                          final index = plans.indexOf(e);
                          final isSelected =
                              widget.controller.selected == plans[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: GestureDetector(
                              onTap: () => widget.controller.changePlan(index),
                              child: Container(
                                width: double.infinity,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? backgroundElevatedButton
                                      : Colors.red[300],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Center(child: Text(e.title)),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16.0),
                      OptionWidget(
                        title: 'Preço/mês',
                        options: plans.map((e) {
                          final index = plans.indexOf(e);
                          final isSelected =
                              widget.controller.selected == plans[index];
                          return Text(
                            e.getPrice(),
                            style: TextStyle(
                              color: isSelected
                                  ? backgroundElevatedButton
                                  : Colors.grey[700],
                            ),
                          );
                        }).toList(),
                      ),
                      Divider(
                        color: Colors.grey[700],
                      ),
                      OptionWidget(
                        title: 'Qualidade de vídeo',
                        options: plans.map((e) {
                          final index = plans.indexOf(e);
                          final isSelected =
                              widget.controller.selected == plans[index];
                          return Text(
                            e.quality,
                            style: TextStyle(
                              color: isSelected
                                  ? backgroundElevatedButton
                                  : Colors.grey[700],
                            ),
                          );
                        }).toList(),
                      ),
                      Divider(
                        color: Colors.grey[700],
                      ),
                      OptionWidget(
                        title: 'Resolução',
                        options: plans.map((e) {
                          int index = plans.indexOf(e);
                          bool isSelected =
                              widget.controller.selected == plans[index];
                          return Text(
                            e.resolution,
                            style: TextStyle(
                              color: isSelected
                                  ? backgroundElevatedButton
                                  : Colors.grey[700],
                            ),
                          );
                        }).toList(),
                      ),
                      Divider(
                        color: Colors.grey[700],
                      ),
                      OptionWidget(
                        title:
                            'Assista no computador, TV, smartphone ou tablet',
                        options: plans.map((e) {
                          int index = plans.indexOf(e);
                          bool isSelected =
                              widget.controller.selected == plans[index];
                          return Icon(
                            Icons.check,
                            color: isSelected
                                ? backgroundElevatedButton
                                : Colors.grey[700],
                            size: 28,
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                'A disponibilidade das opções HD (720p), Full HD (1080p), Ultra HD (4K) e HDR está sujeita ao serviço de internet e à funcionalidade do aparelho. Nem todos os títulos estão disponíveis em HD, Full HD, Ultra HD ou HDR. Para obter mais detalhes, consulte os Termos de uso.'
                '\n\n'
                'Somente as pessoas que moram com você podem usar sua conta. Assista em 4 aparelhos ao mesmo tempo com o plano Premium, em 2 aparelhos com o plano Padrão e em 1 com o plano Básico.',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
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
                          : const Text('CONTINUAR'),
                      onPressed: isLoading
                          ? () {}
                          : () async {
                              final result = await widget.controller
                                  .updateUserPlan(widget.currentAccount);
                              if (!result) {
                                return;
                              }

                              widget.onTapContinue!();
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

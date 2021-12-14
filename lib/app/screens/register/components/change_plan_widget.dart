import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/shared/models/plan_model.dart';

class ChangePlanWidget extends StatelessWidget {
  final PlanModel plan;
  final Function()? onTap;
  const ChangePlanWidget(
    this.plan, {
    Key? key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 12,
        bottom: 12,
        right: 4.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${plan.getPrice()}/mês",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Plano ${plan.title}',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          TextButton(
            child: Text(
              'Alterar',
              style: TextStyle(
                color: Colors.blue[700],
              ),
            ),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}

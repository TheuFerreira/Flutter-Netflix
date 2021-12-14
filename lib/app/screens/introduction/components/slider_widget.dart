import 'package:flutter/material.dart';
import 'package:flutter_netflix/app/screens/introduction/model/slider_model.dart';

class SliderWidget extends StatelessWidget {
  final int index;
  const SliderWidget({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliderModel slider = sliders[index];
    return Stack(
      fit: StackFit.expand,
      children: [
        Visibility(
          child: Image.asset(
            'assets/images/img_catalog.jpg',
            height: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          visible: slider.imageURL == null,
        ),
        Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                      Color.fromARGB(210, 0, 0, 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  image: slider.imageURL == null
                      ? null
                      : DecorationImage(
                          image: AssetImage(slider.imageURL!),
                          fit: BoxFit.fitWidth,
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(210, 0, 0, 0),
                      Color.fromARGB(240, 0, 0, 0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56.0),
                      child: Text(
                        slider.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56.0),
                      child: Text(
                        slider.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

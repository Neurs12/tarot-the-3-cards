import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class HomePageUI extends StatefulWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

List<int> genRandom() {
  List<int> from = List.generate(22, (index) => index);
  return [
    (from..shuffle()).removeLast(),
    (from..shuffle()).removeLast(),
    (from..shuffle()).removeLast()
  ];
}

bool isSignedIn = false;
List<double> cards = [1, 1, 1];
List<double> reveal = [0, 0, 0];
List<int> rand = genRandom();
List<bool> reversed = [
  Random().nextDouble() > .9,
  Random().nextDouble() > .9,
  Random().nextDouble() > .9
];

class _HomePageUIState extends State<HomePageUI> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
        label: "Tarot - The 3 Cards",
        primaryColor: Theme.of(context).primaryColor.value,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StatefulBuilder(builder: (context, setStateWithin) {
      return SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(children: [
                const Text("Tarot - The 3 Cards",
                    style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
                const SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: () => setStateWithin(() => {
                            if (cards[0] == 0 && cards[1] == 0 && cards[2] == 0)
                              {
                                cards = [1, 1, 1],
                                reveal = [0, 0, 0],
                              }
                            else
                              {
                                cards = [0, 0, 0],
                                reveal = [1, 1, 1],
                              }
                          }),
                      child: Text(cards[0] == 0 && cards[1] == 0 && cards[2] == 0
                          ? "Úp tất cả"
                          : "Lật tất cả")),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () => setStateWithin(() => {
                            cards = [1, 1, 1],
                            reveal = [0, 0, 0],
                            Future.delayed(const Duration(milliseconds: 500)).then((value) => {
                                  rand = genRandom(),
                                  reversed = [
                                    Random().nextDouble() > .9,
                                    Random().nextDouble() > .9,
                                    Random().nextDouble() > .9
                                  ]
                                })
                          }),
                      child: const Text("Lấy lại"))
                ]),
                const SizedBox(height: 30),
                Center(
                    child: Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 30,
                        runSpacing: 30,
                        children: [
                      InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          splashFactory: NoSplash.splashFactory,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () => setStateWithin(() => {
                                if (cards[0] == 0) {cards[0] = 1} else {cards[0] = 0},
                                if (reveal[0] == 0) {reveal[0] = 1} else {reveal[0] = 0}
                              }),
                          child: Stack(children: [
                            RotatedBox(
                              quarterTurns: reversed[0] ? 2 : 0,
                              child: AnimatedOpacity(
                                opacity: reveal[0],
                                duration: const Duration(milliseconds: 500),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset("assets/${rand[0]}.jpg", width: 300)),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: cards[0],
                              duration: const Duration(milliseconds: 500),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset("assets/back_side.jpg", width: 300)),
                            )
                          ])),
                      InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          splashFactory: NoSplash.splashFactory,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () => setStateWithin(() => {
                                if (cards[1] == 0) {cards[1] = 1} else {cards[1] = 0},
                                if (reveal[1] == 0) {reveal[1] = 1} else {reveal[1] = 0}
                              }),
                          child: Stack(children: [
                            RotatedBox(
                                quarterTurns: reversed[1] ? 2 : 0,
                                child: AnimatedOpacity(
                                  opacity: reveal[1],
                                  duration: const Duration(milliseconds: 500),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset("assets/${rand[1]}.jpg", width: 300)),
                                )),
                            AnimatedOpacity(
                              opacity: cards[1],
                              duration: const Duration(milliseconds: 500),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset("assets/back_side.jpg", width: 300)),
                            )
                          ])),
                      InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          splashFactory: NoSplash.splashFactory,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () => setStateWithin(() => {
                                if (cards[2] == 0) {cards[2] = 1} else {cards[2] = 0},
                                if (reveal[2] == 0) {reveal[2] = 1} else {reveal[2] = 0}
                              }),
                          child: Stack(children: [
                            RotatedBox(
                                quarterTurns: reversed[2] ? 2 : 0,
                                child: AnimatedOpacity(
                                  opacity: reveal[2],
                                  duration: const Duration(milliseconds: 500),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset("assets/${rand[2]}.jpg", width: 300)),
                                )),
                            AnimatedOpacity(
                              opacity: cards[2],
                              duration: const Duration(milliseconds: 500),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset("assets/back_side.jpg", width: 300)),
                            )
                          ])),
                    ])),
              ])));
    }));
  }
}

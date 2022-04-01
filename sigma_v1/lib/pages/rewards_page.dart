import 'package:sigma_v1/main.dart';
import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(10, 20, 30, 1),
              Color.fromRGBO(36, 50, 66, 1),
              Color.fromRGBO(10, 20, 30, 1)
            ])),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: RawScrollbar(
            thumbColor: const Color.fromRGBO(129, 125, 234, 1),
            thickness: 8,
            radius: const Radius.circular(1),
            minThumbLength: 10.0,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.1851,
                  stretch: true,
                  floating: true,
                  onStretchTrigger: () async {
                    //'Load new data!'
                    // await Server.requestNewData();
                  },
                  backgroundColor: const Color.fromRGBO(129, 125, 234, 1),
                  flexibleSpace: const FlexibleSpaceBar(
                    stretchModes: <StretchMode>[
                      StretchMode.zoomBackground,
                      StretchMode.fadeTitle,
                      StretchMode.blurBackground,
                    ],
                    title: Text(
                      'Games as Rewards!',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                      ),
                    ),
                    background: DecoratedBox(
                      position: DecorationPosition.foreground,
                      child: FittedBox(
                        child: Image(
                          image: AssetImage('assets/sl_night_bg.jpg'),
                        ),
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: <Color>[
                            Color.fromRGBO(129, 125, 234, 1),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const GameList(),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    height: MediaQuery.of(context).size.height * 1.5 * 0.1851,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(10, 20, 30, 1),
                        Color.fromRGBO(36, 50, 66, 1),
                        Color.fromRGBO(10, 20, 30, 1)
                      ],
                    )),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 100),
                      child: Icon(
                        Icons.sentiment_very_satisfied,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: MaterialColor(0x243242, sigmaNight),
        ),
      );
}

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final GameCard gameCard = Server.getGameCardByID(index);
          return Card(
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            color: gameCard.bg,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1851,
                    width: MediaQuery.of(context).size.height * 0.1851,
                    child: Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        DecoratedBox(
                            position: DecorationPosition.foreground,
                            decoration: const BoxDecoration(),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Image.network(
                                gameCard.imageId,
                                fit: BoxFit.fitHeight,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          gameCard.getCard(),
                          style: textTheme.headline4,
                          //overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                        const FittedBox(fit: BoxFit.contain),
                        Text(gameCard.description,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 10, 8),
                  child: Text(
                    '${gameCard.minCost} Points',
                    style: textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 4,
      ),
    );
  }
}

// --------------------------------------------
// Below this line are helper classes and data.

const Map<int, GameCard> _kDummyData = {
  0: GameCard(
    id: 0,
    imageId: ('assets/gameLogos/blockPongLogo.png'),
    title: "Block Pong",
    minCost: 10,
    description: 'Classic game of Pong!',
    bg: Color.fromRGBO(165, 166, 246, 1),
  ),
  1: GameCard(
    id: 1,
    imageId: ('assets/gameLogos/tribalLogo.png'),
    title: "Tribal Survivor",
    minCost: 15,
    description: 'Classic lane runner, with a twist.',
    bg: Color.fromRGBO(252, 221, 236, 1),
  ),
  2: GameCard(
    id: 2,
    imageId: ('assets/sl_night_bg.jpg'),
    title: "Space Shooter",
    minCost: 15,
    description: 'Destroy all enemy ships!',
    bg: Color.fromRGBO(153, 243, 195, 1),
  ),
  3: GameCard(
    id: 3,
    imageId: ('assets/sl_night_bg.jpg'),
    title: "Target Hunter",
    minCost: 20,
    description: 'How good is your aim? Test it here!',
    bg: Color.fromRGBO(241, 120, 182, 1),
  ),
};

class Server {
  static List<GameCard> getGameList() => _kDummyData.values.toList();
  static GameCard getGameCardByID(int id) {
    assert(id >= 0 && id <= 3);
    return _kDummyData[id]!;
  }
}

class GameCard {
  const GameCard({
    required this.id,
    required this.imageId,
    required this.title,
    required this.minCost,
    required this.description,
    required this.bg,
  });
  final int id;
  final String imageId;
  final String title;
  final int minCost;
  final String description;
  final Color bg;

  static const List<String> _games = <String>[
    'Block Pong',
    'Tribal Survivor',
    'Space Shooter',
    'Target Hunter',
  ];

  String getCard() {
    final int index = id >= 4 ? id - 4 : id;
    return _games[index];
  }

  Color getCardColor() => bg;
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}

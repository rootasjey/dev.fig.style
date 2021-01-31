import 'package:devfigstyle/components/desktop_app_bar.dart';
import 'package:devfigstyle/state/colors.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFabVisible = false;
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isFabVisible
          ? FloatingActionButton(
              foregroundColor: Colors.white,
              backgroundColor: stateColors.accent,
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(
                  0.0,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              },
            )
          : null,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotif) {
          // FAB visibility
          if (scrollNotif.metrics.pixels < 50 && isFabVisible) {
            setState(() {
              isFabVisible = false;
            });
          } else if (scrollNotif.metrics.pixels > 50 && !isFabVisible) {
            setState(() {
              isFabVisible = true;
            });
          }

          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            DesktopAppBar(
              padding: const EdgeInsets.only(left: 65.0),
              onTapIconHeader: () {
                _scrollController.animateTo(
                  0,
                  duration: 250.milliseconds,
                  curve: Curves.decelerate,
                );
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 80.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  body(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Text(
      "Quotes for developers",
      style: TextStyle(
        fontSize: 40.0,
      ),
    );
  }
}

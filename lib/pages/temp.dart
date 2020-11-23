import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

enum BottomNavigationDemoType {
  withLabels,
  withoutLabels,
}

class ScafTest extends StatefulWidget {
  const ScafTest({Key key, @required this.type}) : super(key: key);

  final BottomNavigationDemoType type;

  @override
  _ScafTestState createState() => _ScafTestState();
}

class _ScafTestState extends State<ScafTest> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.add_comment),
        label: 'Comments',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.calendar_today),
        label: 'Calender',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: 'Account',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.alarm_on),
        label: 'Alarm',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.camera_enhance),
        label: 'Camera',
      ),
    ];
    if (widget.type == BottomNavigationDemoType.withLabels) {
      bottomNavigationBarItems = bottomNavigationBarItems.sublist(
          0, bottomNavigationBarItems.length - 2);
      _currentIndex =
          _currentIndex.clamp(0, bottomNavigationBarItems.length - 1).toInt();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Scaffold Test'),
        ),
        body: Center(
          child: PageTransitionSwitcher(
            child: _NavigationDestinationView(
              // Adding [UniqueKey] to make sure the widget rebuilds when transitioning.
              key: UniqueKey(),
              item: bottomNavigationBarItems[_currentIndex],
            ),
            transitionBuilder: (child, animation, secondaryAnimation) {
              return FadeThroughTransition(
                child: child,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels:
              widget.type == BottomNavigationDemoType.withLabels,
          items: bottomNavigationBarItems,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: textTheme.caption.fontSize,
          unselectedFontSize: textTheme.caption.fontSize,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: colorScheme.onPrimary,
          unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
          backgroundColor: colorScheme.primary,
        ),
      ),
    );
  }
}

class _NavigationDestinationView extends StatelessWidget {
  _NavigationDestinationView({Key key, this.item}) : super(key: key);

  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExcludeSemantics(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/ga1.jpg',
                ),
              ),
            ),
          ),
        ),
        Center(
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.white,
              size: 80,
            ),
            child: Semantics(
              // ignore: deprecated_member_use
              label: item.label,
              child: item.icon,
            ),
          ),
        ),
      ],
    );
  }
}

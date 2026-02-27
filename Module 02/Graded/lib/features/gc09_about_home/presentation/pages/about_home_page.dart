import 'package:flutter/material.dart';

/// GC 09: About and Home screens; dedicated routing; About Scaffold/AppBar color set from Home.
class AboutHomePage extends StatefulWidget {
  const AboutHomePage({super.key});

  @override
  State<AboutHomePage> createState() => _AboutHomePageState();
}

class _AboutHomePageState extends State<AboutHomePage> {
  Color _aboutBackgroundColor = Colors.grey.shade200;
  Color _aboutAppBarColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: _AboutHomeRoutes.home,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case _AboutHomeRoutes.home:
            return MaterialPageRoute(
              builder: (context) => _HomeScreen(
                aboutBackgroundColor: _aboutBackgroundColor,
                aboutAppBarColor: _aboutAppBarColor,
                onColorsChanged: (bg, appBar) {
                  setState(() {
                    _aboutBackgroundColor = bg;
                    _aboutAppBarColor = appBar;
                  });
                },
              ),
            );
          case _AboutHomeRoutes.about:
            return MaterialPageRoute(
              builder: (context) => _AboutScreen(
                backgroundColor: _aboutBackgroundColor,
                appBarColor: _aboutAppBarColor,
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}

abstract class _AboutHomeRoutes {
  static const String home = '/home';
  static const String about = '/about';
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({
    required this.aboutBackgroundColor,
    required this.aboutAppBarColor,
    required this.onColorsChanged,
  });

  final Color aboutBackgroundColor;
  final Color aboutAppBarColor;
  final void Function(Color bg, Color appBar) onColorsChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, _AboutHomeRoutes.about),
              child: const Text('Go to About'),
            ),
            const SizedBox(height: 24),
            const Text('Set About screen colors:'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => onColorsChanged(Colors.amber.shade100, Colors.amber),
                  child: const Text('Amber'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => onColorsChanged(Colors.green.shade100, Colors.green),
                  child: const Text('Green'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => onColorsChanged(Colors.purple.shade100, Colors.purple),
                  child: const Text('Purple'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutScreen extends StatelessWidget {
  const _AboutScreen({required this.backgroundColor, required this.appBarColor});

  final Color backgroundColor;
  final Color appBarColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: appBarColor,
      ),
      body: const Center(child: Text('About screen – Scaffold and AppBar colors set from Home.')),
    );
  }
}

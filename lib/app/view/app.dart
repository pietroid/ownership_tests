import 'package:flutter/material.dart';
import 'package:workflow_lab/counter/counter.dart';
import 'package:workflow_lab/l10n/l10n.dart';

// The hotfix goes here
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}

// Change 1.
// Change 2.
// Change 3.
// Change 4.1
// New changes
// hotfix
// adding more change
// adding more change yet
// one more change
// adding hotfix

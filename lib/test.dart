import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import 'components/eternal_mode_sheet.dart';
import 'components/eternal_segment_tab.dart';

class ImperativeModalSheetExample extends StatelessWidget {
  const ImperativeModalSheetExample();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _ExampleHome(),
    );
  }
}

class _ExampleHome extends StatelessWidget {
  const _ExampleHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showModalSheet(context),
          child: const Text('Show Modal Sheet'),
        ),
      ),
    );
  }
}

void _showModalSheet(BuildContext context) {
  // Use ModalSheetRoute to show a modal sheet with imperative Navigator API.
  // It works with any *Sheet provided by this package!
  final modalRoute = ModalSheetRoute(
    builder: (context) => const _ExampleSheet(),
  );

  Navigator.push(context, modalRoute);
}

class _ExampleSheet extends StatelessWidget {
  const _ExampleSheet();

  @override
  Widget build(BuildContext context) {
    // Wrap your sheet with a SheetDismissible to make it
    // dismissible by dragging it down.
    return SheetDismissible(
      // This callback is called when the user tries to dismiss the sheet
      // by dragging it down. Return true to dismiss the sheet immediately,
      // or false otherwise. This is useful when, for example, you want to
      // show a confirmation dialog before dismissing the sheet.
      onDismiss: () {
        showConfirmDialog(context);
        return false;
      },
      child: DraggableSheet(
        child: Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const SizedBox(
            height: 500,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  void showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}

class ModeSheetTest extends StatefulWidget {
  const ModeSheetTest({super.key});

  @override
  State<ModeSheetTest> createState() => _ModeSheetTestState();
}

class _ModeSheetTestState extends State<ModeSheetTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final modalRoute = ModalSheetRoute(
              builder: (context) => EternalModeSheet(content: FlutterLogo(),),
            );
            Navigator.push(context, modalRoute);
          },
          child: const Text('Show Modal Sheet'),
        ),
      ),
    );
  }
}

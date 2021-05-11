library fl_flash;

import 'package:flutter/material.dart';

class Flash {
  Flash(
      {this.backgroundColor,
      required this.mainText,
      this.icon,
      this.bottomText});

  final Color? backgroundColor;
  final Text mainText;
  final Widget? bottomText;
  final Icon? icon;
}

class FlashStorage {
  List<Flash> flashes = [];
}

var flashStorage = FlashStorage();

class MaterialFlashOne extends StatelessWidget {
  MaterialFlashOne({required this.flash});

  final Flash flash;

  @override
  Widget build(BuildContext context) {
    if (flash.icon == null) {
      return Card(
          color: flash.backgroundColor,
          child: Column(children: [
            Container(height: 5),
            flash.mainText,
          ]));
    } else {
      return Card(
          color: flash.backgroundColor,
          child: Column(children: [
            Container(height: 5),
            Row(children: [
              flash.icon!,
              Container(width: 10),
              flash.mainText,
            ])
          ]));
    }
  }
}

class FlashManager {
  static void add(Flash flash) {
    flashStorage.flashes.add(flash);
  }

  static void remove(Flash flash) {
    flashStorage.flashes.remove(flash);
  }

  static void removeAt(int index) {
    flashStorage.flashes.removeAt(index);
  }

  static List<Flash> get() {
    return flashStorage.flashes;
  }

  static void removeAll() {
    flashStorage.flashes.clear();
  }
}

class MaterialFlash extends StatelessWidget {
  MaterialFlash({this.limit, this.deleteAll = true});

  final int? limit;
  final bool deleteAll;

  @override
  Widget build(BuildContext context) {
    List<Widget> flashes = [];
    if (limit != null) {
      for (int i = 0; i < limit!; i++) {
        try {
          flashes.add(MaterialFlashOne(flash: FlashManager.get()[i]));
        } catch (e) {
          continue;
        }
      }
    } else {
      for (Flash flash in FlashManager.get()) {
        Widget flash2 = MaterialFlashOne(flash: flash);
        flashes.add(flash2);
      }
    }
    if (deleteAll) {
      FlashManager.removeAll();
    }
    return Column(children: flashes);
  }
}

library triggerable_textfield;

import 'dart:core';

import 'package:flutter/material.dart';

class TriggerableTextField extends StatefulWidget {
  TriggerableTextField({
    Key key,
    String text: "",
    decoration: const InputDecoration(),
    style,
    textAlign: TextAlign.start,
    maxLines: 1,
    maxLength,
    maxLengthEnforced: true,
  }) : super(key: key);

  final _TriggerableTextField state = _TriggerableTextField();

  @override
  _TriggerableTextField createState() {
    return state;
  }

  void trigger({int keycode, bool shift: false}) =>
      state.trigger(keycode: keycode, shift: shift);
}

class _TriggerableTextField extends State<TriggerableTextField> {
  String text;

  _TriggerableTextField({this.text: ""});

  var cursorPosition = 0;
  Map<int, String> normalKeyCodeMap = const <int, String>{
    7: "0",
    8: "1",
    9: "2",
    10: "3",
    11: "4",
    12: "5",
    13: "6",
    14: "7",
    15: "8",
    16: "9",
    17: "*",
    18: "#",
    29: "a",
    30: "b",
    31: "c",
    32: "d",
    33: "e",
    34: "f",
    35: "g",
    36: "h",
    37: "i",
    38: "j",
    39: "k",
    40: "l",
    41: "m",
    42: "n",
    43: "o",
    44: "p",
    45: "q",
    46: "r",
    47: "s",
    48: "t",
    49: "u",
    50: "v",
    51: "w",
    52: "x",
    53: "y",
    54: "z",
    55: ",",
    56: ".",
    61: "\t",
    62: " ",
    66: "\n",
    68: "`",
    69: "-",
    70: "=",
    71: "[",
    72: "]",
    73: "\\",
    74: ";",
    75: "'",
    76: "/",
    77: "@",
    81: "+",
  };
  Map<int, String> shiftKeyCodeMap = const <int, String>{
    7: ")",
    8: "!",
    9: "@",
    10: "#",
    11: '\$',
    12: "%",
    13: "^",
    14: "&",
    15: "*",
    16: "(",
    17: "*",
    18: "#",
    29: "A",
    30: "B",
    31: "C",
    32: "D",
    33: "E",
    34: "F",
    35: "G",
    36: "H",
    37: "I",
    38: "J",
    39: "K",
    40: "L",
    41: "M",
    42: "N",
    43: "O",
    44: "P",
    45: "Q",
    46: "R",
    47: "S",
    48: "T",
    49: "U",
    50: "V",
    51: "W",
    52: "X",
    53: "Y",
    54: "Z",
    55: "<",
    56: ">",
    61: "\t",
    62: " ",
    66: "\n",
    68: "~",
    69: "_",
    70: "+",
    71: "{",
    72: "}",
    73: "|",
    74: ":",
    75: "\"",
    76: "?",
    77: "@",
    81: "+",
  };

  void trigger({int keycode, bool shift}) {
    // if keycode a character
    // else if keycode an action (delete or move cursor)

    if (keycode == 21) {
      //left
      if (cursorPosition > 0) {
        cursorPosition--;
      } else {
        cursorPosition = 0;
      }
      return;
    } else if (keycode == 22) {
      //right
      if (cursorPosition < text.length) {
        cursorPosition++;
      }
      return;
    } else if (keycode == 67) {
      // del
      if (cursorPosition > 0) {
        setState(() {
          text = text.replaceRange(cursorPosition - 1, cursorPosition, "");
        });

        cursorPosition--;
      }
      return;
    }

    String ch;
    if (shift) {
      ch = shiftKeyCodeMap[keycode];
    } else {
      ch = normalKeyCodeMap[keycode];
    }

    if (ch != null) {
      // character
      setState(() {
        if (text.length > cursorPosition) {
          // in the middle or first
          text = text.substring(0, cursorPosition) +
              ch +
              text.substring(cursorPosition);
        } else {
          // at the end
          text += ch;
        }
      });

      cursorPosition++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

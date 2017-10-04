# qml-keyboard

LGPL licensed pure QML (QtQuick 2.0) virtual keyboard using android-like xml models for layouts.

## Properties and signals
Following are the main properties of this component:

* width
* height
* rows
* columns (max number of keys per row)
* source (initial xml source file)
* target (text field updated by key events)
* backgroundColor
* keyColor
* keyPressedColor
* keyBounds
* mainFontFamily
* mainFontColor
* mainFontSize
* secondaryFontFamily
* secondaryFontColor
* secondaryFontSize
* secondaryLabelsVisible (default: false)
* allUpperCase

Three signals are emitted by the component:

* keyClicked(string key)
* switchSource(string source)
* enterClicked()

## Keyboards
This element is provided with a given set of xml keyboard layouts:

* keyboard_one.xml (default): single language generic alphabetic keyboard
  - keyboard_one_num.xml: single language numeric keyboard
  - keyboard_one_sym.xml: single language symbols keyboard

* keyboard_numeric.xml: simple one line numeric keyboard

* keyboard_us.xml: English keyboard
* keyboard_ru.xml: Russian keyboard

Choose the one you need or create your own layout, it's really a piece of cake!

## Task list
- [ ] Add language choice button (choose between a list of languages)
- [ ] Check icon usage
- [ ] Auto resize of key labels
- [ ] Add languages to the list

## Screenshots
![alt tag](https://raw.githubusercontent.com/marcopellin/qml-keyboard/master/keyboard_one.png)

### Acknowledgments
Thanks to Mishka Rogachev for the original work.

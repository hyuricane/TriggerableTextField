# triggerable_textfield

Text view that emulate text field with trigger function to emulate key trigger.

## Getting Started

To include in your project
```
triggerable_textfield:
    git: git://github.com/hyuricane/TriggerableTextField.git
```

Import in your dart code. 
```
import 'package:triggerable_textfield/triggerable_textfield.dart';

...

    TriggerableTextField textField = TriggerableTextField();

...

    textField.trigger(keycode: 29, shift: true) // A
    textField.trigger(keycode: 29, shift: false) // a
    textField.trigger(keycode: 7) // 0

```
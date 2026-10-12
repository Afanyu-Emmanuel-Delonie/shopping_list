# Shopping List

| | |
|---|---|
| **Name** | Afanyu Emmanuel |
| **Student ID** | 26841 |
| **Course** | Mobile Programming, Week 2, Session 3: Your First Flutter App |

A small Flutter shopping list app. You type an item and add it, tap it when it's bought, delete it, and clear everything you've bought.
Brand colours: **black and white**.

## Features

- Starts with Milk, Bread and Rice. The title shows how many items are left, e.g. `Shopping List (3 left)`
- Type an item and tap **Add**, or press Enter. The field then empties
- An empty field is refused with *Type an item first*. A duplicate is refused with *Milk is already on the list*
- The bin icon deletes only that row and shows *Bread removed*
- Tapping an item crosses it out and changes its icon to a tick. Tapping it again undoes it
- The top bar button removes every bought item at once
- An empty list shows *Your list is empty*

## Project structure

```
lib/
├─ main.dart                 starts the app
├─ app.dart                  ShoppingApp: theme + first screen
├─ theme/app_theme.dart      brand colours (black and white)
├─ models/item.dart          Item model: name + bought status
└─ screens/home_screen.dart  HomeScreen: the list, its data and rules
```

## How to run

1. Open the project in Android Studio.
2. Start an emulator in Device Manager, or connect an Android phone.
3. Press **Run ▶**, or run:

```
flutter run
```

## Think

**1. Close the app completely and run it again. What happened to your list? Why?**

The list goes back to Milk, Bread and Rice. It lives only in the app's memory, in the `items` variable inside `_HomeScreenState`, and that memory is wiped when the app closes. To survive a restart, the list has to be saved outside the app's memory: on the device (for example with `shared_preferences`, SQLite or Hive) or online (for example in Firebase).

**2. What happens from tapping Add to the new row appearing on screen?**

1. Flutter detects the tap on the `FilledButton` and calls the function it was given, `onPressed: addItem`.
2. `addItem` reads the typed text with `controller.text` and removes extra spaces with `trim()`.
3. If the text is empty, it shows a SnackBar and returns early, so nothing is added.
4. If the item is already on the list, it shows a SnackBar and returns early.
5. Otherwise, `setState` runs `items.add(Item(text))`. The data changes and Flutter is told to redraw.
6. `controller.clear()` empties the text field.
7. Flutter calls `build` again. The title recounts the items left, and `ListView.builder` has one more row, so `itemBuilder` builds a `ListTile` for the new item at the bottom of the list.
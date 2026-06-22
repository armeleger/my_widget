# International Phone Number Input

A phone number input that combines a country dial-code dropdown with a text field for the number.

## What it does
Picking a country from the dropdown changes the displayed +code
Typing in the field builds the full international number live underneath
It's built with DropdownButton and TextField, and setState keeps the preview in sync

When you choose a country, the dialing code updates, and as you type your number the full phone number appears below in real time.

## How to run
1. Make sure Flutter is installed (`flutter --version`)
2. Clone this repo: `git clone https://github.com/armeleger/my_widget.git`
3. Run: `flutter pub get`
4. Launch: `flutter run`

## The three attributes I demonstrate
isExpanded (default false): controls whether the dropdown fills the full width; set to true to stretch it. Useful for clean form layouts.

dropdownColor (default light theme color): sets the background color of the open menu. Used to match the app's theme.

iconSize (default 24): changes the size of the dropdown arrow. Bumped up for visibility/accessibility.



## Screenshot
screenshots/demo.png
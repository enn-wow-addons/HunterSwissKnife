# HunterSwissKnife v1.1

HunterSwissKnife is an addon for World of Warcraft 1.12.1.
It provides hunters with a set of useful things, such as:

- **Aspects override**
  - The aspects are not canceled when double pressed.
- **Antidaze**
  - `Aspect of the Cheetah` is canceled if the player is dazed.
  - `Aspect of the Pack` is canceled if the player or party/raid members are dazed.
- **Aimed Shot castbar**
  - Shows a castbar for `Aimed Shot`.
- **Auto Shot castbar**
  - Shows a castbar for `Auto Shot`. It is split into two phases: aiming (yellow) and reloading (red).
- **Auto Shot override**
  - `Auto Shot` is not canceled when double pressed.
  - `Auto Shot` starts attacking with a ranged weapon if used in ranged distance.
  - `Auto Shot` starts attacking with a melee weapon if used in melee distance.
- **Call Pet override**
  - `Call Pet` calls a pet if the pet is not summoned.
  - `Call Pet` commands the pet to attack the player's target if the player's and pet's targets are different.
  - `Call Pet` commnads the pet to follow the player if the player's and pet's targets are the same.

All changes are optional and can be switched off in configuration menu `/hsk`

## Installation

1. Download **[The Latest Version](https://github.com/anstellaire/HunterSwissKnife/archive/master.zip)**
2. Unpack the Zip file
3. Rename the folder `HunterSwissKnife-master` to `HunterSwissKnife`
4. Copy the folder `HunterSwissKnife` into `YOURWOWDIRECTORY\Interface\AddOns`
5. Restart WoW

#### NB: ruRU Locale (Заметка для использующих русификатор для клиента)
Если ваш русификатор оставляет названия спеллов на английском языке, пожалуйста, удалите файл `ruRU.lua` в папке `Locale`.

## Commands

`/hsk` or `/hunterswissknife` - open the configuration menu.

## FAQ
**How can I report a bug?**
Report errors and issues [here](https://github.com/anstellaire/HunterSwissKnife/issues) with `bug` or `issue` label.
If there is an error message, make sure to have the latest version installed.
If the error message is still there, please provide the folowing information:
- screenshot of the error message (if any);
- when and where did you get the error;
- what did you do at that time.

Or any other information to help reproduce the issue.

**Can I contribute?**
Report feature requests [here](https://github.com/anstellaire/HunterSwissKnife/issues) with `feature` label.

## Screenshots

Menu

<img src="https://raw.githubusercontent.com/anstellaire/HunterSwissKnife/screenshots/Screenshots/menu.jpg">

Auto Shot tracker (aiming bar is on the left, reload bar is on the right)

<img src="https://raw.githubusercontent.com/anstellaire/HunterSwissKnife/screenshots/Screenshots/autoshot-2.jpg" align="right" width="48.87%">
<img src="https://raw.githubusercontent.com/anstellaire/HunterSwissKnife/screenshots/Screenshots/autoshot-1.jpg" width="48.87%">

# EDOPro Edison Format Pre-Errata Fixes

This repository provides a small set of custom files for **EDOPro / Project Ignis** to improve support for selected **Edison Format pre-errata interactions**.

This project was originally forked from **Geekoryuiai**, who provided the initial **Armory Arm (Pre-Errata)** implementation for Edison Format. This fork keeps that contribution and adds a new **Treeborn Frog (Pre-Errata)** implementation(more cards will be added in near future).

## Included fixes

### Armory Arm (Pre-Errata)

Adds a custom pre-errata version of **Armory Arm** for Edison Format.

This version is intended to preserve the historical Edison behavior, including the interaction with **Colossal Fighter**.

### Treeborn Frog (Pre-Errata)

Adds a custom pre-errata version of **Treeborn Frog**.

In Edison Format, **Treeborn Frog does not have a once-per-turn restriction**. During the same Standby Phase, if Treeborn Frog returns to the Graveyard and its activation conditions are still met, it may activate again.

This is relevant for interactions such as:

- Treeborn Frog being negated by **Royal Oppression**
- Treeborn Frog being tributed during the Standby Phase
- Treeborn Frog being destroyed after being Special Summoned during standby phase

## Custom card IDs

```text
29071342 - Armory Arm (Pre-Errata)
12538375 - Treeborn Frog (Pre-Errata)
```

## Files

This repository include files such as:

```text
cards-unofficial.cdb
script/c29071342.lua
script/c12538375.lua
lflists/2010.03 Edison.lflist.conf
12538375.jpg
29071342.jpg
```

## Installation

Copy the provided files into your **Project Ignis / EDOPro** folder.

Typical paths:

```text
cards-unofficial.cdb  ->  ProjectIgnis/expansions/cards-unofficial.cdb
.lua scripts          ->  ProjectIgnis/expansions/script/
.lflist.conf          ->  ProjectIgnis/lflists/
card images           ->  ProjectIgnis/pics/
```

After copying the files, restart EDOPro.

In the deck editor, search for:

```text
Armory Arm (Pre-Errata)
Treeborn Frog (Pre-Errata)
```

or by their custom IDs:

```text
29071342
12538375
```

## Important notes

These files are intended for **Edison Format testing and casual play**.

All players in an online duel should use the same custom files. If only one player has the custom scripts or database entries, the duel may not load correctly or may behave inconsistently.

This project does not claim official support from Project Ignis or EDOPro.

These files were tested on version 41.0.2 "Bagooska" of EDOPro.

It's very likely that when you update EDOPro you will have to add those files again, so keep them.

Right now i keeped both of the versions, the modern and the errata of the cards, while more test are made with the errata versions, if you wanna duel random players you will probably need to use the non-errata version of the cards.



## Current status

- Armory Arm (Pre-Errata): added
- Treeborn Frog (Pre-Errata): added and tested locally
- Edison banlist adjustments: included
- Additional Edison pre-errata fixes may be added later

## Credits

Original **Armory Arm (Pre-Errata)** implementation by **Geekoryuiai**.
Original **Treeborn Frog (Pre-Errata)**  implementation by **Marquezdan**.
This fork adds the **Treeborn Frog (Pre-Errata)** implementation and related Edison Format adjustments.

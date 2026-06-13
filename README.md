# Edison Pre-Errata Card Pack

This repository contains a custom EDOPro/ProjectIgnis card pack focused on Edison-format pre-errata cards and Time Wizard testing.

The goal is to provide playable versions of selected cards as they worked during the Edison era, using custom card IDs, scripts, images, and a compatible banlist.

## Current Cards

The current pack includes:

* **Treeborn Frog (Pre-Errata)**
  Custom ID: `12538375`

* **Armory Arm (Pre-Errata)**
  Custom ID: `29071342`

* **Lord British Space Fighter (Pre-Errata)**
  Custom ID: `90000003`

These cards are intended to preserve specific historical interactions that are not represented correctly by their modern official card versions.

## Repository Structure

```text
expansions/
└── cards-unofficial.cdb

script/
└── pre-errata/
    ├── c12538375.lua
    ├── c29071342.lua
    └── c90000003.lua

pics/
├── 12538375.jpg
├── 29071342.png
└── 90000003.jpg

lflists/
└── 2010.03 Edison.lflist.conf

server/
└── README.md
```

## Installation

Copy the following folders into your EDOPro/ProjectIgnis directory:

```text
expansions/
script/
pics/
lflists/
```

After copying the files, restart EDOPro/ProjectIgnis.

## Important Compatibility Notice

These custom cards will only work correctly when all players are using the same card pack.

This means the pack is intended for:

1. **Local play**, where every local client has the same files installed.
2. **Stardust Server**, once the server-side support is fully deployed and stable.

If a player does not have the same custom database, scripts, images, and banlist, the cards may appear incorrectly, fail to load, or behave differently.

## Stardust Server

The `server/` folder is reserved for future Stardust Server-related files and instructions.

For now, this repository is focused on the public EDOPro/ProjectIgnis client pack. Server configuration files such as `user_configs.json` will be added later, once the Stardust Server setup is stable enough for public use.

## Notes

This project is unofficial and intended for preservation, testing, and casual Time Wizard play.

It is not affiliated with Project Ignis, EDOPro, Konami, or any official Yu-Gi-Oh! product.

# Edison Pre-Errata Pack / Pacote Edison Pré-Errata

This README is available in English and Portuguese.
Este README está disponível em inglês e português.

---

# English

## Overview

This repository contains an unofficial EDOPro/ProjectIgnis card pack focused on Edison / Time Wizard gameplay with selected pre-errata cards and custom fixes.

The goal is to make it easier to play Edison-format games using specific historical card texts, including cards that behaved differently before later errata changes.

This pack is intended for use with:

* EDOPro / ProjectIgnis
* Stardust Server
* Local casual testing
* Edison / Time Wizard private games

## Contents

```text
expansions/
  cards-unofficial.cdb

script/
  pre-errata/
    custom card scripts

pics/
  custom card images

lflists/
  Edison banlist files

server/
  user_configs.json
  stardust-server-entry.json
  README.md
```

## Included Custom / Pre-Errata Cards

Current custom cards include:

* Treeborn Frog (Pre-Errata)
* Armory Arm (Pre-Errata)
* Lord British Space Fighter (Pre-Errata)

More cards and fixes may be added later.

## Installation

Close EDOPro/ProjectIgnis before copying the files.

Copy the files from this repository into your EDOPro/ProjectIgnis folder following this structure:

```text
expansions/cards-unofficial.cdb  ->  ProjectIgnis/expansions/cards-unofficial.cdb
script/pre-errata/*.lua          ->  ProjectIgnis/script/
pics/*                           ->  ProjectIgnis/pics/
lflists/*.conf                   ->  ProjectIgnis/lflists/
```

After copying the files, reopen EDOPro/ProjectIgnis.

## Server Configuration

The `server/` folder contains files to help you add the Stardust Server to EDOPro/ProjectIgnis.

There are two options:

### Option 1 - Full user_configs.json

Use this if you want the easiest setup.

Copy:

```text
server/user_configs.json
```

to your EDOPro/ProjectIgnis folder and replace your existing `user_configs.json`.

This file already includes:

* Evolution Server
* Stardust Server

Before replacing your file, it is recommended to make a backup of your current `user_configs.json`.

### Option 2 - Manual Server Entry

Use this if you do not want to replace your current config.

Open:

```text
server/stardust-server-entry.json
```

Copy the Stardust server entry and add it manually to the `servers` list inside your existing `user_configs.json`.

After editing `user_configs.json`, restart EDOPro/ProjectIgnis.

## Stardust Server

```json
{
  "name": "Stardust Server",
  "address": "163.176.36.241",
  "duelport": 7911,
  "roomaddress": "163.176.36.241",
  "roomlistprotocol": "http",
  "roomlistport": 7922
}
```

## Important Notes

Both players must have the same card pack installed to properly use the custom/pre-errata cards.

If a custom card is not working, check that:

* `cards-unofficial.cdb` is inside the `expansions/` folder
* The Lua scripts are inside the `script/` folder
* The card images are inside the `pics/` folder
* EDOPro/ProjectIgnis was restarted after copying the files

When creating a room, use:

```text
Allowed Cards: All
```

This helps avoid issues with custom or unofficial cards being rejected by the client.

## Disclaimer

This is an unofficial fan-made pack for casual play.
It is not affiliated with Konami, ProjectIgnis, EDOPro, or Evolution YGO.

---

# Português

## Visão Geral

Este repositório contém um pacote não oficial de cartas para EDOPro/ProjectIgnis focado em partidas Edison / Time Wizard com cartas pré-errata e correções customizadas.

A ideia é facilitar partidas no formato Edison usando textos históricos específicos de cartas que funcionavam de maneira diferente antes de erratas posteriores.

Este pacote é pensado para uso com:

* EDOPro / ProjectIgnis
* Stardust Server
* Testes locais casuais
* Partidas privadas Edison / Time Wizard

## Conteúdo

```text
expansions/
  cards-unofficial.cdb

script/
  pre-errata/
    scripts das cartas customizadas

pics/
  imagens das cartas customizadas

lflists/
  arquivos de banlist Edison

server/
  user_configs.json
  stardust-server-entry.json
  README.md
```

## Cartas Custom / Pré-Errata Incluídas

As cartas customizadas atuais incluem:

* Treeborn Frog (Pre-Errata)
* Armory Arm (Pre-Errata)
* Lord British Space Fighter (Pre-Errata)

Mais cartas e correções podem ser adicionadas futuramente.

## Instalação

Feche o EDOPro/ProjectIgnis antes de copiar os arquivos.

Copie os arquivos deste repositório para a pasta do seu EDOPro/ProjectIgnis seguindo esta estrutura:

```text
expansions/cards-unofficial.cdb  ->  ProjectIgnis/expansions/cards-unofficial.cdb
script/pre-errata/*.lua          ->  ProjectIgnis/script/
pics/*                           ->  ProjectIgnis/pics/
lflists/*.conf                   ->  ProjectIgnis/lflists/
```

Depois de copiar os arquivos, abra novamente o EDOPro/ProjectIgnis.

## Configuração do Servidor

A pasta `server/` contém arquivos para ajudar a adicionar o Stardust Server ao EDOPro/ProjectIgnis.

Existem duas opções:

### Opção 1 - user_configs.json completo

Use esta opção se quiser a configuração mais simples.

Copie:

```text
server/user_configs.json
```

para a pasta do seu EDOPro/ProjectIgnis e substitua o `user_configs.json` existente.

Esse arquivo já inclui:

* Evolution Server
* Stardust Server

Antes de substituir o arquivo, é recomendado fazer backup do seu `user_configs.json` atual.

### Opção 2 - Entrada manual do servidor

Use esta opção se você não quiser substituir sua configuração atual.

Abra:

```text
server/stardust-server-entry.json
```

Copie a entrada do servidor Stardust e adicione manualmente na lista `servers` do seu `user_configs.json` atual.

Depois de editar o `user_configs.json`, reinicie o EDOPro/ProjectIgnis.

## Stardust Server

```json
{
  "name": "Stardust Server",
  "address": "163.176.36.241",
  "duelport": 7911,
  "roomaddress": "163.176.36.241",
  "roomlistprotocol": "http",
  "roomlistport": 7922
}
```

## Observações Importantes

Os dois jogadores precisam ter o mesmo pacote instalado para usar corretamente as cartas customizadas/pré-errata.

Se uma carta customizada não funcionar, confira se:

* `cards-unofficial.cdb` está dentro da pasta `expansions/`
* Os scripts Lua estão dentro da pasta `script/`
* As imagens das cartas estão dentro da pasta `pics/`
* O EDOPro/ProjectIgnis foi reiniciado depois da cópia dos arquivos

Ao criar uma sala, use:

```text
Allowed Cards: All
```

Isso ajuda a evitar problemas com cartas customizadas ou não oficiais sendo rejeitadas pelo cliente.

## Aviso

Este é um pacote não oficial feito por fãs para partidas casuais.
Ele não é afiliado à Konami, ProjectIgnis, EDOPro ou Evolution YGO.

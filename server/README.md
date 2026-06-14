# Stardust Server Config / Configuração do Servidor Stardust

This README is available in English and Portuguese.
Este README está disponível em inglês e português.

---

# English

## Overview

This folder contains configuration files to add the Stardust Edison Server to EDOPro/ProjectIgnis.

The goal is to make the setup easier for players who do not want to manually edit JSON files.

## Files

```text
server/user_configs.json
server/stardust-server-entry.json
```

## Option 1 - Replace user_configs.json

This is the easiest option.

Copy:

```text
server/user_configs.json
```

to your EDOPro/ProjectIgnis folder and replace the existing `user_configs.json`.

This file already includes:

* Evolution Server
* Stardust Edison Server

Recommended steps:

```text
1. Close EDOPro/ProjectIgnis.
2. Go to your EDOPro/ProjectIgnis folder.
3. Make a backup of your current user_configs.json.
4. Copy server/user_configs.json from this repository.
5. Paste it into your EDOPro/ProjectIgnis folder.
6. Reopen EDOPro/ProjectIgnis.
7. Select Stardust Edison Server from the server list.
```

## Option 2 - Manual Entry

Use this option if you already have a customized `user_configs.json` and do not want to replace it.

Open:

```text
server/stardust-server-entry.json
```

Copy the Stardust server entry and add it to the `servers` list in your existing `user_configs.json`.

## Stardust Server Entry

```json
{
  "name": "Stardust Edison Server",
  "address": "163.176.36.241",
  "duelport": 7911,
  "roomaddress": "163.176.36.241",
  "roomlistprotocol": "http",
  "roomlistport": 7922
}
```

## Important

After changing `user_configs.json`, restart EDOPro/ProjectIgnis.

If the server does not appear, check that:

* The JSON file is valid
* The file name is exactly `user_configs.json`
* The file was placed in the correct EDOPro/ProjectIgnis folder
* EDOPro/ProjectIgnis was restarted

---

# Português

## Visão Geral

Esta pasta contém arquivos de configuração para adicionar o Stardust Edison Server ao EDOPro/ProjectIgnis.

A ideia é facilitar a instalação para jogadores que não querem editar arquivos JSON manualmente.

## Arquivos

```text
server/user_configs.json
server/stardust-server-entry.json
```

## Opção 1 - Substituir o user_configs.json

Esta é a opção mais simples.

Copie:

```text
server/user_configs.json
```

para a pasta do seu EDOPro/ProjectIgnis e substitua o `user_configs.json` existente.

Esse arquivo já inclui:

* Evolution Server
* Stardust Edison Server

Passo a passo recomendado:

```text
1. Feche o EDOPro/ProjectIgnis.
2. Vá até a pasta do seu EDOPro/ProjectIgnis.
3. Faça backup do seu user_configs.json atual.
4. Copie o server/user_configs.json deste repositório.
5. Cole ele na pasta do seu EDOPro/ProjectIgnis.
6. Abra novamente o EDOPro/ProjectIgnis.
7. Selecione Stardust Edison Server na lista de servidores.
```

## Opção 2 - Entrada Manual

Use esta opção se você já tem um `user_configs.json` personalizado e não quer substituir ele inteiro.

Abra:

```text
server/stardust-server-entry.json
```

Copie a entrada do servidor Stardust e adicione na lista `servers` do seu `user_configs.json` atual.

## Entrada do Stardust Server

```json
{
  "name": "Stardust Edison Server",
  "address": "163.176.36.241",
  "duelport": 7911,
  "roomaddress": "163.176.36.241",
  "roomlistprotocol": "http",
  "roomlistport": 7922
}
```

## Importante

Depois de alterar o `user_configs.json`, reinicie o EDOPro/ProjectIgnis.

Se o servidor não aparecer, confira se:

* O arquivo JSON está válido
* O nome do arquivo é exatamente `user_configs.json`
* O arquivo foi colocado na pasta correta do EDOPro/ProjectIgnis
* O EDOPro/ProjectIgnis foi reiniciado

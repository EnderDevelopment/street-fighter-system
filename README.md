# Street Fighter System

Enhance your FiveM server with a dynamic street fighting system.

## Features

- Free-roam fighting mechanics with attack, block, and dodge actions
- Player progression system with XP, levels, and skill points
- Admin panel for server management

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `start streetfightersystem` to your server.cfg
4. Run the SQL script to create the necessary database tables

## Usage

### Player Commands

- **Attack**: Press the attack key (default: E)
- **Block**: Press the block key (default: Q)
- **Dodge**: Press the dodge key (default: R)

### Admin Commands

- **Admin Panel**: `/adminpanel`

## Configuration

The script can be configured via the `config.lua` file. Key settings include:

- **Combat Settings**: Cooldown times, stamina costs, and damage values
- **Progression Settings**: XP per fight, skill points per level, and max level
- **Rank Settings**: Define ranks and their XP thresholds
- **Admin Panel Settings**: Enable/disable the admin panel and set the command

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=street-fighter-system&utm_content=bottom) — describe it in one sentence and get the full source code.
<div align="center">

# ⚡ MouliResult CLI (`mouli`)

### Vos résultats de moulinette Epitech en direct dans votre terminal.

[![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-informational?style=for-the-badge&logo=linux&logoColor=white)](https://github.com/foundhack/mouli)
[![Dependencies](https://img.shields.io/badge/Dependencies-Zero%20(Standard%20Lib)-success?style=for-the-badge)](https://github.com/foundhack/mouli)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

*Conçu pour les étudiants d'Epitech — Simple, ultra-rapide et sans dépendance externe.*

</div>

---

## 🚀 Installation rapide (1 ligne)

Ouvrez votre terminal et collez la commande suivante :

```bash
curl -fsSL https://raw.githubusercontent.com/foundhack/mouli/main/install.sh | bash
```

> **Note :** Si votre terminal ne trouve pas immédiatement la commande, rechargez votre shell :
> ```bash
> source ~/.bashrc   # ou source ~/.zshrc
> ```

---

## 🔑 Première utilisation : Connexion (Token MyEpitech)

Pour que l'outil puisse récupérer vos notes en toute sécurité, connectez votre compte avec votre **`refresh_token`** MyEpitech.

### Comment récupérer son `refresh_token` (en 30 secondes) :

1. Connectez-vous sur **[my.epitech.eu](https://my.epitech.eu)** avec votre compte étudiant Epitech.
2. Ouvrez les **Outils de développement** de votre navigateur :
   - Raccourci : touche **`F12`** ou **`Ctrl + Shift + I`** (Cmd + Option + I sur Mac).
3. Rendez-vous dans l'onglet **Application** (Chrome/Brave) ou **Stockage** (Firefox) :
   - Déroulez **Cookies** (ou **Stockage local**) → cliquez sur `https://my.epitech.eu`.
   - Repérez la clé nommée **`refresh_token`** et double-cliquez sur sa valeur pour la copier.
   *(Alternative : allez dans l'onglet **Réseau** / Network, rechargez la page, cliquez sur la requête `test-results` ou `refresh`, et copiez le token dans les en-têtes ou cookies).*
4. Dans votre terminal, lancez :
   ```bash
   mouli login
   ```
   et collez votre token lorsqu'il vous le demande !

✅ **C'est tout !** Vos identifiants sont sauvegardés localement et sécurisés.

---

## 🖥️ Fonctionnalités & Utilisation

```
usage: mouli [-h] [-w] [-l] [-n LIMIT] [--year YEAR] [--raw] [--login [LOGIN]] [query]
```

### 1. Afficher la dernière moulinette
Affiche le verdict complet du dernier projet testé avec la barre de progression, la note, les alertes de crashs, le statut de compilation, la norme de coding style et le détail par compétence :

```bash
mouli
```

```text
╭─────────────────────────────────────────────────────────────╮
│  MOULIRESULT • B-CPE-210-STUMPER6 (B-CPE-210/stumper6)
╰─────────────────────────────────────────────────────────────╯
  Date de passage  : 11/10/2026 à 11:20 (il y a 10 min)
  Dernier Commit   : a1b2c3d4
  Compilation      : ✓ Réussie
  Note Globale     : [████████████████████░░]  90.0% (18/20 tests)
  Coding Style     : 0 maj, 0 min, 0 info (Pénalité: 0)
  Prérequis        : 2/2

  Détails des compétences & tests :

  head - Part 01 (1/1)
    [✓ PASS ] head - Basic tests (no options, file in parameter and stdin)

  head - Part 02 (0/1)
    [✗ KO   ] head - Error handling
             ↳ KO: Test failed: invalid output.

  head - Part 03 (0/1)
    [✗ KO   ] head - Option -c/--bytes
             ↳ KO: Test failed: invalid exit status. Got 84.
```

---

### 2. Mode Surveillance en direct (`-w` / `--watch`)
**L'arme secrète pendant les examens et les stumpers !**  
L'outil écoute les serveurs MyEpitech en arrière-plan et émet un **bip sonore** dès qu'une nouvelle note tombe pour afficher instantanément le verdict complet :

```bash
mouli -w
```

---

### 3. Lister l'historique des notes (`-l` / `--list`)
Affiche sous forme de tableau vos dernières notes avec date, projet, pourcentage, crashs et hash du commit :

```bash
mouli -l
```

Pour afficher plus ou moins de résultats (ex: 20 résultats) :
```bash
mouli -l -n 20
```

---

### 4. Filtrer par projet
Recherche et affiche directement la note d'un projet précis :

```bash
mouli corewar
mouli pushswap
mouli stumper
```

---

### 5. Options avancées

| Commande | Description |
| :--- | :--- |
| `mouli update` | Met à jour MouliResult CLI vers la dernière version |
| `mouli login <token>` | Met à jour le `refresh_token` |
| `mouli --year 2025` | Change l'année académique ciblée |
| `mouli --raw` | Sort le JSON brut de l'API (pratique pour vos scripts ou `jq`) |
| `mouli --help` | Affiche l'aide détaillée |

---

## 🔒 Sécurité & Vie Privée

- **100% Local :** L'outil s'exécute uniquement sur votre machine. Aucun serveur intermédiaire ne stocke ni ne transmet vos données.
- **Stockage sécurisé :** Le token est sauvegardé dans `~/.config/mouli/config.json` avec des permissions Unix strictes (`chmod 600`, accessible uniquement par votre compte utilisateur).
- **Communication officielle :** Les requêtes partent directement de votre machine vers les endpoints officiels `https://my.epitech.eu/api/`.

---

## 🔄 Mise à jour & Désinstallation

### Mettre à jour `mouli`
Pour mettre à jour MouliResult CLI, lancez simplement :
```bash
mouli update
```
*(ou relancez la commande d'installation curl)*

### Désinstaller `mouli`
Pour supprimer le binaire et (optionnellement) sa configuration :
```bash
curl -fsSL https://raw.githubusercontent.com/foundhack/mouli/main/uninstall.sh | bash
```

---

## 👨‍💻 Auteur & Crédits

- Développé par **Chamss-dine AGBIZOUNON** ([@F0undhack](https://github.com/F0undhack)) — Projet **TekFlow**.
- Distribué sous licence [MIT](LICENSE).

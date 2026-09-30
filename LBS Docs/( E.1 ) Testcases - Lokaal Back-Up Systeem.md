# TC-01 — Opstarten en afsluiten van LBS

## TC-01-01 — Start programma omgeving op

| Veld              | Inhoud                                                                         |
| :---------------- | :----------------------------------------------------------------------------- |
| **Titel / ID**    | TC-01-01 — Start programma omgeving op                                         |
| **Scope**         | LBS omgeving opstarten via terminal                                            |
| **Preconditions** | Het programma LBS is geïnstalleerd en bereikbaar via de terminal.              |

**Stappen**
1. Open de terminal.
2. Typ `LBS` in en druk op enter.
3. Controleer de weergave in de terminal.

**Verwacht resultaat**
- De gebruiker wordt in de LBS omgeving geplaatst.
- Er verschijnt een welkomstbericht.

**Randgevallen / edge cases**
- **Argumenten meegeven:** Als de gebruiker `LBS -f backup` typt, start de omgeving niet op maar voert het programma direct het command uit.

---

## TC-01-02 — Sluit het programma af

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-01-02 — Sluit het programma af |
| **Scope** | Programma afsluiten (elegant of geforceerd) |
| **Preconditions** | LBS omgeving is actief. |

**Stappen**
1. Typ `exit` in wanneer er geen actieve taak bezig is.
2. Probeer `exit` te typen terwijl een taak bezig is.
3. Druk op `CTRL + C` tijdens een actieve taak.

**Verwacht resultaat**
- Het command `exit` sluit het programma pas af als de actieve taak klaar is.
- `CTRL + C` sluit het programma direct geforceerd af zonder de taak af te maken.

**Randgevallen / edge cases**
- **CTRL + C tijdens backup:** De actieve taak wordt direct gestopt en niet voltooid.

---

# TC-02 — Backupbestanden beheren

## TC-02-01 — Maakt een backupbestand aan

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-02-01 — Maakt een backupbestand aan |
| **Scope** | Nieuw backupbestand aanmaken (in en uit omgeving) |
| **Preconditions** | LBS is klaar voor gebruik. |

**Stappen**
1. Typ `new "backup2"` in de LBS omgeving.
2. Controleer of het bestand is aangemaakt.
3. Typ buiten de omgeving het command `LBS -n "backup2_extern"` in.
4. Probeer een backupbestand aan te maken met een al bestaande naam.

**Verwacht resultaat**
- Er wordt een nieuw backupbestand aangemaakt met de opgegeven naam.
- Dit werkt zowel in als buiten de LBS omgeving.
- Bij een al bestaande naam weigert het programma het command en toont het een bericht dat het niet succesvol is afgerond.

**Randgevallen / edge cases**
- **Dubbele naam:** Programma geeft een foutmelding en maakt niks aan.

---

## TC-02-02 — Backupbestand verwijderen

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-02-02 — Backupbestand verwijderen |
| **Scope** | Bestaand backupbestand verwijderen |
| **Preconditions** | Backupbestand `backup2` bestaat. |

**Stappen**
1. Typ `remove backup2` in de LBS omgeving.
2. Controleer of het bestand is verwijderd.
3. Typ buiten de omgeving `LBS -r backup2` om een bestand te verwijderen.
4. Probeer een niet bestaand backupbestand te verwijderen.

**Verwacht resultaat**
- Het opgegeven backupbestand wordt verwijderd.
- Als het bestand niet bestaat, toont het programma een bericht dat het gegeven bestand niet bestaat.

**Randgevallen / edge cases**
- **Niet bestaand bestand:** Programma toont een melding dat het bestand niet bestaat.

---

## TC-02-03 — Het pad van backupbestand ophalen

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-02-03 — Het pad van backupbestand ophalen |
| **Scope** | Bestandspad tonen van een backupbestand |
| **Preconditions** | Backupbestand `backup2` bestaat. |

**Stappen**
1. Typ `path backup2` in de LBS omgeving.
2. Typ buiten de omgeving `LBS -p backup2`.
3. Probeer het pad op te halen van een niet bestaand bestand of vraag meerdere bestanden tegelijk op.

**Verwacht resultaat**
- Het programma toont het juiste pad van het backupbestand (bijvoorbeeld `/usr/dev/documents/backup2`).
- Bij ongeldige of niet bestaande bestanden toont het programma een bericht dat het geen geldig bestand is.

**Randgevallen / edge cases**
- **Ongeldige invoer:** Melding dat het gegeven bestand niet een geldig bestand is.

---

# TC-03 — Inhoud van backupbestanden beheren

## TC-03-01 — Voegt een folder of bestand toe aan een backupbestand

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-03-01 — Voegt een folder/bestand toe |
| **Scope** | Paden toevoegen aan een backupbestand |
| **Preconditions** | Backupbestand `backup2` en te koppelen bestand/folder bestaan. |

**Stappen**
1. Typ `add backup2 /usr/dev/documents/file.txt` in de omgeving.
2. Typ buiten de omgeving `LBS -a Backup2 usr/dev/documents/file.txt`.
3. Probeer het pad van het LBS programma zelf toe te voegen.
4. Probeer een pad toe te voegen aan een niet bestaand backupbestand.

**Verwacht resultaat**
- Het bestand of de folder wordt toegevoegd aan het backupbestand.
- Het programma weigert het pad van het eigen programma toe te voegen of toe te voegen aan een niet bestaand backupbestand.

**Randgevallen / edge cases**
- **Pad van het programma zelf:** Actie wordt geweigerd.
- **Niet bestaand backupbestand:** Actie wordt geweigerd.

---

## TC-03-02 — Verwijderd bestand of folder uit backupbestand

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-03-02 — Verwijderd bestand/folder uit backupbestand |
| **Scope** | Paden verwijderen uit een backupbestand |
| **Preconditions** | Backupbestand `backup2` bevat het pad `/usr/dev/documents/file.txt`. |

**Stappen**
1. Typ `remove -f backup2 /usr/dev/documents/file.txt` in de omgeving.
2. Typ buiten de omgeving `LBS -rf backup2 /usr/dev/documents/file.txt`.
3. Probeer een bestand te verwijderen uit een ongeldig backupbestand.
4. Probeer een bestand/folder te verwijderen die niet in het backupbestand zit.

**Verwacht resultaat**
- Het opgegeven bestand of de folder wordt uit het backupbestand gehaald.
- Als het backupbestand ongeldig is of het pad zit er niet in, geeft het programma een melding.

**Randgevallen / edge cases**
- **Pad niet aanwezig:** Actie kan niet worden uitgevoerd.

---

## TC-03-03 — Haalt de inhoud van een backupbestand op

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-03-03 — Haalt de inhoud van een backupbestand op |
| **Scope** | Inhoud van een backupbestand inzien |
| **Preconditions** | Backupbestand `backup2` bestaat en bevat bestanden. |

**Stappen**
1. Typ `read backup2` in de LBS omgeving.
2. Controleer het overzicht van bestanden.
3. Probeer de inhoud van meerdere bestanden tegelijk op te halen.

**Verwacht resultaat**
- Het programma toont alle bestanden en folders die in het backupbestand staan.

**Randgevallen / edge cases**
- **Meerdere bestanden opvragen:** Niet toegestaan of geeft een melding.

---

# TC-04 — Back-ups en versiebeheer

## TC-04-01 — Maakt een back-up aan

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-04-01 — Maakt een back-up aan |
| **Scope** | Back-up uitvoeren |
| **Preconditions** | Backupbestand `backup2` bestaat met geldige paden. |

**Stappen**
1. Typ `backup backup2` in de omgeving.
2. Controleer de doelmap `/usr/dev/backups/backup2`.
3. Probeer een back-up uit te voeren met een niet bestaand backupbestand.

**Verwacht resultaat**
- De back-up van alle bestanden en folders wordt gemaakt en opgeslagen in `/usr/dev/backups/backup2`.
- Er wordt automatisch een versiebeheerbestand bijgewerkt met een nieuw versienummer.
- Bij een niet bestaand backupbestand wordt de actie geweigerd.

**Randgevallen / edge cases**
- **Ongeldig backupbestand:** Back-up wordt niet uitgevoerd.

---

## TC-04-02 — Haalt een back-up op

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-04-02 — Haalt een back-up op |
| **Scope** | Meest recente back-up terughalen/overschrijven |
| **Preconditions** | Er is eerder een back-up gemaakt voor `backup2`. |

**Stappen**
1. Typ `fetch backup2` in de LBS omgeving.
2. Controleer of de originele bestanden/folders zijn overschreven met de back-up.
3. Probeer een back-up op te halen die nog niet is gemaakt of niet bestaat.

**Verwacht resultaat**
- Alle bestanden uit de back-up overschrijven de originele locaties die in het backupbestand staan.
- Als er nog geen back-up is gemaakt, geeft het programma een foutmelding.

**Randgevallen / edge cases**
- **Nog geen back-up gemaakt:** Actie mislukt.

---

## TC-04-03 — Haalt oude back-up terug

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-04-03 — Haalt oude back-up terug |
| **Scope** | Oude versie van back-up herstellen op basis van ID |
| **Preconditions** | Backupbestand `backup2` heeft meerdere versies (bijvoorbeeld versie ID 2). |

**Stappen**
1. Typ `fetch -o backup2 2` in de omgeving.
2. Controleer of de bestanden zijn hersteld naar versie 2.
3. Probeer een versienummer op te vragen dat nog niet bestaat.

**Verwacht resultaat**
- Het programma haalt de specifieke versie (bijvoorbeeld versie 2) op van de back-up en herstelt deze.
- Als de versie niet bestaat, toont het programma een foutmelding.

**Randgevallen / edge cases**
- **Niet bestaand versienummer:** Actie mislukt.

---

## TC-04-04 — Haalt oude versies van een back-up op

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-04-04 — Haalt oude versies op |
| **Scope** | Versieoverzicht inzien van een backupbestand |
| **Preconditions** | Er zijn één of meerdere back-ups gemaakt van `backup2`. |

**Stappen**
1. Typ `versions backup2` in de LBS omgeving.
2. Controleer de lijst met versies en identificatienummers.
3. Probeer van meerdere backupbestanden tegelijk de versies op te vragen.

**Verwacht resultaat**
- Het programma toont een overzicht van alle gemaakte versies met hun identificatienummer.

**Randgevallen / edge cases**
- **Meerdere backupbestanden opvragen:** Niet ondersteund of geeft een melding.

---

# TC-05 — Hulp functionaliteit

## TC-05-01 — Hulp command uitvoeren

| Veld | Inhoud |
| :--- | :--- |
| **Titel / ID** | TC-05-01 — Hulp command uitvoeren |
| **Scope** | Help-pagina opvragen |
| **Preconditions** | LBS omgeving is actief. |

**Stappen**
1. Typ `help` in de LBS omgeving.
2. Bekijk het overzicht van de beschikbare commands.

**Verwacht resultaat**
- De gebruiker krijgt een duidelijke lijst met commands te zien die gebruikt kunnen worden binnen het programma.

**Randgevallen / edge cases**
- Geen.
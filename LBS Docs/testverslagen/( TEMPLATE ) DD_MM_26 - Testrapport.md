## Inleiding & Testgegevens

| Veld                     | Inhoud                                                                                                       |
| :----------------------- | :----------------------------------------------------------------------------------------------------------- |
| **Project**              | Lokaal Back-up Systeem (LBS)                                                                                 |
| Opdrachtgever            | Senna Draaijer                                                                                               |
| **Tester(s)**            | [TESTER]                                                                                                     |
| **Datum van uitvoering** | DD / MM / 26                                                                                                 |
| **Testomgeving / OS**    | Cachyos Linux 6.18.52-1, kitty 0.49.2                                                                        |
| **Geteste Versie**       | ( E.1 ) Testcases                                                                                            |
| **Doel van de test**     | Het verifieren van de werking van het LBS-systeem en het vastleggen van de resultaten voor de opdrachtgever. |
| **Gelinkte Documenten**  |                                                                                                              |

---

# TR-01 — Opstarten en afsluiten van LBS

## TR-01-01 — Start programma omgeving op

| Veld                     | Inhoud                                        |
| :----------------------- | :-------------------------------------------- |
| **Test ID / Referentie** | TR-01-01 (gekoppeld aan TC-01-01 / GAT-01-01) |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd**      |

##### **Uitgevoerde stappen**
1. Open de terminal.
2. Typ `LBS` in en druk op enter.
3. Controleer de weergave in de terminal.
##### **Verwacht resultaat**
- De gebruiker wordt in de LBS omgeving geplaatst.
- Er verschijnt een welkomstbericht / visuele bevestiging.
##### **Daadwerkelijk resultaat**
- 
##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geem

---

## TR-01-02 — Sluit het programma af

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-01-02 (gekoppeld aan TC-01-02)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `exit` in wanneer er geen actieve taak bezig is.
2. Probeer `exit` te typen terwijl een taak bezig is.
3. Druk op `CTRL + C` tijdens een actieve taak.

##### **Verwacht resultaat**
- Het command `exit` sluit het programma pas af als de actieve taak klaar is.
- `CTRL + C` sluit het programma direct geforceerd af zonder de taak af te maken.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-02 — Backupbestanden beheren

## TR-02-01 — Maakt een backupbestand aan

| Veld                     | Inhoud                                        |
| :----------------------- | :-------------------------------------------- |
| **Test ID / Referentie** | TR-02-01 (gekoppeld aan TC-02-01 / GAT-02-01) |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd**      |

##### **Uitgevoerde stappen**
1. Typ `new <backupbestandsnaam>` in de LBS omgeving.
2. Controleer of het bestand is aangemaakt.
3. Typ buiten de omgeving het command `LBS -n <backupbestandsnaam>` in.
4. Probeer een backupbestand aan te maken met een al bestaande naam.

##### **Verwacht resultaat**
- Er wordt een nieuw backupbestand aangemaakt met de opgegeven naam.
- Dit werkt zowel in als buiten de LBS omgeving.
- Bij een al bestaande naam weigert het programma het command en toont het een bericht dat het niet succesvol is afgerond.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-02-02 — Backupbestand verwijderen

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-02-02 (gekoppeld aan TC-02-02)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `remove <backupbestandsnaam>` in de LBS omgeving.
2. Controleer of het bestand is verwijderd.
3. Typ buiten de omgeving `LBS -rm <backupbestandsnaam>` om een bestand te verwijderen.
4. Probeer een niet bestaand backupbestand te verwijderen.

##### **Verwacht resultaat**
- Het opgegeven backupbestand wordt verwijderd.
- Als het bestand niet bestaat, toont het programma een bericht dat het gegeven bestand niet bestaat.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-02-03 — Het pad van backupbestand ophalen

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-02-03 (gekoppeld aan TC-02-03)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `path <backupbestandsnaam>` in de LBS omgeving.
2. Typ buiten de omgeving `LBS -p <backupbestandsnaam>`.
3. Probeer het pad op te halen van een niet bestaand bestand of vraag meerdere bestanden tegelijk op.

##### **Verwacht resultaat**
- Het programma toont het juiste pad van het backupbestand.
- Bij ongeldige of niet bestaande bestanden toont het programma een bericht dat het geen geldig bestand is.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-03 — Inhoud van backupbestanden beheren

## TR-03-01 — Voegt een folder of bestand toe aan een backupbestand

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-03-01 (gekoppeld aan TC-03-01)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `add <backupbestandsnaam> <bestandspad>` in de omgeving.
2. Typ buiten de omgeving `LBS -a <backupbestandsnaam> <bestandspad>`.
3. Probeer het pad van het LBS programma zelf toe te voegen.
4. Probeer een pad toe te voegen aan een niet bestaand backupbestand.

##### **Verwacht resultaat**
- Het bestand of de folder wordt toegevoegd aan het backupbestand.
- Het programma weigert het pad van het eigen programma toe te voegen of toe te voegen aan een niet bestaand backupbestand.

##### **Daadwerkelijk resultaat**
- 
##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-03-02 — Verwijderd bestand of folder uit backupbestand

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-03-02 (gekoppeld aan TC-03-02)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `remove -f <backupbestandsnaam> <bestandspad>` in de omgeving.
2. Typ buiten de omgeving `LBS -rf <backupbestandsnaam> <bestandspad>`.
3. Probeer een bestand te verwijderen uit een ongeldig backupbestand.
4. Probeer een bestand/folder te verwijderen die niet in het backupbestand zit.

##### **Verwacht resultaat**
- Het opgegeven bestand of de folder wordt uit het backupbestand gehaald.
- Als het backupbestand ongeldig is of het pad zit er niet in, geeft het programma een melding.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-03-03 — Haalt de inhoud van een backupbestand op

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-03-03 (gekoppeld aan TC-03-03)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `read <backupbestandsnaam>` in de LBS omgeving.
2. Controleer het overzicht van bestanden.
3. Probeer de inhoud van meerdere bestanden tegelijk op te halen.

##### **Verwacht resultaat**
- Het programma toont alle bestanden en folders die in het backupbestand staan.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-04 — Back-ups en versiebeheer

## TR-04-01 — Maakt een back-up aan

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-04-01 (gekoppeld aan TC-04-01)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `backup <backupbestandsnaam>` in de omgeving.
2. Controleer de doelmap `/usr/dev/backups/<backupbestandsnaam>`.
3. Probeer een back-up uit te voeren met een niet bestaand backupbestand.

##### **Verwacht resultaat**
- De back-up van alle bestanden en folders wordt gemaakt en opgeslagen in `/usr/dev/backups/container/<backupbestandsnaam>`.
- Er wordt automatisch een versiebeheerbestand bijgewerkt met een nieuw versienummer.
- Bij een niet bestaand backupbestand wordt de actie geweigerd.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-04-02 — Haalt een back-up op

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-04-02 (gekoppeld aan TC-04-02)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `fetch <backupbestandsnaam>` in de LBS omgeving.
2. Controleer of de originele bestanden/folders zijn overschreven met de back-up.
3. Probeer een back-up op te halen die nog niet is gemaakt of niet bestaat.

##### **Verwacht resultaat**
- Alle bestanden uit de back-up overschrijven de originele locaties die in het backupbestand staan.
- Als er nog geen back-up is gemaakt, geeft het programma een foutmelding.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-04-03 — Haalt oude back-up terug

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-04-03 (gekoppeld aan TC-04-03)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `fetch -o <backupbestandsnaam> 2` in de omgeving.
2. Controleer of de bestanden zijn hersteld naar versie 2.
3. Probeer een versienummer op te vragen dat nog niet bestaat.

##### **Verwacht resultaat**
- Het programma haalt de specifieke versie (bijvoorbeeld versie 2) op van de back-up en herstelt deze.
- Als de versie niet bestaat, toont het programma een foutmelding.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-04-04 — Haalt oude versies van een back-up op

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-04-04 (gekoppeld aan TC-04-04)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `versions <backupbestandsnaam>` in de LBS omgeving.
2. Controleer de lijst met versies en identificatienummers.
3. Probeer van meerdere backupbestanden tegelijk de versies op te vragen.

##### **Verwacht resultaat**
- Het programma toont een overzicht van alle gemaakte versies met hun identificatienummer.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-05 — Hulp functionaliteit

## TR-05-01 — Hulp command uitvoeren

| Veld                     | Inhoud                                   |
| :----------------------- | :--------------------------------------- |
| **Test ID / Referentie** | TR-05-01 (gekoppeld aan TC-05-01)        |
| **Testresultaat**        | **Behaald / Niet Behaald / Geblokkeerd** |

##### **Uitgevoerde stappen**
1. Typ `help` in de LBS omgeving.
2. Bekijk het overzicht van de beschikbare commands.

##### **Verwacht resultaat**
- De gebruiker krijgt een duidelijke lijst met commands te zien die gebruikt kunnen worden binnen het programma.

##### **Daadwerkelijk resultaat**
- 

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# Algemene Samenvatting Testronde

| Totaal Aantal Tests | Geslaagd (PASSED) | Mislukt (FAILED) | Gecanceld / Geblokkeerd (BLOCKED) |
| :-----------------: | :---------------: | :--------------: | :-------------------------------: |
|         13          |         0         |        0         |                 0                 |

### Conclusie & Advies



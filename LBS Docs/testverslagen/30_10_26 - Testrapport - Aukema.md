## Inleiding & Testgegevens

| Veld                     | Inhoud                                                                                                       |
| :----------------------- | :----------------------------------------------------------------------------------------------------------- |
| **Project**              | Lokaal Back-up Systeem (LBS)                                                                                 |
| Opdrachtgever            | Senna Draaijer                                                                                               |
| **Tester(s)**            | Frank Aukema                                                                                                 |
| **Datum van uitvoering** | 30 / 10 / 26                                                                                                 |
| **Testomgeving / OS**    | Cachyos Linux 6.18.52-1, kitty 0.49.2                                                                        |
| **Geteste Versie**       | ( E.1 ) Testcases                                                                                            |
| **Doel van de test**     | Het verifieren van de werking van het LBS-systeem en het vastleggen van de resultaten voor de opdrachtgever. |
| **Gelinkte Documenten**  | [[( E.1 ) Testcases - Lokaal Back-Up Systeem]]<br>[[( A.1 ) Projectplan - Lokaal Back-up Systeem]]           |
|                          |                                                                                                              |

---

# TR-01 — Opstarten en afsluiten van LBS

## TR-01-01 — Start programma omgeving op

| Veld                     | Inhoud                                        |
| :----------------------- | :-------------------------------------------- |
| **Test ID / Referentie** | TR-01-01 (gekoppeld aan TC-01-01 / GAT-01-01) |
| **Testresultaat**        | **Behaald**                                   |

##### **Uitgevoerde stappen**
1. Open de terminal.
2. Typ `LBS` in en druk op enter.
3. Controleer de weergave in de terminal.
##### **Verwacht resultaat**
- De gebruiker wordt in de LBS omgeving geplaatst.
- Er verschijnt een welkomstbericht / visuele bevestiging.
##### **Daadwerkelijk resultaat**
- Heeft het programma opgestart in de omgeving met de commando `./LBS` en werd gegroet met een welkomstbericht.
##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-01-02 — Sluit het programma af

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-01-02 (gekoppeld aan TC-01-02) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `exit` in wanneer er geen actieve taak bezig is.
2. Probeer `exit` te typen terwijl een taak bezig is.
3. Druk op `CTRL + C` tijdens een actieve taak.

##### **Verwacht resultaat**
- Het command `exit` sluit het programma pas af als de actieve taak klaar is.
- `CTRL + C` sluit het programma direct geforceerd af zonder de taak af te maken.

##### **Daadwerkelijk resultaat**
- De tester typte `exit` maar het programma sloot niet af, daarna deed de tester `CTRL + C` en sloot het programma wel af

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- `exit` commando is nog niet aanwezig.

---

# TR-02 — Backupbestanden beheren

## TR-02-01 — Maakt een backupbestand aan

| Veld                     | Inhoud                                        |
| :----------------------- | :-------------------------------------------- |
| **Test ID / Referentie** | TR-02-01 (gekoppeld aan TC-02-01 / GAT-02-01) |
| **Testresultaat**        | **Behaald**                                   |

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
- De tester typte eerst `new frank.py` en daarna `new frank2`. Beide keren maakte het programma een backupbestand aan, met de namen: "frank.py" en "frank2".

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- De gebruiker kan de bestanden met punten in de naam aanmaken.

---

## TR-02-02 — Backupbestand verwijderen

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-02-02 (gekoppeld aan TC-02-02) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `remove <backupbestandsnaam>` in de LBS omgeving.
2. Controleer of het bestand is verwijderd.
3. Typ buiten de omgeving `LBS -rm <backupbestandsnaam>` om een bestand te verwijderen.
4. Probeer een niet bestaand backupbestand te verwijderen.

##### **Verwacht resultaat**
- Het opgegeven backupbestand wordt verwijderd.
- Als het bestand niet bestaat, toont het programma een bericht dat het gegeven bestand niet bestaat.

##### **Daadwerkelijk resultaat**
- De tester typte `delete frank.py` waardoor het programma het backupbestand "frank.py.back" had verwijderd.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Het programma vindt het niet erg als een backupbestand punten in de naam heeft.

---

## TR-02-03 — Het pad van backupbestand ophalen

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-02-03 (gekoppeld aan TC-02-03) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `path <backupbestandsnaam>` in de LBS omgeving.
2. Typ buiten de omgeving `LBS -p <backupbestandsnaam>`.
3. Probeer het pad op te halen van een niet bestaand bestand of vraag meerdere bestanden tegelijk op.

##### **Verwacht resultaat**
- Het programma toont het juiste pad van het backupbestand.
- Bij ongeldige of niet bestaande bestanden toont het programma een bericht dat het geen geldig bestand is.

##### **Daadwerkelijk resultaat**
- De tester typte `path frank2` waardoor het systeem "/home/dev/Backups/backupfiles/frank2.back" toonde.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-03 — Inhoud van backupbestanden beheren

## TR-03-01 — Voegt een folder of bestand toe aan een backupbestand

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-03-01 (gekoppeld aan TC-03-01) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `add <backupbestandsnaam> <bestandspad>` in de omgeving.
2. Typ buiten de omgeving `LBS -a <backupbestandsnaam> <bestandspad>`.
3. Probeer het pad van het LBS programma zelf toe te voegen.
4. Probeer een pad toe te voegen aan een niet bestaand backupbestand.

##### **Verwacht resultaat**
- Het bestand of de folder wordt toegevoegd aan het backupbestand.
- Het programma weigert het pad van het eigen programma toe te voegen of toe te voegen aan een niet bestaand backupbestand.

##### **Daadwerkelijk resultaat**
- De tester typte `add frank hello_world.py`, `add frank2 hello_world.py` en `add frank2 Documents/hello_world.py`. Bij het eerste command gegeven was het backupbestand ongeldig/niet bestaand hierdoor toonde het programma aan dat het geen geldig backupbestand was. Bij de tweede commando was het backupbestand geldig maar het bestand gegeven niet, hierdoor toonde het programma ook aan dat het er een ongeldig/niet bestaand bestand mee was gegeven. Uiteindelijk bij de derde commando was het bestand successvol toegevoegd aan het bestand met het bericht "Successfully updated '/home/dev/Backups/backupfiles/frank2.back'"
##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-03-02 — Verwijderd bestand of folder uit backupbestand

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-03-02 (gekoppeld aan TC-03-02) |
| **Testresultaat**        | **Geblokkeerd**                   |

##### **Uitgevoerde stappen**
1. Typ `remove -f <backupbestandsnaam> <bestandspad>` in de omgeving.
2. Typ buiten de omgeving `LBS -rf <backupbestandsnaam> <bestandspad>`.
3. Probeer een bestand te verwijderen uit een ongeldig backupbestand.
4. Probeer een bestand/folder te verwijderen die niet in het backupbestand zit.

##### **Verwacht resultaat**
- Het opgegeven bestand of de folder wordt uit het backupbestand gehaald.
- Als het backupbestand ongeldig is of het pad zit er niet in, geeft het programma een melding.

##### **Daadwerkelijk resultaat**
- Geen

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-03-03 — Haalt de inhoud van een backupbestand op

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-03-03 (gekoppeld aan TC-03-03) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `read <backupbestandsnaam>` in de LBS omgeving.
2. Controleer het overzicht van bestanden.
3. Probeer de inhoud van meerdere bestanden tegelijk op te halen.

##### **Verwacht resultaat**
- Het programma toont alle bestanden en folders die in het backupbestand staan.

##### **Daadwerkelijk resultaat**
- De tester typte `read frank2` waardoor het programma de inhoud van het backupbestand 'frank2' ophaalde.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-04 — Back-ups en versiebeheer

## TR-04-01 — Maakt een back-up aan

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-04-01 (gekoppeld aan TC-04-01) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `backup <backupbestandsnaam>` in de omgeving.
2. Controleer de doelmap `/usr/dev/backups/<backupbestandsnaam>`.
3. Probeer een back-up uit te voeren met een niet bestaand backupbestand.

##### **Verwacht resultaat**
- De back-up van alle bestanden en folders wordt gemaakt en opgeslagen in `/usr/dev/backups/container/<backupbestandsnaam>`.
- Er wordt automatisch een versiebeheerbestand bijgewerkt met een nieuw versienummer.
- Bij een niet bestaand backupbestand wordt de actie geweigerd.

##### **Daadwerkelijk resultaat**
- De tester typte `backup frank2` waardoor het programma voor een wachtwoord vraagt (extra beveiliging). Dit typte hij in waardoor het programma liet zien dat alle bestanden waren opgeslagen.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-04-02 — Haalt een back-up op

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-04-02 (gekoppeld aan TC-04-02) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `fetch <backupbestandsnaam>` in de LBS omgeving.
2. Controleer of de originele bestanden/folders zijn overschreven met de back-up.
3. Probeer een back-up op te halen die nog niet is gemaakt of niet bestaat.

##### **Verwacht resultaat**
- Alle bestanden uit de back-up overschrijven de originele locaties die in het backupbestand staan.
- Als er nog geen back-up is gemaakt, geeft het programma een foutmelding.

##### **Daadwerkelijk resultaat**
- De tester typte `fetch frank2` waardoor het programma eerst geen bestanden kon ophalen sinds er geen vcs (versie controle) folder aangemaakt was. Hiervoor moest ik handmatig de folder/versiebestand aanmaken. Nadat dit gedaan was kon de tester het weer proberen, bij de tweede poging liet het programma zien dat de bestanden successvol waren opgehaalt. En dat was ook terug te zien in de verkenner app.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Het programma maakt niet bij een backup aanmaken een versie beheer folder/bestand aan.

---

## TR-04-03 — Haalt oude back-up terug

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-04-03 (gekoppeld aan TC-04-03) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `fetch -o <backupbestandsnaam> 2` in de omgeving.
2. Controleer of de bestanden zijn hersteld naar versie 2.
3. Probeer een versienummer op te vragen dat nog niet bestaat.

##### **Verwacht resultaat**
- Het programma haalt de specifieke versie (bijvoorbeeld versie 2) op van de back-up en herstelt deze.
- Als de versie niet bestaat, toont het programma een foutmelding.

##### **Daadwerkelijk resultaat**
- De tester typte `fetch -o frank2 2` in waardoor het programma successvol de oude inhoud ophaalde.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-04-04 — Haalt oude versies van een back-up op

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-04-04 (gekoppeld aan TC-04-04) |
| **Testresultaat**        | **50% Behaald**                   |

##### **Uitgevoerde stappen**
1. Typ `versions <backupbestandsnaam>` in de LBS omgeving.
2. Controleer de lijst met versies en identificatienummers.
3. Probeer van meerdere backupbestanden tegelijk de versies op te vragen.

##### **Verwacht resultaat**
- Het programma toont een overzicht van alle gemaakte versies met hun identificatienummer.

##### **Daadwerkelijk resultaat**
- Bij het ophalen van een backup krijgt de tester automatisch alle versies te zien van de bestanden.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-05 — Hulp functionaliteit

## TR-05-01 — Hulp command uitvoeren

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-05-01 (gekoppeld aan TC-05-01) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `help` in de LBS omgeving.
2. Bekijk het overzicht van de beschikbare commands.

##### **Verwacht resultaat**
- De gebruiker krijgt een duidelijke lijst met commands te zien die gebruikt kunnen worden binnen het programma.

##### **Daadwerkelijk resultaat**
- De tester typte `HELP`, `HELP!`, `HEELLPPP`, `SOMEONE HELP ME` en `help` in waardoor het programma bij de eerste vier commandos aan toonde dat deze commandos niet bestaan. Bij de vijfde commando toonde het programma een overzicht van alle commandos en argumenten.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# Algemene Samenvatting Testronde

| Totaal Aantal Tests | Geslaagd (PASSED) | Mislukt (FAILED) | Gecanceld / Geblokkeerd (BLOCKED) |
| :-----------------: | :---------------: | :--------------: | :-------------------------------: |
|         13          |        12         |        0         |                 1                 |

### Conclusie & Advies
Het programma is zo goed als af, er zijn kleine puntjes die verbeterd moeten worden zoals: het "exit" commando of uit de omgeving korte commando's. Voorderest doet alles als behoord en zal het opgeleverde product als een voldoende afgerond zijn (bekijk: [[( A.1 ) Projectplan - Lokaal Back-up Systeem#MoSCoW|MoSCoW Tabel]])


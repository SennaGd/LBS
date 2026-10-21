## Inleiding & Testgegevens

| Veld                     | Inhoud                                                                                                       |
| :----------------------- | :----------------------------------------------------------------------------------------------------------- |
| **Project**              | Lokaal Back-up Systeem (LBS)                                                                                 |
| Opdrachtgever            | Senna Draaijer                                                                                               |
| **Tester(s)**            | Rick Salden                                                                                                  |
| **Datum van uitvoering** | 21 / 10 / 26                                                                                                 |
| **Testomgeving / OS**    | Cachyos Linux 6.18.52-1, kitty 0.49.2                                                                        |
| **Geteste Versie**       | ( E.1 ) Testcases                                                                                            |
| **Doel van de test**     | Het verifieren van de werking van het LBS-systeem en het vastleggen van de resultaten voor de opdrachtgever. |
| **Gelinkte Documenten**  | [[( E.1 ) Testcases - Lokaal Back-Up Systeem]]<br>[[( F.1 ) Acceptatie testcases]]                           |

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
- De tester had de terminal open en typte `./LBS` in, vervolgens werd hij gegroet met een welkomstbericht.
##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Het programma was geopend in een verkeerde folder, waardoor het programma `Scripts/Handler.lua` niet kon vinden.

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
- De tester typte als eerst `exit`, hier toonde het programma: _Unknown command: exit_. Daarna deed de tester `CTRL + C` wat het programma succesvol had afgesloten.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Het `exit` commando bestond niet.

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
- De tester typte `new backup1`, `new backupFile` en later `new firstfile` deze twee commando's maakten allemaal een nieuw backupbestand aan.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

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
- De tester typte `remove backup1` en `remove backupFile` waarbij beide keren het programma aantoonde dat het backupbestand succesvol was verwijderd.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-02-03 — Het pad van backupbestand ophalen

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-02-03 (gekoppeld aan TC-02-03) |
| **Testresultaat**        | **Geblokkeerd**                   |

##### **Uitgevoerde stappen**
1. Typ `path <backupbestandsnaam>` in de LBS omgeving.
2. Typ buiten de omgeving `LBS -p <backupbestandsnaam>`.
3. Probeer het pad op te halen van een niet bestaand bestand of vraag meerdere bestanden tegelijk op.

##### **Verwacht resultaat**
- Het programma toont het juiste pad van het backupbestand.
- Bij ongeldige of niet bestaande bestanden toont het programma een bericht dat het geen geldig bestand is.

##### **Daadwerkelijk resultaat**
- Niet van toepassing

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
- De tester typte `add fistfile Documents/Nederlands` waar het programma een error gaf: _File: /home/dev/Backups/backupfiles/fistfile.back does not exists_. Daarna typte de tester `add firstfile Documents/Nederlands` waar het programma aan toonde dat het gegeven pad was gevonden en toegevoegd aan het backupbestand _firstfile_.
##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- De paden zijn hoofdletter gevoelig waardoor het soms kan zijn dat een gebruiker fouten kan maken met betreffing tot hoofdlettergebruik.

---

## TR-03-02 — Verwijderd bestand of folder uit backupbestand

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-03-02 (gekoppeld aan TC-03-02) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `remove -f <backupbestandsnaam> <bestandspad>` in de omgeving.
2. Typ buiten de omgeving `LBS -rf <backupbestandsnaam> <bestandspad>`.
3. Probeer een bestand te verwijderen uit een ongeldig backupbestand.
4. Probeer een bestand/folder te verwijderen die niet in het backupbestand zit.

##### **Verwacht resultaat**
- Het opgegeven bestand of de folder wordt uit het backupbestand gehaald.
- Als het backupbestand ongeldig is of het pad zit er niet in, geeft het programma een melding.

##### **Daadwerkelijk resultaat**
- De tester typte `remove firstfile Documents/Nederlands` waardoor het systeem toonde dat de folder _Documens/Nederlands_ successvol uit het backupbestand was gehaald.

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
- De tester typte `read firstfile` net nadat een folder uit het backupbestand gehaald was, hierdoor kreeg hij niks te zien, later had hij een folder erin gezet _Documents/Nederlands_ en kreeg dit te zien met `read firstfile`.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen error message wanneer een bestand leeg is.

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
- De tester typte `backup firstfile` in waardoor het programma liet zien: _Created backup at '/home/dev/Backups/container/firstfile'_. Daarna ging de tester in het gegeven pad kijken en daar stond de folder _Nederlands_ in.

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
- De tester typte `fetch fistfile` waardoor het programma liet zien: _File: /home/dev/Backups/backupfiles/fistfile.back does not exists_. Daarna typte hij `fetch firstfile` nadat de tester de kleine spellingsfout had opgelost liet het programma _[sudo] password for dev:_ zien, dit is een kleine beveiliging. De tester kreeg het wachtwoord en vervolgens toonde het programma aan dat de backup successvol was opgehaald: _Retrieved: /home/dev/Documents/Nederlands_.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Beveiliging accountwachtwoord

---

## TR-04-03 — Haalt oude back-up terug

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-04-03 (gekoppeld aan TC-04-03) |
| **Testresultaat**        | **Geblokkeerd**                   |

##### **Uitgevoerde stappen**
1. Typ `fetch -o <backupbestandsnaam> 2` in de omgeving.
2. Controleer of de bestanden zijn hersteld naar versie 2.
3. Probeer een versienummer op te vragen dat nog niet bestaat.

##### **Verwacht resultaat**
- Het programma haalt de specifieke versie (bijvoorbeeld versie 2) op van de back-up en herstelt deze.
- Als de versie niet bestaat, toont het programma een foutmelding.

##### **Daadwerkelijk resultaat**
- Niet van toepassing

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

## TR-04-04 — Haalt oude versies van een back-up op

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-04-04 (gekoppeld aan TC-04-04) |
| **Testresultaat**        | **Behaald**                       |

##### **Uitgevoerde stappen**
1. Typ `versions <backupbestandsnaam>` in de LBS omgeving.
2. Controleer de lijst met versies en identificatienummers.
3. Probeer van meerdere backupbestanden tegelijk de versies op te vragen.

##### **Verwacht resultaat**
- Het programma toont een overzicht van alle gemaakte versies met hun identificatienummer.

##### **Daadwerkelijk resultaat**
- Niet van toepassing

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Geen

---

# TR-05 — Hulp functionaliteit

## TR-05-01 — Hulp command uitvoeren

| Veld                     | Inhoud                            |
| :----------------------- | :-------------------------------- |
| **Test ID / Referentie** | TR-05-01 (gekoppeld aan TC-05-01) |
| **Testresultaat**        | **Behaald**                       |
| Acceptatie testca        |                                   |

##### **Uitgevoerde stappen**
1. Typ `help` in de LBS omgeving.
2. Bekijk het overzicht van de beschikbare commands.

##### **Verwacht resultaat**
- De gebruiker krijgt een duidelijke lijst met commands te zien die gebruikt kunnen worden binnen het programma.

##### **Daadwerkelijk resultaat**
- De tester typte als eerst het hulp commando in maar dit werkte niet, dit kwam omdat het programma in een verkeerde folder geopened was. Nadat het programma in de juiste folder was geopened typte `help` en kreeg een geheel overzicht te zien van commando's. Met deze lijst heeft hij de andere commando's kunnen gebruiken.

##### **Bevindingen / Foutmeldingen (indien van toepassing)**
- Programma kan Scripts/Handler.lua niet vinden als het in een ander programma wordt gestart

---

# Algemene Samenvatting Testronde

| Totaal Aantal Tests | Geslaagd (PASSED) | Mislukt (FAILED) | Gecanceld / Geblokkeerd (BLOCKED) |
| :-----------------: | :---------------: | :--------------: | :-------------------------------: |
|         13          |        11         |        0         |                 2                 |

### Conclusie & Advies
Het programma Lokaal Back-Up Systeem (LBS) functioneert over het algemeen stabiel, van de 13 uitgevoerde tests zijn er 11 successvol behaald, de 2 tests die niet behaalt zijn waren geblokkeerd (TR-02-03 en TR-04-03) wat betekend dat deze onderdelen nog verdere ontwikkeling nodig hebben. 


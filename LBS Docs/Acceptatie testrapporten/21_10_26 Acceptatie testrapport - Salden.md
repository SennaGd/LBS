# 1. Algemene Informatie & Testgegevens

| **Veld**                 | Inhoud                                                                                                                  |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| **Project**              | Lokaal Back-up Systeem (LBS)                                                                                            |
| **Opdrachtgever**        | Senna Draaijer                                                                                                          |
| **Tester(s)**            | Rick Salden                                                                                                             |
| **Datum van uitvoering** | 21 / 10 / 2026                                                                                                          |
| **Testomgeving / OS**    | Cachyos Linux 6.18.52-1, kitty 0.49.2                                                                                   |
| **Geteste Versie**       | ( F.1 ) Acceptatie testcases                                                                                            |
| **Doel van de test**     | Het verifieren en accepteren van de functionaliteit van het LBS-systeem op basis van de opgestelde acceptatietestcases. |
| **Gelinkte Documenten**  | [[( F.1 ) Acceptatie testcases]]                                                                                        |

## 2. Testresultaten per Acceptatiecriterium

### GAT-01: Gebruikersgemak & Eerste ervaring
#### GAT-01-01: Omgeving starten via de terminal

|                          |             |
| ------------------------ | ----------- |
| **Veld**                 | **Inhoud**  |
| **Test ID / Referentie** | GAT-01-01   |
| **Testresultaat**        | **Behaald** |

**Uitgevoerde stappen:**
 1. Open de terminal (Kitty, Alacritty, GNOME terminal, Konsole, Foot, of St).
 2. Voer het commando `LBS` in.
 3. Probeer het programma ook te starten met onjuiste/ongeldige argumenten.
        
**Verwacht resultaat (Acceptatiecriteria):**
 - Het programma start direct op na het invoeren van `LBS`.
 - De gebruiker krijgt direct een visuele bevestiging dat het programma actief is.
 - Bij onjuiste argumenten geeft het programma een duidelijke foutmelding dat de argumenten niet kloppen.

**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-01-01 — Start programma omgeving op|Ga naar testrapport]]
**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-01-01 — Start programma omgeving op|Ga naar testrapport]]

#### GAT-01-02: Raadplegen van ingebouwde hulp-pagina

|                          |                                              |
| ------------------------ | -------------------------------------------- |
| **Veld**                 | **Inhoud**                                   |
| **Test ID / Referentie** | GAT-01-02                                    |
| **Testresultaat**        |**Behaald**|

**Uitgevoerde stappen:**
1. Roep de hulp-pagina op vanuit de terminal of live omgeving met het help-commando.
2. Controleer het overzicht van de getoonde instructies en commando's.

**Verwacht resultaat (Acceptatiecriteria):**    
- De hulp-pagina is succesvol op te roepen vanuit de terminal én de live omgeving.
- De getoonde output geeft een duidelijk overzicht van alle commando's en de juiste werkwijze van het programma.

**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-05-01 — Hulp command uitvoeren|Ga naar testrapport]]

**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-05-01 — Hulp command uitvoeren|Ga naar testrapport]]

### GAT-02: Beheer van Backup-bestanden

#### GAT-02-01: Aanmaken van een nieuw backupbestand

|   |   |
|---|---|
|**Veld**|**Inhoud**|
|**Test ID / Referentie**|GAT-02-01|
|**Testresultaat**|**Behaald**|

**Uitgevoerde stappen:**
 1. Maak een nieuw backupbestand aan met een geldige, niet-bestaande naam (via terminal-argumenten en via de live-omgeving).
 2. Probeer een bestand aan te maken met ongeldige symbolen (`*!@#$%^&()*`).
 3. Probeer een bestand aan te maken met een naam die al bestaat.
        
**Verwacht resultaat (Acceptatiecriteria):**
- Het systeem maakt het bestand correct aan bij een geldige naam (werkt zowel via terminal-argumenten als live-omgeving).
- Het systeem weigert de invoer bij ongeldige symbolen.
- Bij een al bestaande naam toont het programma een duidelijke melding.
       
**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-02-01 — Maakt een backupbestand aan|Ga naar testrapport]]
       
**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-02-01 — Maakt een backupbestand aan|Ga naar testrapport]]


#### GAT-02-02: Toevoegen van bestanden en folders aan een backupbestand

|   |   |
|---|---|
|**Veld**|**Inhoud**|
|**Test ID / Referentie**|GAT-02-02|
|**Testresultaat**|**Behaald**|

**Uitgevoerde stappen:**
  1. Voeg map `/home/USR/Documents/` toe aan het backupbestand `backup`.
  2. Voeg een los bestand toe aan een backupbestand.
  3. Probeer het pad van het LBS-programma zelf toe te voegen.
  4. Probeer een bestand/map toe te voegen met spaties in de naam.
      
**Verwacht resultaat (Acceptatiecriteria):**
  - Mappen en losse bestanden worden correct toegevoegd.
  - Het systeem weigert het pad van het LBS-programma zelf te toevoegen.
  - Bestanden/mappen met spaties worden geweigerd met een passende melding.
      
**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-03-01 — Voegt een folder of bestand toe aan een backupbestand|Ga naar testrapport]]

**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-03-01 — Voegt een folder of bestand toe aan een backupbestand|Ga naar testrapport]]

#### GAT-02-03: Inzien/Raadplegen inhoud backupbestand

|   |   |
|---|---|
|**Veld**|**Inhoud**|
|**Test ID / Referentie**|GAT-02-03|
|**Testresultaat**|**Behaald**|

**Uitgevoerde stappen:**
  1. Voer het commando `read <backupbestandsnaam>` (of `LBS -rd <backupbestandsnaam>`) uit voor een gevuld backupbestand.
  2. Voer hetzelfde commando uit op een leeg backupbestand.
  3. Voer het commando uit op een niet-bestaand backupbestand.
      
**Verwacht resultaat (Acceptatiecriteria):**
  - De inhoud van het backupbestand wordt correct getoond.
  - Bij een leeg bestand meldt het systeem expliciet dat het bestand leeg is.
  - Bij een niet-bestaand bestand wordt een duidelijke foutmelding getoond.
      
**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-03-03 — Haalt de inhoud van een backupbestand op|Ga naar testrapport]]
      
**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-03-03 — Haalt de inhoud van een backupbestand op|Ga naar testrapport]]
     

#### GAT-02-04: Bestanden en folders verwijderen uit een backupbestand

|   |   |
|---|---|
|**Veld**|**Inhoud**|
|**Test ID / Referentie**|GAT-02-04|
|**Testresultaat**|**Behaald**|

**Uitgevoerde stappen:**
1. Verwijder een bestaande folder/bestand uit het backupbestand.
2. Probeer een bestand/folder te verwijderen die niet in het backupbestand aanwezig is.
3. Probeer een item te verwijderen uit een niet-bestaand backupbestand.

**Verwacht resultaat (Acceptatiecriteria):**
- Systeem geeft aan dat het item succesvol is verwijderd.
- Indien het item niet aanwezig is, geeft het systeem aan dat het item niet in het backupbestand staat.
- Indien het backupbestand niet bestaat, geeft het systeem aan dat dit backupbestand niet bestaat.

**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-03-02 — Verwijderd bestand of folder uit backupbestand|Ga naar testrapport]]
      
**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-03-02 — Verwijderd bestand of folder uit backupbestand|Ga naar testrapport]]
        

### GAT-03: Uitvoeren van een Back-up

#### GAT-03-01: Een backup uitvoeren

|   |   |
|---|---|
|**Veld**|**Inhoud**|
|**Test ID / Referentie**|GAT-03-01|
|**Testresultaat**|**Behaald**|

**Uitgevoerde stappen:**
  1. Voer een back-up uit voor een geldig backupbestand met inhoud.
  2. Voer een back-up uit voor een leeg backupbestand.
  3. Voer een back-up uit waarbij een van de paden in het bestand ongeldig is.
  4. Voer een back-up uit voor een niet-bestaand backupbestand.
      
**Verwacht resultaat (Acceptatiecriteria):**
- Systeem toont een overzicht van succesvol en niet-succesvol gekopieerde bestanden.
- Bij een leeg backupbestand geeft het systeem aan dat er geen back-up gemaakt wordt.
- Bij een ongeldig pad wordt dit specifieke pad als niet-succesvol gemarkeerd.
- Bij een niet-bestaand backupbestand meldt het programma dat er geen back-up kan worden uitgevoerd.
      
**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-04-01 — Maakt een back-up aan|Ga naar testrapport]]
      
**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-04-01 — Maakt een back-up aan|Ga naar testrapport]]
      

#### GAT-03-02: Inhoud van een backup ophalen

|   |   |
|---|---|
|**Veld**|**Inhoud**|
|**Test ID / Referentie**|GAT-03-02|
|**Testresultaat**|**Geblokkeerd**|

**Uitgevoerde stappen:**
1. Vraag de inhoud op van een succesvol afgeronde back-up.
2. Vraag de inhoud op van een onvolledige/mislukte back-up.
3. Vraag de inhoud op van een niet-bestaande back-up of backupbestand.
      
**Verwacht resultaat (Acceptatiecriteria):**
- Systeem geeft een duidelijk overzicht van alle opgeslagen bestanden.
- Ook bij onvolledige back-ups geeft het systeem aan welke data wel/niet beschikbaar is.
- Bij een niet-bestaande back-up toont het systeem aan dat de back-up niet bestaat.
      
**Daadwerkelijk resultaat:**
- Geen
      
**Bevindingen / Foutmeldingen:**
- Geen
        

### GAT-04: Ophalen van Back-ups

#### GAT-04-01: Ophalen (herstellen) van een gemaakte back-up

|                          |             |
| ------------------------ | ----------- |
| **Veld**                 | **Inhoud**  |
| **Test ID / Referentie** | GAT-04-01   |
| **Testresultaat**        | **Behaald** |

**Uitgevoerde stappen:**
1. Voer het commando uit om een gemaakte back-up te herstellen naar de originele locatie.
2. Probeer een back-up te herstellen die niet bestaat.
      
**Verwacht resultaat (Acceptatiecriteria):**
- Het systeem toont een helder overzicht van alle succesvol en niet-succesvol herstelde bestanden/folders.
- Bij een niet-bestaande back-up meldt het systeem dat deze back-up niet bestaat.
      
**Daadwerkelijk resultaat:**
- [[21_10_26 - Testrapport - Salden#TR-04-02 — Haalt een back-up op|Ga naar testrapport]]
      
**Bevindingen / Foutmeldingen:**
- [[21_10_26 - Testrapport - Salden#TR-04-02 — Haalt een back-up op|Ga naar testrapport]]
- 
## 3. Algemene Samenvatting Testronde

|                         |                       |                      |                                       |
| ----------------------- | --------------------- | -------------------- | ------------------------------------- |
| **Totaal Aantal Tests** | **Geslaagd (PASSED)** | **Mislukt (FAILED)** | **Gecanceld / Geblokkeerd (BLOCKED)** |
| 9                       | 8                     | 0                    | 1                                     |

## 4. Conclusie & Advies

### Conclusie
Het project Lokaal Back-Up Systeem (LBS) voeldoet zich bijna aan alle acceptatiecriteria, er zijn nog wel een paar onderdelen die verfijnd worden. 8 van de 9 tests zijn behaald wat betekend dat het project nog NIET voldoet aan de acceptatiecriteria. Dus de conclusie is dat LBS nu op dit moment incompleet is en is dus niet geaccepteerd.

### Advies / Vervolgstappen

**Formele acceptatie:** Helaas zijn er maar 8 van de 9 tests voltooid, dit betekend dat zo'n ~90% zich voldoet aan de eisen. Maar niet 100% dit betekend dat het project niet geaccepteerd kan worden. Zodra alle testen voltooid zijn zal de acceptatietest goedgekeurd worden.
    
**Aandachtspunten:** 
- Grammatische fouten in het programma
- Missende commando's in het hulp command
- Onvoltooide/Missende commando's


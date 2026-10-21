## Inleiding & Testgegevens

| Veld | Inhoud |
| :--- | :--- |
| **Project** | Lokaal Back-up Systeem (LBS) |
| **Tester(s)** | Senna / [Naam mede-tester] |
| **Datum van uitvoering** | [DD-MM-YYYY] |
| **Testomgeving / OS** | [bijv. Ubuntu 22.04 LTS / macOS Sonoma / Windows WSL] |
| **Geteste Versie** | v1.0 |
| **Doel van de test** | Het verifiëren van de correcte werking van het LBS-systeem en het vastleggen van de resultaten voor de opdrachtgever. |

---

# TR-01 — Opstarten en afsluiten van LBS

## TR-01-01 — Start programma omgeving op

| Veld                     | Inhoud                                        |     |
| :----------------------- | :-------------------------------------------- | --- |
| **Test ID / Referentie** | TR-01-01 (gekoppeld aan TC-01-01 / GAT-01-01) |     |
| **Testresultaat**        | **[ PASSED / FAILED / BLOCKED ]**             |     |

**Uitgevoerde stappen**
1. Open de terminal.
2. Typ `LBS` in en druk op enter.
3. Controleer de weergave in de terminal.

**Verwacht resultaat**
- De gebruiker wordt in de LBS omgeving geplaatst.
- Er verschijnt een welkomstbericht / visuele bevestiging.

**Daadwerkelijk resultaat**
- [Beschrijf hier wat er daadwerkelijk gebeurde tijdens het testen]

**Bevindingen / Foutmeldingen (indien van toepassing)**
- [Geen / Beschrijving van eventuele bug of afwijking]

---

## TR-01-02 — Sluit het programma af

| Veld | Inhoud | 
| :--- | :--- | 
| **Test ID / Referentie** | TR-01-02 (gekoppeld aan TC-01-02) | 
| **Testresultaat** | **[ PASSED / FAILED / BLOCKED ]** | 

**Uitgevoerde stappen**
1. Typ `exit` in wanneer er geen actieve taak bezig is.
2. Probeer `exit` te typen terwijl een taak bezig is.
3. Druk op `CTRL + C` tijdens een actieve taak.

**Verwacht resultaat**
- Het command `exit` sluit het programma pas af als de actieve taak klaar is.
- `CTRL + C` sluit het programma direct geforceerd af zonder de taak af te maken.

**Daadwerkelijk resultaat**
- [Beschrijf hier wat er daadwerkelijk gebeurde tijdens het testen]

**Bevindingen / Foutmeldingen (indien van toepassing)**
- [Geen / Beschrijving van eventuele bug of afwijking]

---

# TR-02 — Backupbestanden beheren

## TR-02-01 — Maakt een backupbestand aan

| Veld | Inhoud | 
| :--- | :--- | 
| **Test ID / Referentie** | TR-02-01 (gekoppeld aan TC-02-01 / GAT-02-01) | 
| **Testresultaat** | **[ PASSED / FAILED / BLOCKED ]** | 

**Uitgevoerde stappen**
1. Typ `new "backup2"` in de LBS omgeving.
2. Controleer of het bestand is aangemaakt.
3. Typ buiten de omgeving het command `LBS -n "backup2_extern"` in.
4. Probeer een backupbestand aan te maken met een al bestaande naam.

**Verwacht resultaat**
- Er wordt een nieuw backupbestand aangemaakt met de opgegeven naam.
- Dit werkt zowel in als buiten de LBS omgeving.
- Bij een al bestaande naam weigert het programma het command en toont het een bericht dat het niet succesvol is afgerond.

**Daadwerkelijk resultaat**
- [Beschrijf hier wat er daadwerkelijk gebeurde tijdens het testen]

**Bevindingen / Foutmeldingen (indien van toepassing)**
- [Geen / Beschrijving van eventuele bug of afwijking]

---

## TR-02-02 — Backupbestand verwijderen

| Veld | Inhoud | 
| :--- | :--- | 
| **Test ID / Referentie** | TR-02-02 (gekoppeld aan TC-02-02) | 
| **Testresultaat** | **[ PASSED / FAILED / BLOCKED ]** | 

**Uitgevoerde stappen**
1. Typ `remove backup2` in de LBS omgeving.
2. Controleer of het bestand is verwijderd.
3. Typ buiten de omgeving `LBS -r backup2` om een bestand te verwijderen.
4. Probeer een niet bestaand backupbestand te verwijderen.

**Verwacht resultaat**
- Het opgegeven backupbestand wordt verwijderd.
- Als het bestand niet bestaat, toont het programma een bericht dat het gegeven bestand niet bestaat.

**Daadwerkelijk resultaat**
- [Beschrijf hier wat er daadwerkelijk gebeurde tijdens het testen]

**Bevindingen / Foutmeldingen (indien van toepassing)**
- [Geen / Beschrijving van eventuele bug of afwijking]

---

# Algemene Samenvatting Testronde

| Totaal Aantal Tests | Geslaagd (PASSED) | Mislukt (FAILED) | Gecanceld / Geblokkeerd (BLOCKED) | 
| :---: | :---: | :---: | :---: | 
| [Totaal] | [Aantal] | [Aantal] | [Aantal] | 

**Conclusie & Advies:**
- [Korte toelichting door de tester of de software klaar is voor oplevering aan de opdrachtgever/productowner.]
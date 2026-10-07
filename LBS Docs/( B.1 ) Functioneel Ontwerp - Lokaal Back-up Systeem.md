Datum: 21 / 09 / 2026
# Inleiding
Dit document beschrijft het functioneel ontwerp van de command-line applicatie "lokaal back-up systeem" (LBS). De applicatie wordt gebruikt om lokaal een kopie te maken door gebruik te maken van de command-line. De gebruiker maakt gebruik van *backupbestanden* waar de paden van verschillende bestanden/folders in staan. Zodra een *backupbestand* wordt opgeroepen met de taak om een backup op te halen zal het programma de bestanden vervangen met de back-up die gemaakt is. Er komt ook een versiebeheer in het programma dat bijhoudt wat voor veranderingen er zijn gemaakt, dit doet de applicatie naast een *backupbestand* als een *versiebeheerbestand* hierin staan alle veranderingen en versies van de back-up. Met versiebeheer kan de gebruiker ook op basis van de versie de back-up terughalen (dus bijvoorbeeld versie **1.2** terughalen).
# Situatiebeschrijving
## Huidige Situatie
Momenteel om een back-up te maken voor meerdere bestanden moet je dit handmatig kopieren en plakken. Er is geen versiebeheer voor deze methode en kan ook niet oude versies terughalen. Er zijn natuurlijk wel applicaties die back-ups kunnen maken zoals: "FreeFileSync", "EaseUs Todo Backup", "Duplicati" en nog veel meer. Het probleem met deze applicaties is dat ze redelijk oud zijn en geen goeie documentatie hebben. Hierdoor is het moeilijk voor de meeste mensen om zo'n programma te gebruiken.

## Gewenste Situatie
Het systeem zal er voor moeten zorgen dat gebruikers gemakkelijk een back-up kan maken van een of meerdere bestand(en)/folder(s), dit wordt gedaan met *backupbestanden*. In de *backupbestanden* worden de paden van alle folders en bestanden opgeslagen. De gebruiker zal op een eenvoudige manier een bestandspad kunnen toevoegen aan zo'n bestand (dit zal ook handmatig gewijzigd kunnen worden). Zodra de gebruiker een back-up maakt slaat het *versiebeheerbestand* alle veranderingen op in het bestand en geeft dit vervolgens een versienummer, met het versienummer kan de gebruiker oude versies terughalen van de back-up. 
# Requirements 
In het document <u>( A.1 ) Projectplan</u> vind je in de [MoSCoW](%28%20A.1%20%29%20Projectplan%20-%20Lokaal%20Back-up%20Systeem.md#MoSCoW) tabel de requirements terug.
# Use-Case
##  Diagram
![image](./images/Use-Case-Diagram.png)
## Tabellen

| Naam                   | Start programma omgeving op                                                                                                                                                         |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt "LBS" in de terminal en wordt vervolgens in de lbs omgeving gezet. Zodra hij in de omgeving zit krijgt hij een welkomst bericht te zien.                          |
| Uitzonderingen         | De gebruiker typt het programma in en vervolgens geeft hij gelijk argumenten mee: "LBS -f backup". Hierbij start de omgeving niet maar zal het programma wel een command uitvoeren. |
| Niet-Functionele Eisen | Animaties bij het opstarten van LBS                                                                                                                                                 |
| Postconditie           | De gebruiker kan in de "LBS" omgeving komen.                                                                                                                                        |

| Naam                   | Sluit het programma af                                                                                                                                                                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Scenario               | De gebruiker typt "exit" of drukt op "CTRL + C" om het programma geforceerd af te sluiten waardoor de actieve taak ook niet zich zal voltooien.  <br>De command "exit" kan alleen worden aangeroepen zodra het programma klaar is met zijn taak. |
| Uitzonderingen         | de command "exit" kan niet worden aangeroepen wanneer het programma bezig is met een back-up maken/ophalen.                                                                                                                                      |
| Niet-Functionele Eisen | "CTRL + C" rustig afsluiten: De taak eerst afmaken voordat het programma afsluit.                                                                                                                                                                |
| Postconditie           | De gebruiker kan het programma op twee manieren afsluiten.<br>1. Geforceerd, Stopt het programma direct zonder de taak af te maken.<br>2. Elegant, Kan pas aangeroepen worden zodra de actieve taak klaar is.<br>                                |

| Naam                   | Maakt een backupbestand aan                                                                                                                                                                                                                                                                                       |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt 'new "backup2"' in de omgeving om een nieuw backupbestand aan te maken met de naam "backup2". Dit kan ook worden gedaan zonder de omgeving op te starten. Dan typt de gebruiker 'LBS -n "backup2"'. Zodra de gebruiker dit command heeft uitgevoerd zal er een nieuw bestand aangemaakt worden. |
| Uitzonderingen         | De gebruiker probeert een backupbestand aan te maken met dezelfde naam als een ander backupbestand, zodra dit gebeurt zal het programma deze command weigeren en een bericht tonen dat het niet succesvol is afgerond.                                                                                            |
| Niet-Functionele Eisen | Meerdere backupbestanden in een keer aanmaken.                                                                                                                                                                                                                                                                    |
| Postconditie           | De gebruiker kan in (en uit) de omgeving een nieuw backupbestand aanmaken.                                                                                                                                                                                                                                        |

| Naam                   | Backupbestand verwijderen                                                                                                                                                                                                                        |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Scenario               | De gebruiker typt 'delete backup2' in de omgeving om een bestaand backupbestand te verwijderen. Zodra de gebruiker dit typt zal het programma dit bestand verwijderen. Dit kan ook uit de omgeving, hierbij typt de gebruiker: 'LBS -d backup2'. |
| Uitzonderingen         | De gebruiker probeerd een niet bestand backupbestand te verwijderen. Het programma zal een bericht tonen dat het gegeven bestand niet bestaat.                                                                                                   |
| Niet-Functionele Eisen | Meerdere backupbestanden in een keer verwijderen.                                                                                                                                                                                                |
| Postconditie           | De gebruiker kan een backupbestand verwijderen.                                                                                                                                                                                                  |

| Naam                   | Het pad van backupbestand ophalen                                                                                                                                                                                                                                   |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt 'path backup2' om het bestandpad op te halen van het backupbestand. het programma zal hier het pad van het backupbestand tonen (zoals: "/usr/dev/documents/backup2"). Dit kan ook uit de omgeving gedaan kunnen met het command: 'LBS -p backup2' |
| Uitzonderingen         | De gebruiker probeert meerdere bestanden op te halen of een niet bestaand backupbestand. Zodra dit gebeurt zal het programma een bericht tonen dat het gegeven bestand niet een geldig bestand is.                                                                  |
| Niet-Functionele Eisen | Meerdere backupbestand's paden opzoeken.                                                                                                                                                                                                                            |
| Postconditie           | De gebruiker kan het pad van een backupbestand ophalen.                                                                                                                                                                                                             |

| Naam                   | Voegt een folder/bestand toe aan een backupbestand                                                                                                                                                                                                                                       |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt 'add backup2 /usr/dev/documents/file.txt', Het programma voegt de folder toe aan het bestand waardoor het backupbestand het gegeven bestand/folder heeft toegevoegd. Om het zonder de omgeving te doen typt de gebruiker: 'LBS -a Backup2 usr/dev/documents/file.txt'. |
| Uitzonderingen         | 1. De gebruiker probeert het pad van het programma in een backup bestand te zetten. <br>2. De gebruiker probeert een niet bestaand backupbestand te gebruiken.                                                                                                                           |
| Niet-Functionele Eisen | Meerdere bestanden/folders toevoegen.                                                                                                                                                                                                                                                    |
| Postconditie           | De gebruiker kan in de omgeving een folder of bestand toevoegen in een backupbestand                                                                                                                                                                                                     |

| Naam                   | Verwijderd bestand/folder uit backupbestand                                                                                                                                                                                                                                                                        |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Scenario               | De gebruiker typt 'remove backup2 /usr/dev/documents/file.txt' om een bestand uit een backupbestand te halen. Het programma gaat vervolgens kijken naar het gegeven bestand en haalt hem eruit indien gevonden. Om dit te doen buiten de omgeving typt de gebruiker: 'LBS -r backup2 /usr/dev/documents/file.txt'. |
| Uitzonderingen         | 1. Het gegeven backupbestand is niet geldig<br>2. Het gegeven bestand/folder zit niet in het backupbestand.                                                                                                                                                                                                        |
| Niet-Functionele Eisen | Meerdere bestanden/folders verwijderen.                                                                                                                                                                                                                                                                            |
| Postconditie           | De gebruiker kan bestanden en folders verwijderen uit een backupbestand. Dit kan worden gedaan in de LBS omgeving maar ook erbuiten.                                                                                                                                                                               |

| Naam                   | Hulp command uitvoeren                                                                                                                                                                |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker wilt te weten komen hoe een bepaalde command werkt, hiervoor typt de gebruiker: "help" in de omgeving. De gebruiker krijgt een lijst met command's die hij kan gebruiken |
| Uitzonderingen         | Geen                                                                                                                                                                                  |
| Niet-Functionele Eisen | Speciale formatting voor de hulp pagina                                                                                                                                               |
| Postconditie           | De gebruiker kan de hulp-pagina oproepen.                                                                                                                                             |

| Naam                   | Maakt een back-up aan                                                                                                                                                                                                                                                        |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt: 'backup backup2' om een backup te maken van alle bestanden en folders in het backupbestand op te slaan, het programma zorgt er voor dat de backup in de folder: '/usr/dev/backups/backup2' komt te staan (waar backup2 de naam van het backupbestand is). |
| Uitzonderingen         | De gebruiker probeert een backup uit te voeren met een ongeldig backupbestand die niet bestaat.                                                                                                                                                                              |
| Niet-Functionele Eisen | Meerdere backups tegelijk uitvoeren                                                                                                                                                                                                                                          |
| Postconditie           | De gebruiker kan een back-up maken die in '/usr/dev/backups/' komt te staan.                                                                                                                                                                                                 |

| Naam                   | Haalt een back-up op                                                                                                                                            |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruikter typt: 'fetch backup2' om alle bestanden van de back-up te over te schrijven in de plaats van de bestanden/folders die in het backupbestand staan. |
| Uitzonderingen         | Probeert een back-up op te halen die nog niet is gemaakt of die niet bestaat als backupbestand.                                                                 |
| Niet-Functionele Eisen | Meerdere back-ups ophalen.                                                                                                                                      |
| Postconditie           | De gebruiker kan een gemaakte back-up ophalen.                                                                                                                  |

| Naam                   | Haalt oude back-up terug                                                                                                                                                                        |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt: 'fetch -o backup2 2' om de 2e versie van de back-up op te halen, sinds alle backups een identificatienummer (ID) krijgen zullen alle geupdate back-ups een nieuw ID krijgen. |
| Uitzonderingen         | Probeert een versie op te halen die nog niet bestaat of een backupbestand te gebruiken die niet bestaat.                                                                                        |
| Niet-Functionele Eisen | Meerdere versies terug kunnen halen.                                                                                                                                                            |
| Postconditie           | De gebruiker kan oude versies terughalen van een gemaakte back-up op basis van een identificatienummer.                                                                                         |

| Naam                   | Haalt oude versies van een back-up op                                                                                                                                                                                                  |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt: 'versions backup2' om alle versies van een back-up op te halen. Elke nieuwe back-up maakt ook gelijk een nieuwe versie aan. Elke versie krijgt een nieuw identificatienummer. Die de gebruiker hier krijgt te zien. |
| Uitzonderingen         | De gebruiker wilt meerdere backupbestanden zijn back-up versies ophalen.                                                                                                                                                               |
| Niet-Functionele Eisen | Meerdere versies ophalen van verschillende backupbestanden.                                                                                                                                                                            |
| Postconditie           | De gebruiker kan alle versies van een backupbestand ophalen.                                                                                                                                                                           |

| Naam                   | Haalt de inhoud van een backupbestand op                                                                                                     |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Scenario               | De gebruiker typt: 'read backup2' om de inhoud van een backupbestand op te halen. Hierbij toont het programma alle bestanden in het bestand. |
| Uitzonderingen         | Probeert de inhoud van meerdere bestanden op te halen.                                                                                       |
| Niet-Functionele Eisen | Genummerde lijst van bestanden.                                                                                                              |
| Postconditie           | De gebruiker kan de inhoud van een backupbestand ophalen.                                                                                    |

# Planning

| Dag      | Fase                   | Taak                      |      Uren       |
| :------- | ---------------------- | :------------------------ | :-------------: |
| 21-9-26  | Requirements & Analyse | Projectplan               |        4        |
| 25-9-26  | Design                 | Functioneel ontwerp       |        4        |
| 28-9-26  | Design                 | Technisch ontwerp         |        2        |
| 29-9-26  | Testing                | Testcases                 |        2        |
| 29-9-26  | Testing                | testplannen maken         |        3        |
| 29-9-26  | Realisatie             | Programmeren              |        8        |
| 30-9-26  | Requirements & Analyse | Meeting met Product-Owner |        1        |
| 30-9-26  | Realisatie             | Programmeren              |        7        |
| 2-10-26  | Realisatie             | Programmeren              |        8        |
| 5-10-26  | Realisatie             | programmeren              |        8        |
| 7-10-26  | Testing                | Testen                    |        2        |
| 7-10-26  | Testing                | Testrapporten typen       | Tijdens testen* |
| 9-10-26  | Realisatie             | programmeren              |        8        |
| -        | -                      | Herfstvakantie            |        -        |
| 19-10-26 | Realisatie & Testing   | Bufferdag                 |        -        |
| 21-10-26 | Realisatie & Testing   | Bufferdag                 |        -        |
| 23-10-26 | Testing                | Testen                    |        8        |
| 25-10-26 | Oplevering             | Opleveren van Product     |        4        |

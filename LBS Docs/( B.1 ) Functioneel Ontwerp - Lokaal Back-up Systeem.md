Datum: 21 / 09 / 2026
# Inleiding
Dit document beschrijft het functioneel ontwerp van de command-line applicatie "lokaal back-up systeem" (LBS). De applicatie wordt gebruikt om lokaal een kopie te maken door gebruik te maken van de command-line. De gebruiker maakt gebruik van *backupbestanden* waar de paden van verschillende bestanden/folders in staan. Zodra een *backupbestand* wordt opgeroepen met de taak om een backup op te halen zal het programma de bestanden vervangen met de back-up die gemaakt is. Er komt ook een versiebeheer in het programma dat bijhoudt wat voor veranderingen er zijn gemaakt, dit doet de applicatie naast een *backupbestand* als een *versiebeheerbestand* hierin staan alle veranderingen en versies van de back-up. Met versiebeheer kan de gebruiker ook op basis van de versie de back-up terughalen (dus bijvoorbeeld versie **1.2** terughalen).

# Situatiebeschrijving
## Huidige Situatie
Momenteel om een back-up te maken voor meerdere bestanden moet je dit handmatig kopieren en plakken. Er is geen versiebeheer voor deze methode en kan ook niet oude versies terughalen. Er zijn natuurlijk wel applicaties die back-ups kunnen maken zoals: "FreeFileSync", "EaseUs Todo Backup", "Duplicati" en nog veel meer. Het probleem met deze applicaties is dat ze redelijk oud zijn en geen goeie documentatie hebben. Hierdoor is het moeilijk voor de meeste mensen om zo'n programma te gebruiken.

## Gewenste Situatie
Het systeem zal er voor moeten zorgen dat gebruikers gemakkelijk een back-up kan maken van een of meerdere bestand(en)/folder(s), dit wordt gedaan met *backupbestanden*. In de *backupbestanden* worden de paden van alle folders en bestanden opgeslagen. De gebruiker zal op een eenvoudige manier een bestandspad kunnen toevoegen aan zo'n bestand (dit zal ook handmatig gewijzigd kunnen worden). Zodra de gebruiker een backup maakt slaat het *versiebeheerbestand* alle veranderingen op in het bestand en geeft dit vervolgens een versienummer, met het versienummer kan de gebruiker oude versies terughalen van de backup. 

# Requirements 
In het document<u>( A.1 ) Projectplan</u> vind je in de MoSCoW tabel de requirements terug.

# Use-Case
##  Diagram


## Tabellen


# Activiteit Diagram


# Planning

| Dag      | Fase                   | Taak                      |      Uren       |
| :------- | ---------------------- | :------------------------ | :-------------: |
| 21-9-26  | Requirements & Analyse | Projectplan               |        4        |
| 25-9-26  | Design                 | Functioneel ontwerp       |        4        |
| 26-9-26  | Design                 | Technisch ontwerp         |        2        |
| 27-9-26  | Testing                | Testcases                 |        2        |
| 28-9-26  | Testing                | testplannen maken         |        3        |
| 28-9-26  | Realisatie             | Programmeren              |        8        |
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

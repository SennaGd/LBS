Datum: 27 / 09 / 2026

# Inleiding
Dit document beschrijft de technische architectuur en de realisatie van het Lokaal Back-Up Systeem, gebaseerd op de functionele eisen. In het document [[( B.1 ) Functioneel Ontwerp - Lokaal Back-up Systeem]] bevindt zich de informatie over de applicatie. De doelstelling van dit document is om de functionaliteiten/use-cases te realiseren en uit te pakken. De keuzes gemaakt in dit document zijn gebaseerd op de tijd gegeven voor het project (4 weken). 

# Plan van aanpak
In de applicatie LBS (Lokaal Back-Up Systeem) zijn er twee verschillende producten vastgesteld. Waarvan het hoofdproduct het LBS programma is en als zijproduct de documentatie website. 

### 1. Hoofdproduct LBS Programma
Het LBS programma is een Command-Line Applicatie dat in de terminal uitgevoerd wordt. Het programma heeft zijn eigen omgeving waar je in kan, de omgeving zelf hoef je niet in te gaan om het programma te gebruiken. Je kan het programma ook buiten de omgeving aanroepen. 
LBS zorgt er voor dat een back-up maken van meerdere bestanden eenvoudig gedaan kan worden. Hiervoor worden er backupbestanden aangemaakt. Die de gebruiker kan aanroepen om een back-up te maken/op te halen. Zodra een gebruiker een back-up maakt of update zal het programma de geupdate back-up een identificatienummer geven, hiermee kan de gebruiker ook oud versies terughalen. 

Soms kan het zijn dat de gebruiker niet weet wat hij moet typen. Hiervoor is er een hulp command voor de gebruiker. Deze command dient als hulpmiddel maar zal niet uitgebreid uitleg staan voor een command maar dient meer als basisinformatie. Voor een uitgebreidere uitleg zal de gebruiker naar de documentatiewebsite moeten gaan (<U>Zijproduct LBS Documentatie Website</U>).

### 2. Zijproduct LBS Documentatie Website
De documentatie website zal een website zijn waar er een uitgebreide gebruikershandleiding in zal staan. Hierbij kan de gebruiker command's opzoeken die voor het programma LBS zijn gemaakt. Deze website dient dus als gebruikershandleiding.

Voor de documentatiewebsite hoeft er niet getest te worden. Sinds het niet uit maakt als er bugs in de website zitten. Het dient alleen om goed tekst te laten zien.
## Planning

| Dag      | Fase                   | Taak                      |                                                                                                                                                                                                                                    |      Uren       |
| :------- | ---------------------- | :------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------: |
| 21-9-26  | Requirements & Analyse | Projectplan               | Een volledig Project plan hebben opgesteld. Met een MoSCoW, Fasering, Planning en een kort maar krachtig uitleg over het project en het gewenste resultaat.                                                                        |        4        |
| 25-9-26  | Design                 | Functioneel ontwerp       | De functionele eisen vaststellen met de gewenste situatie. In het document bevindt zich ook een complete use-case diagram/scenario's.                                                                                              |        4        |
| 28-9-26  | Design                 | Technisch ontwerp         | De technische randvoorwaarden worden vastgesteld in het technisch ontwerp, met een duidelijk beeld wat voor ontwikkel-methodes/programeertalen er worden gebruikt. Hierbij komt ook de architectuur van het programma in te staan. |        2        |
| 29-9-26  | Testing                | Testcases                 | In het bestand komen de testcases van het programma te staan om specifieke situaties te testen.                                                                                                                                    |        2        |
| 29-9-26  | Testing                | Testplan                  | In het tesplan wordt er uitgelegd waarom, hoe, wie, wat en waar de testcases worden getest. Het document omschrijft hoe het testen zich zal uitoefenen.                                                                            |        3        |
| 29-9-26  | Realisatie             | Project Opzetten          | Hier wordt het project opgestart, hierbij zal het project opgezet moeten worden. Dus de ontwikkelmethode, programmeertalen en github-repository zullen moeten opgezet worden.                                                      |       0.5       |
| 29-9-26  | Realisatie             | Programmeren              |                                                                                                                                                                                                                                    |        8        |
| 30-9-26  | Requirements & Analyse | Meeting met Product-Owner | Een gesprek houden met de product-owner om afspraken te maken om wekelijks een uur te plannen om ontwikkelingen te laten zien en actief feedback te krijgen                                                                        |        1        |
| 30-9-26  | Realisatie             | Programmeren              |                                                                                                                                                                                                                                    |        7        |
| 2-10-26  | Realisatie             | Programmeren              |                                                                                                                                                                                                                                    |        8        |
| 5-10-26  | Realisatie             | programmeren              |                                                                                                                                                                                                                                    |        8        |
| 7-10-26  | Testing                | Testen                    | Het testen van de applicatie met een aantal willekeurige klasgenoten. Zij zullen actief feedback geven op de applicatie dat zich in het test-rapport zal bevinden                                                                  |        1        |
| 7-10-26  | Testing                | Testrapporten typen       | Het testrapport wordt actief getypt wanneer het testen bezig is.                                                                                                                                                                   | Tijdens testen* |
| 9-10-26  | Realisatie             | programmeren              |                                                                                                                                                                                                                                    |        8        |
| -        | -                      | Herfstvakantie            |                                                                                                                                                                                                                                    |        -        |
| 19-10-26 | Realisatie & Testing   | Bufferdag                 | Het afmaken van achterstanden en het testen van de applicatie.                                                                                                                                                                     |        -        |
| 21-10-26 | Realisatie             | Bufferdag                 | Het afmaken van achterstanden. Indien het LBS programma af is zal er worden gewerkt aan de documentatiewebsite.                                                                                                                    |        -        |
| 23-10-26 | Testing                | Testen                    | het testen van de applicatie                                                                                                                                                                                                       |        8        |
| 25-10-26 | Oplevering             | Opleveren van Product     | Het product overdragen aan de product owner.                                                                                                                                                                                       |        4        |

# Interfaces

### LBS
1. LBS Omgeving
	In de LBS omgeving zal het programma actief aan zijn. Hierbij kan de gebruiker een command typen en uitvoeren zodra er op "enter" wordt gedrukt. Wanneer dit gebeurt zal het systeem actief informatie laten zien als pure text.
2. Terminal
	In de terminal kan LBS ook kunnen aangeroepen worden. Hierbij zal er een andere wijze zijn van hoe de command's worden getypt. Het programma zal net als in de omgeving actief informatie tonen in de vorm van tekst.
### Backupbestanden
LBS regelt het uitlezen van de backupbestanden. De backupbestanden zijn op zichzelf tekst bestanden. Elke lijn in een backupbestand is een bestandspad of een folderspad. LBS weet wanneer het gegeven pad een folder/bestand is door te kijken of er een "." in de lijn staat.
Elke bestand/folder heeft een "identificatie" achter het pad hebben. Dit kan zijn "FILE" of "FOLDER".

Hieronder is een voorbeeld van een backupbestand
```
BACKUP

FILE /usr/dev/documents/file1.txt
FOLDER /usr/dev/documents/folder
FILE /usr/dev/documents/file2.txt
FILE /usr/dev/documents/file3.txt
```

### Versiebeheerbestanden
In het versiebeheerbestand staan alle veranderingen in van elke versie. LBS regelt het versiebeheer. Zodra een back-up geupdate is zal lbs de vorige versie vergelijken met de nieuwe geupdate back-up. Elke versie krijgt een identificatienummer (ID), deze wordt getypt als: `[1]` voor elke update zal de nieuwe versie het vorige identificatienummer + 1  worden. Het versiebeheerbestand is ook net als het backupbestand geschreven in tekst.
Voor elk bestand komt FILE voor te staan, hierdoor weet LBS welk bestand er werd aangepast. Voor elke lijn die aangepast is zal er een "+" of een "-" zijn, deze tekens betekenen of er een lijn is aangepast/toegevoegd. Het nummer dat na de +/- komt is de lijn dat aangepast is. Als er een lijn is aangepast dat alle andere lijnen een lijn naar onder brengt zullen al deze lijnen een nieuw lijnnummer krijgen. 

Hieronder is een voorbeeld van een versiebeheerbestand
```
VERSIONCONTROL

[1]
FILE /usr/dev/documents/file.txt
+1 Hello there
+2 Made by Senna
+3 This is a line

[2]
FILE /usr/dev/documents/file.txt
-2 Made by Senna

[3]
FILE /usr/dev/documents/file.txt
+1 Hello there user!
+2 This is not a line!!!!

[4]
FILE /usr/dev/documents/file.txt
+1 Hello there user!
+2 Made by Administrator 
+3 This is not a line!!!!
```
# Ontwikkelomgeving

### Technischeinfrastructuur
- beveiliging;
- opslag van data;
- cloudservices of lokale omgeving;
- vereiste software en runtime.
#### Schema's
##### Systeemarchitectuur

##### Componentendiagram

### Ontwikkeltools


# Activiteit Diagram
![image](./images/ActivityDiagram.png)
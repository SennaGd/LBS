Datum: 30 / 09 / 2026
# Testplan Lokaal Back-up Systeem (LBS)

## Inleiding

Het doel van dit testplan is het vaststellen van de teststrategie, de benodigde middelen en de planning van het testen. Dit document dient als richtlijn/gids voor de software developers die er voor zullen zorgen dat het Lokaal Back-up Systeem (LBS) voldoet aan alle gestelde eisen uit het functioneel ontwerp. Dit document is opgesteld voor de testers, ontwikkelaars en opdrachtgevers.

Dit document betreft de concept versie 1.0 van het testplan voor het Lokaal Back-up Systeem (LBS).

## Opdrachtsformulering

Het doel van het testen is valideren dat gebruikers via de command-line op een eenvoudige manier backupbestanden kunnen aanmaken, beheren en uitvoeren. Daarnaast wordt getoetst of het versiebeheerbestand veranderingen en versies correct bijhoudt, en of oude versies van een back-up succesvol teruggehaald kunnen worden.

De tijdsduur van het testen bedraagt circa 20 tot 30 minuten per testsessie. Er wordt gekeken naar zowel de omgeving (LBS) als het direct meegeven van argumenten via de terminal.

## Rapportage

Zodra er wordt getest zullen er twee documenten worden aangemaakt, dit zijn: het testrapport en het testresultaat. Deze documenten dienen als overzicht voor de product-owner, opdrachtgevers en software-developers.

In het testrapport wordt beschreven wat er is gebeurd tijdens het testen, waarom dit zo is gebeurd en of dit de gewenste situatie is die volgens de testcases beschreven staat. Door het schrijven van de testrapporten kunnen software-ontwikkelaars de software steeds verder verbeteren. Ook krijgen de productowners/opdrachtgevers zo goed inzicht in wat er is gebeurd tijdens het testen.

Het testresultaat is een samenvatting van de behaalde en niet-behaalde testcases. Hierin wordt beschreven wat er wel en niet goed ging tijdens het testen.

Het testrapport wordt door een software-ontwikkelaar bijgehouden tijdens het testen. Hierbij zal hij de acties van de tester beschrijven. Elk testrapport krijgt een unieke identificatie volgens het template: **Dag-Maand-Rapportnummer**.

## Afbakening

Het systeem dat wordt getest is de command-line applicatie LBS. In de [Opdrachtsformulering](#opdrachtsformulering) wordt beschreven wat er wordt getest. Voor het uitvoeren van de testen dient het document met testcases erbij te worden gehouden.

Belangrijke informatie:

1. De tester maakt gebruik van een computer of laptop met een terminal-omgeving (zoals Bash, Zsh of Command Prompt).

2. De testen worden uitgevoerd in de LBS-omgeving zelf en direct via command-line argumenten buiten de omgeving.

**Gebruiker:**
De tester voert opdrachten uit om backupbestanden aan te maken, te bekijken, te wijzigen en te verwijderen. Ook voert de tester back-ups uit, vraagt hij de versies op en haalt hij oude versies van back-ups terug.

## Taken en Verantwoordelijkheden

* **Tester:** Voert de opdrachten uit zoals beschreven in de testcases en geeft feedback bij afwijkingen.

* **Software-ontwikkelaar / Testgever:** Begeleidt de test, documenteert de acties van de tester in het testrapport en stelt het testresultaat op.

* **Product Owner:** Beoordeelt de testresultaten en bepaalt of de functionaliteit akkoord is voor oplevering.

## Overzicht producten, kwaliteitseisen en stopcriteria

**Hieronder bevindt zich een samengevatte lijst van de testcases, de tester zal moeten testen op al deze cases.**

##### TC-01-01 - Start programma omgeving op

De tester opent de terminal en typt `LBS` om de omgeving te starten. Ook test de tester het direct meegeven van argumenten (`LBS -f backup`).

##### TC-01-02 - Sluit het programma af

De tester test het afsluiten van het programma via `exit` (na voltooiing van taken) en via `CTRL + C` (geforceerd stoppen).

##### TC-02-01 - Maakt een backupbestand aan

De tester maakt een nieuw backupbestand aan via `new "backup2"` binnen de omgeving en via `LBS -n "backup2_extern"` buiten de omgeving. Er wordt ook getest op dubbele namen.

##### TC-02-02 - Backupbestand verwijderen

De tester verwijdert een bestaand backupbestand via `remove backup2` en test wat er gebeurt bij een niet-bestaand bestand.

##### TC-02-03 - Het pad van backupbestand ophalen

De tester vraagt het pad van een backupbestand op met `path backup2` en via `LBS -p backup2`.

##### TC-03-01 - Voegt een folder/bestand toe aan een backupbestand

De tester voegt een bestand of map toe aan een backupbestand met `add backup2 /usr/dev/documents/file.txt`. Er wordt getest of het toevoegen van het LBS-programma zelf wordt geweigerd.

##### TC-03-02 - Verwijderd bestand/folder uit backupbestand

De tester verwijdert een bestand uit een backupbestand met `remove -f backup2 /usr/dev/documents/file.txt`.

##### TC-03-03 - Haalt de inhoud van een backupbestand op

De tester bekijkt de inhoud van een backupbestand via `read backup2`.

##### TC-04-01 - Maakt een back-up aan

De tester voert een back-up uit met `backup backup2`. Er wordt gecontroleerd of de bestanden naar `/usr/dev/backups/backup2` worden gekopieerd en of het versiebeheerbestand wordt bijgewerkt.

##### TC-04-02 - Haalt een back-up op

De tester haalt de meest recente back-up op via `fetch backup2` en controleert of de originele bestanden worden overschreven.

##### TC-04-03 - Haalt oude back-up terug

De tester haalt een specifieke oude versie van een back-up op met `fetch -o backup2 2` op basis van het versienummer.

##### TC-04-04 - Haalt oude versies van een back-up op

De tester vraagt alle gemaakte versies van een back-up op met `versions backup2`.

##### TC-05-01 - Hulp command uitvoeren

De tester vraagt het overzicht van beschikbare commands op via `help`.

## Testomgeving

De tester maakt gebruik van een eigen laptop of pc met terminal-toegang. De applicatie LBS dient vooraf te zijn geïnstalleerd en beschikbaar te zijn via het pad in de terminal.

## Versiebeheer

Voor elke test wordt er een nieuw document opgesteld door de testgever. Hierin worden de datum, het rapportnummer en de naam van de tester vastgelegd om dubbele bestanden of verwarring te voorkomen.
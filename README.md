# Über

Dieses Image basiert auf [ubuntu:trusty](https://registry.hub.docker.com/_/ubuntu/).

Es wird für die Bereitstellung von PHP Webapplikationen verwendet.
Es tut nicht viel mehr als die gängigsten PHP Pakete zu installieren, sowie eine geeignete php.ini hinzuzuladen.

Möchte man bestimmte Befehle beim starten des Containers ausführen, ehe das run.sh Script geladen wird, speichert man dieses Shell-Script unter `/extra/init`.
Dieses Script darf nicht im Vordergrund stehen bleiben, da sonst die `run.sh` nicht gestartet wird.

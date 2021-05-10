M80
T3		;Select tool

M291 P"Déchargement en cours, veuillez patienter..." R"Changement du Filament" S0 T30

;G1 E10 F150     ;Extrude 10mm filament at low speed
;G1 E-100 F3600	;Retract 100mm filament at high speed
G4 S10
M400

while iterations < 5 ;;sensors.filamentMonitors[0].filamentPresent == true
    M291 P"Merci de retirer le filament." R"Changement du Filament" S0 T30
    G4 S1  ;attendre 0.1s pour éviter de surcharger le processeur
while true
    if iterations < 5 ;;sensors.filamentMonitors[0].filamentPresent == false
        M291 P"Filament déchargé, merci d''insérer le nouveau filament." R"Changement du Filament" S0 T30
        G4 S1  ;attendre 0.1s pour éviter de surcharger le processeur
    else
        break
G4 S1  ;attendre 1s pour laisser le temps d'insérer le filament

M291 P"Chargement en cours...." R"Changement du Filament" S0
M106 S255  ;mise en route du ventilateur pour refroidir la purge
;;G1 E65 F3600	; extrude 65mm at high speed
M83     	; mode d'extrusion relative
;;G1 E10 F200	; extrude 10mm at low speed
M400
M98 P"/macros/Filament/Autre/Purge.g"
M291 P"Chargement terminé. Merci de nettoyer la buse, appuyez ensuite sur ""ok"". Vous pouvez reprendre l'impression." R"Changement du filament" S2
# Checklist déploiement Action1 - cocher au fur et à mesure

## J1 - Compte
- [ ] Compte créé sur action1.com/free-edition
- [ ] 2 PC pilotes visibles dans Endpoints
- [ ] Test déploiement : Chrome sur 1 PC pilote
- [ ] Test patch : scan vulnérabilités lancé

## J2 - Politiques
- [ ] Groupe `Tous-PC` créé
- [ ] Groupe par service créé (Compta, Accueil, Direction...)
- [ ] Politique `Base` : Chrome, 7-Zip, VLC, Adobe Reader en auto-update
- [ ] Politique patch : auto-approve critiques + redémarrage hors heures (ex: 12h-14h)
- [ ] Alertes mail activées (disque <10%, AV absent, patch >30j)

## J3 - Généralisation
- [ ] Script install-agent.ps1 personnalisé avec votre URL
- [ ] Agent diffusé (mail / USB / dossier partagé \\srv\deploy)
- [ ] inventaire-parc.csv complété (utilisateur, service, garantie)
- [ ] Rapport mensuel programmé (Inventory + Missing patches → mail)

## Recettes commandes silencieuses fréquentes
- Chrome MSI : `msiexec /i chrome.msi /qn`
- VLC : `vlc.exe /S`
- 7-Zip : `7z.exe /S`
- Adobe Reader : `msiexec /i AcroRead.msi /qn`
- Firefox : `Firefox-setup.exe /S`

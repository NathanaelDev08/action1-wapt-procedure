# Procédure de déploiement — Action1 & parc

Checklist et scripts pour mettre en place l'inventaire et le déploiement
logiciel quand **on n'a ni accès admin Microsoft, ni serveur, et zéro budget**.

C'est le cas d'école de beaucoup de PME : le domaine existe, mais pas les
droits d'administration dessus. Ce dépôt décrit ce qu'on peut faire malgré tout,
et ce qu'on ne peut pas.

## Contenu

| Fichier | Rôle |
|---|---|
| `procedure-action1.md` | Checklist de déploiement jour par jour, à cocher au fur et à mesure |
| `scripts/inventaire-rapide.ps1` | Audit d'un poste sans installer d'agent |
| `scripts/install-agent.ps1` | Installation silencieuse de l'agent Action1 |

## Pourquoi ce dépôt

Sur un parc sans Active Directory, il n'y a ni GPO, ni SCCM, ni WSUS. On se
retrouve à la fois avec **rien** pour déployer et avec le besoin de tout
inventorier. Deux réponses open source couvrent ce besoin : **GLPI + WAPT**
(voir le dépôt [`glpi-wapt`](https://github.com/NathanaelDev08/glpi-wapt)), et **Action1**
en édition gratuite pour un parc réduit.

Ce dépôt documente la seconde, parce qu'elle demande zéro infrastructure.

## Limites asumées

- L'édition gratuite d'Action1 est plafonnée en nombre de postes
- L'inventaire passe par un agent à installer sur **chaque** machine
- Sans domaine ni droit admin, tout se fait en exécution locale, poste par poste
- Le script d'audit ne remonte rien tout seul : il produit un CSV, à consolider

## Avertissement

Le fichier d'inventaire réel n'est **pas** dans ce dépôt : il contient des noms
de personnes et des numéros de série de machines. Seuls les scripts et la
procédure sont publiés.

## Licence

Usage libre. Adaptez les scripts à votre propre parc.

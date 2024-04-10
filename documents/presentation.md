Le contenu attendu des présentation et rapports intermédiaires est:

- présentation du langage et motivation du choix
- aspects particuliers, exemples
- choix du projet et motivation
- aperçu du cahier des charges

Le temps alloué est au maximum de 15 minutes, le contenu du rapport de 4 pages au maximum.


# Présentation du langage
Nous avons choisi le langage `Uiua`. C'est un langage de programmation orienté liste et basé sur l'utilisation d'un stack. Il est fortement influencé par `APL` et `BQN`. Le langage est à la fois interprétable et compilable. L'interpréteur et le compilateur sont écrit en `Rust` et est disponible sur [`crates.io`](https://crates.io/crates/uiua). Il est aussi intégrable en tant que librairie dans un projet `Rust`.

Il est très concis et permet d'effectuer des opérations sur des listes d'éléments plutôt que sur des éléments individuels.

La plupart des fonctions intégrées à Uiua sont représentées par des symboles, ce qui rend la lecture du code plus difficile mais permet de réduire la taille du code. Les symboles sont toutefois choisis pour repésenter au mieux la fonction (example `sin` est associé à `∿`).

Afin de ne pas avoir à utiliser un clavier spécial, les fonctions sont aussi accessibles via leur nom. L'outil de compilation permet d'automatiquement remplacer les noms par les symboles correspondants. 

Malgré les symboles, l'intégration aux environnements de développement permet de voir les symboles sous forme de texte ainsi qu'une partie de la documentation associée.

## Types de données
Uiua ne possède que quelques types de données: les nombres, les charactères, les listes et les "box". Les nombres peuvent être des entiers, des flottants et des nombres complexes. Les caractères sont des caractères unicode. Les listes sont des listes d'éléments de même type. Et les "box" permettent de stocker des éléments de différents types dans une même liste. Un grande partie des fonctions sont dites "pervasives" afin de pouvoir manipuler une liste de box sans avoir besoin de les déballer.

Les chaines de caractères sont représentées par des listes de charactères mais du sucre syntaxique est disponible pour les déclarer. Une liste de box peut aussi être déclarée de manière plus lisible.

## Fonctions
Les fonctions sont définies par des symboles ou des noms. Il n'a pas de paramètres nommés: ils sont directement extraits du stack et les valeur de retour sont placées sur le stack. La plupart du temps la signature est inférée par le compilateur mais il est parfois nécessaire de spécifier le nombre de paramètres attendus et retournés (par example pour les fonctions récursives).

## Fonctions système
Uiua possède un certain nombre de fonctions système qui permettent d'accéder à des fonctionnalités de bas niveau (système de fichiers, sockets, appel de commandes) ainsi que des fonctions pour différent types de médias (images, sons et gifs).

### Foreign Function Interface
Il est aussi possible d'appeler des fonctions définies dans des librairies externes. Cela permet d'étendre les fonctionnalités de Uiua en utilisant des librairies écrites en Rust, C ou C++ par exemple.


# Utilisation du langage
Notre but est de créer un programme permettant de générer des images de manière
paramétrique grâce à une librairie permettant une interface graphique tel que rayLib ou Dear
ImGui. Uiua permet l'utilisation de « Foreign Function Interface » qui vont être nécessaire à
l'utilisation de ces librairies. En fonction de la librairie choisie, ces FFI devront être implémentées
par nos soins.
Le principe est de permettre à l'utilisateur de pouvoir profiter des avantages de Uiua dans la
génération d'images à travers une interface graphique simple à utiliser.
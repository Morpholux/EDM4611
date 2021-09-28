EDM4611
=======

Contenu du cours «Image de synthèse et interactivité : processus génératifs»<br>
UQAM - Université du Québec à Montréal<br>
Programme de Baccalauréat en médias interactifs<br>
Session automne 2021

Enseignant : <a href="mailto:renaud.jean-francois@uqam.ca">Jean-François Renaud</a> (professeur)

<br>
_ _ _

<br>
<br>

![Our Medium is Computation](https://dl.dropboxusercontent.com/s/hsvcnobh727vwki/medium_is_computation.jpg
"Citation tirée d’une conférence donnée par Jessica Rosenkrantz")

Ce cours forme aux méthodes computationnelles de fabrication d’images, de l’étape de leur conception jusqu’à leur diffusion. L’étudiant-e sera amené-e à réaliser des systèmes générateur d’images ou de rendus, ce qui sous-tend de réaliser des micro-programmes en mettant à contribution les ressources de calcul et d’automatisation d’un ordinateur. Comme l’expriment très bien Jessica Rosenkrantz et Jesse Louis-Rosenberg, les fondateurs de l’entreprise <i>Nervous System</i>, la distinction fondamentale qui doit être faite entre les médias traditionnels en création médiatique et ceux qui seront abordés dans ce cours repose sur l’exploitation de la <i>computation</i> à des fins créatives.

Le code est notre média.

<br>
_ _ _

<br>
<br>

Liens vers d’autres repositoires GitHub dignes de mention :<br>
• [Morphogenesis resources, de Jason Webb](https://github.com/jasonwebb/morphogenesis-resources)<br>
On y retrouve une compilation très complète de bon nombre de procédés algorithmiques en usage dans la création de formes visuelles.

<br>
_ _ _

<br>
<br>

### Description des six travaux d’atelier
Ci-dessous, vous trouverez un aperçu des travaux demandés en première partie du cours. Les explications demeurent sommaires et les illustrations ne doivent pas être interprétées comme un résultat idéal ou le type d’image attendu par l’enseignant. Nous aurons l’occasion de démontrer la grande variété des possibilités de rendu que présente chacune des thématiques.

<br>
<br>

E1 . **Motifs 2D** - Matière vue à la semaine 2 et remise de l’exercice la semaine suivante

![Motif de dallage](https://dl.dropboxusercontent.com/s/nm8jseaghx0yd1y/motif_dallage.jpg
"Construction d’un motif 2D, avec illusion 3D")

• Création d’un motif graphique et donc d’une structure présentant des règles précises de distribution appliquées à diverses formes simples. Le niveau d’ordre ou de désordre apparent est au choix. Certains règles de constitution du motif doivent permettre des variations, de telle sorte que l’on accède facilement à la création d’un nombre illimité de cas. Cet accès s’effectue dans la prise en main et le contrôle de <i>paramètres</i>.

Notions à considérer :

`Approches itératives, boucles imbriquées, technique des instances dans TouchDesigner (instancing), transformateurs géométriques, gestion de la couleur`

<br>
<br>

E2 . **Visualisation d’échantillons (données)** - Matière vue à la semaine 3 et remise de l’exercice la semaine suivante

![Pseudo data](https://dl.dropboxusercontent.com/s/fptnedrfzjh9myh/pseudo_data.jpg
"Visualisation de données aléatoires")

• Exploitation d’une collection de valeurs sous divers formats (nombres binaires, fractions, entiers, chaînes de caractères, signaux numériques) dans le but de produire une représentation visuelle riche et détaillée. L’image est la conséquence directe des données qui la génère. Évidemment, on tente de recourir à d’autres méthodes d’affichage que celles des graphiques offerts dans un tableur (histogramme à barres, pointes de tarte). Par ailleurs, on examinera la manipulation de données provenant de fichiers externes ou celles émanant de générateurs pseudo-aléatoires.

Notions à considérer :

`Data parsing, nombres aléatoires et bruit procédural (random et noise), structures de distribution, probabilités et calculs statistiques`

<br>
<br>

E3 . **Figures géométriques et organiques** - Matière vue à la semaine 4 et remise de l’exercice la semaine suivante

![Structure folioles](https://dl.dropboxusercontent.com/s/967i1011w1vv3e4/folioles.jpg
"Structuration des folioles d’une feuille")

• Exploration des méthodes de constitution de figures paramétriques 2D ou 3D. Examen des grandes familles de tracés : linéaires, courbes (bézier ou Spline). Création de figures en mode contour ou par remplissage. Contrôle des points d’ancrage et des leviers, de jonctions et de terminaisons. On tente de comparer les méthodes de production de figures polygonales géométriques simples (primitives) avec celles des figures plus organiques (tracés courbes, formes irrégulières).

Notions à considérer :

`dessin vectoriel, vertex(), curve(), bezier(), curveVertex(), bezierVertex(), SVG, PDF, Point SOP`

<br>
<br>

E4 . **Scène 3D minimaliste** - Matière vue à la semaine 5 et remise de l’exercice la semaine suivante

![Mobiles en 3D](https://dl.dropboxusercontent.com/s/xjuftbmvajy3wcn/objet_3d.jpg
"Mobiles suspendus")

• Réalisation d’une scène 3D minimaliste, mais suffisamment complexe pour aborder le potentiel des procédés dans ce genre d’environnement. Gestion des modèles, des textures pouvant être appliquées, du point de vue et des mouvements de la caméra, des éclairages et de ses types de lumière. Le gestion des textures peut devenir complexe, sans compter le traitement des surfaces et les propriétés des matériaux, qui recoupent des notions de <i>shading</i>.

Notions à considérer :

`Espace 3D, SOPs, types de géométries, éclairage, texturage, caméras, coordonnées UV, navigation, quelques opérateurs MAT (Constant, Line et Phong)`

<br>
<br>

E5 . **Tracés de particules** - Matière vue à la semaine 6 et remise de l’exercice la semaine suivante

![Tracés résultant du déplacement de particules](https://dl.dropboxusercontent.com/s/56f5y9ergm3cwhe/traces_particules.jpg
"Système de particules")

• Générateur de particules et gestion du comportement de déplacement d’un point à travers les paramètres du système. Exploration de la trace comme outil de dessin. Compréhension de l’utilisation des forces et des principes sous-jacents (vecteurs). Évaluation des possibilités de production d’images complexes et d‘effets spéciaux reposant sur ces procédés.

Notions à considérer :

`Système de particules, vecteurs (PVector) et normales, naissance et mort d’une particule (propriété Life), application de forces, traces et feedback`

<br>
<br>

E6 . **Mouvement et styles d’animation** - Matière vue à la semaine 7 et remise de l’exercice à la semaine 9

![Police de caractères animée](https://dl.dropboxusercontent.com/s/4t3zu7ojzf265fc/animation_typo.jpg
"Animation typographique")

• Les méthodes d’animation dans les logiciels d’intégration en temps réel requièrent d’être peaufinées, sans quoi les transformations sont strictement mécaniques (interpolation linéaire). Exploration des stratégies d’animation, avec ou sans keyframes, mais en regard des procédés de <i>tweening</i> et d’<i>easing</i> (soit les fonctions d’amortissement). Développement de quelques mouvements typiques, dans l‘esprit du site [Patatap](https://patatap.com/).

Notions à considérer :

`Transformations d’un état dans le temps, Interpolations et fonctions d’amortissement, images clés, timmer, lookup table, chemin et pas d’animation`

<br>
<br>

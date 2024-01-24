## Exercice 1

LazyVGrid est un conteneur SwiftUI qui organise son contenu en colonnes verticales. Son point fort réside dans son "chargement différé", une technique qui améliore significativement les performances en ne chargeant que les éléments visibles à l'écran.

Fixed: Ces colonnes ont une largeur fixe, définie et immuable, quelle que soit la taille disponible.
Flexible: Ici, les colonnes s'adaptent à l'espace disponible. Vous fixez une largeur minimale, mais elles peuvent s'étendre si nécessaire, ce qui les rend idéales pour s'ajuster aux diverses tailles d'écran.
Adaptable: Un mix des deux premiers types, ces colonnes commencent avec une largeur fixe mais peuvent s'étendre, comme les colonnes flexibles, jusqu'à une certaine limite.
Dans votre cas, l'utilisation de colonnes flexibles est judicieuse car elles permettent aux images de s'adapter harmonieusement à la largeur de l'écran, quel que soit sa taille.

Les images occupent toute la largeur de l'écran car les colonnes flexibles s'adaptent à l'espace disponible. En définissant une largeur minimale de 150 pixels, les colonnes s'étendent pour occuper tout l'espace horizontal, donnant ainsi aux images un affichage plein écran.

## Exercice 2
Explication du Modificateur : 

```
extension Image {
    // Définition d'une nouvelle fonction 'centerCropped' pour l'extension de 'Image'.
    func centerCropped() -> some View {
        // Utilisation de 'GeometryReader' pour accéder aux dimensions de l'espace d'affichage.
        GeometryReader { geo in
            // 'self' fait référence à l'instance actuelle de 'Image'.
            self
                .resizable() // Rend l'image redimensionnable.
                .scaledToFill() // Ajuste l'image pour qu'elle remplisse complètement l'espace, en maintenant son ratio.
                .frame(width: geo.size.width, height: geo.size.height) // Définit le cadre de l'image en fonction des dimensions du 'GeometryReader'.
                .clipped() // Coupe l'image pour s'adapter au cadre, en supprimant les parties qui dépassent.
        }
    }
}




Cette extension Image ajoute la fonction centerCropped à toutes les instances de Image dans SwiftUI. Elle permet à une image de se redimensionner pour remplir entièrement l'espace disponible, tout en préservant son ratio d'aspect. Les parties de l'image qui débordent du cadre défini sont rognées.
Personnellement, moi, j'ai tout compris grâce à ça car mes images se rentraient dedans et c'était vraiment moche. Après avoir analysé ça, les images se sont bien positionnées.

# Appel Réseau

## Exercice 3

async/await :

C'est une nouveauté de Swift 5.5 qui simplifie l'écriture de fonctions asynchrones. Le code ressemble beaucoup à une séquence synchrone, ce qui le rend plus clair et facile à suivre. Il intègre une gestion naturelle des erreurs avec les blocs do/catch.

Combine : 

Combine est un outil puissant pour gérer des flux de données asynchrones. Il est parfait pour créer des interactions complexes basées sur des séquences d'événements, offrant ainsi une approche plus réactive à la programmation.

completionHandler et GCD
completionHandler : C'est une approche classique où vous passez une fonction (le completionHandler) à une autre fonction. Cette fonction est appelée une fois l'opération asynchrone terminée.
GCD : Grand Central Dispatch permet de gérer la concurrence de manière bas niveau. Il offre un contrôle précis sur l'exécution asynchrone, mais peut complexifier le code.

Différences : 

async/await brille par sa simplicité et sa lisibilité, contrairement à GCD et completionHandler qui peuvent alourdir le code.
Combine se concentre sur la programmation réactive pour gérer des scénarios où de multiples flux de données interagissent.
GCD donne un contrôle fin sur les opérations asynchrones, mais avec une complexité accrue.

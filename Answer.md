## Exercice 1

LazyVGrid est un conteneur SwiftUI qui organise son contenu en colonnes verticales. Son point fort réside dans son "chargement différé", une technique qui améliore significativement les performances en ne chargeant que les éléments visibles à l'écran.

Fixed: Ces colonnes ont une largeur fixe, définie et immuable, quelle que soit la taille disponible.
Flexible: Ici, les colonnes s'adaptent à l'espace disponible. Vous fixez une largeur minimale, mais elles peuvent s'étendre si nécessaire, ce qui les rend idéales pour s'ajuster aux diverses tailles d'écran.
Adaptable: Un mix des deux premiers types, ces colonnes commencent avec une largeur fixe mais peuvent s'étendre, comme les colonnes flexibles, jusqu'à une certaine limite.
Dans votre cas, l'utilisation de colonnes flexibles est judicieuse car elles permettent aux images de s'adapter harmonieusement à la largeur de l'écran, quel que soit sa taille.

Les images occupent toute la largeur de l'écran car les colonnes flexibles s'adaptent à l'espace disponible. En définissant une largeur minimale de 150 pixels, les colonnes s'étendent pour occuper tout l'espace horizontal, donnant ainsi aux images un affichage plein écran.

## Exercice 2
Explication du Modificateur : 


```swift
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
}```


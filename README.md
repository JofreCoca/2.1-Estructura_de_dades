# Descripció - Enunciat de l'exercici

Nivell 1
- Exercici 1

L'òptica "Cul d'Ampolla" vol informatitzar la gestió dels seus clients i vendes d'ulleres. Per això, necessita organitzar i emmagatzemar la informació següent:

Proveïdors

Dades a registrar:
Nom
Adreça (carrer, número, pis, porta, ciutat, codi postal i país)
Telèfon
Fax
NIF
Política de compres:
Cada marca d'ulleres s'assignarà a un únic proveïdor.
Un proveïdor pot subministrar ulleres de diverses marques.
Ulleres

Dades a registrar:
Marca
Graduació de cada vidre
Tipus de muntura (flotant, pasta o metàl·lica)
Color de la muntura
Color de cada vidre
Preu
Clients

Dades a registrar:
Nom
Adreça postal
Telèfon
Correu electrònic
Data de registre
Referència del client que els ha recomanat (si escau)
Vendes

Dades a registrar:
L’empleat/da responsable de la venda de cada ullera.
Aquest sistema permetrà una gestió centralitzada i eficient dels proveïdors, productes, clients i transaccions.

- Exercici 2

Clients

Informació a emmagatzemar:
Identificador únic
Nom
Cognoms
Adreça
Codi postal
Localitat
Província
Número de telèfon
Relació amb localitats i províncies:
Les dades de localitats i províncies es gestionen en taules separades.
Una localitat pertany a una única província.
Una província pot tenir moltes localitats.
Localitat:
Identificador únic
Nom
Província:
Identificador únic
Nom
Comandes

Informació a emmagatzemar:
Identificador únic
Data/hora
Tipus de comanda (domicili o recollida a botiga)
Quantitat de productes seleccionats
Preu total
Relacions:
Una comanda pertany a un únic client.
Una comanda pot incloure diversos productes.
Una comanda és gestionada per una única botiga.
Productes

Tipus de productes:
Pizzes, hamburgueses i begudes.
Informació comuna a tots els productes:
Identificador únic
Nom
Descripció
Imatge
Preu
Relacions especials per a pizzes:
Les pizzes tenen categories que poden canviar de nom al llarg de l'any.
Una pizza pertany a una única categoria.
Una categoria pot contenir diverses pizzes.
Categoria:
Identificador únic
Nom
Botigues

Informació a emmagatzemar:
Identificador únic
Adreça
Codi postal
Localitat
Província
Relacions:
Una botiga pot gestionar moltes comandes.
Empleats/des

Informació a emmagatzemar:
Identificador únic
Nom
Cognoms
NIF
Telèfon
Rol (cuiner/a o repartidor/a)
Relacions:
Cada empleat/da treballa en una única botiga.
Per a les comandes de repartiment a domicili, cal registrar el repartidor/a assignat i la data/hora del lliurament.

# Tecnologies Utilitzades

MongoDB, Terminal, Git and GitHub

# Requisits

Nothing

# Instal·lació

MongoDB

# Execució

Nothing

# Desplegament

Nothing

# Contribucions

Nothing

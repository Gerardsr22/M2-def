# 1. Museus

Una persona amant de l'art vol construir una base de dades de museus del món i les obres d'art de cadascú. Per les limitacions del seu equip informàtic (i les seves pròpies) va considerar únicament pintures i escultures.

- Per la informació de què disposa, pot saber en quin museu està cada obra d'art i, a més es coneix la sala del museu en la qual està l'obra. Les sales dels museus tenen un nom i pot haver sales amb mateix nom en diferents museus.
- Com a aficionat a la matèria que és, sap que tota obra d'art té un títol.
- Altres dades són específics del tipus d'obra d'art que consideri: pintura o escultura. Així, de les pintures es coneix el seu format de anchoxalto i el tipus de pintura (oli, pastel, aquarel·la, ...). De les escultures es considera el material amb què estan fetes (bronze, ferro, marbre, ...) i l'estil de l'escultura (neoclàssica, grecoromana, cubista, ...).
- Li interessarà també, conèixer els autors de les obres. Les dades generals dels autors seran el seu nom i nacionalitat. Com és natural, hi ha obres d'art de les que es desconeix l'autor.
- Dels museus recollirà la següent informació: el nom del museu, direcció amb el nom del carrer i el número, a més de la ciutat i el país on està.
- D'algunes obres d'art no es coneix la sala, només el museu.



Hi ha exposicions itinerants, composades per obres d'altres museus que es presten temporalment a un museu concret. Aquestes exposicions recorren el mon i van de museu en museu. Es vol recollir el títol de l'exposició, la data d'inici, la data de fi, per quin museu ha passat i quines obren la conformen.

# 2. Model conceptual
## 2.1. Enllaç públic a l'esquema
[cas xxx](aqui_has_d_indicar_la_URL_cas_draw.io)
## 2.2. Esquema conceptual (EC ó ER)
  ![cas xxx](.\6_museus.png)
  **La relació de ID ha de ser de E

# 3. Model lògic relacional
## 3.1. Esquema lògic
  
  obra(<ins>idObra</ins>, nom, tipo, format, tenica, material, estil, idSala, idMuseu)<br>
  sala(<ins>idSala</ins>, nom, idMuseu) <br>
  expo(<ins>idExpo</ins>, nom)<br>
  autor(<ins>idAutor</ins>, nom, nacionalitat)<br>
  obraXexpo(<ins>idObra, idExpo</ins>)<br>
  autorXobra(<ins>idObra, idAutor</ins>)<br>
  autorXmuseu(<ins>idMuseu, idAutor</ins>, dataInici, dataFi)<br>
  museu(<ins>idMuseu</ins>, nom, adress, ciutat, pais, )<br>
  data(<ins>dataInici</ins>)

## 3.2. Diagrama referencial

* El diagrama referencial em serveix per indicar quines claus alienes hi ha a l'esquema lògic  
* La relació referencial és aquella que conté la clau aliena  
* La relació referida és l'origen de la informació. És la part 1, tal com s'ha explicat a classe.

(omple la taula següent amb les claus alienes que hi hagi al cas pràctic)

Relació referencial|Clau aliena|Relació referida
-|:-:|-
sala|idMuseu|Museu
obra|idSala|sala
obra|idMuseu|Museu
obraXexpo|idObra|obra
obraXexpo|idExpo|expo
autorXobra|idautor|autor
autorXobra|idObra|obra
autorXmuseu|idMuseu|museu
autorXmuseu|idAutor|autor
autorXmuseu|dataInici|data

# 4. Model físic
## 4.1 Enllaç a l'esquema físic

[script 6_museus.sql](.6_museus.sql)

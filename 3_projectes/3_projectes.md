# 1. Gestió de projectes

- Es desitja dissenyar una base de dades que reculli la informació sobre la gestió de projectes que es porta a terme a l'empresa i la participació dels empleats. De cada empleat necessitarem saber el seu DNI, nom, adreça, telèfon i projecte en el qual participa. Cada projecte s'identificarà per un codi que serà únic, tindrà un títol, una durada estimada, una durada real, un pressupost.
- De cada projecte es vol saber qui és l'empleat director del projecte. A vegades passa que la mateixa persona pot dirigir diferents projectes.
- Cada empleat està assignat a un únic departament que s'encarregarà d'unes tasques determinades dins de l'empresa. Del departament de vol conèixer el nom.
- Es vol saber de cada empleat qui és el seu cap en cas que el tingui. Modificar l'esquema anterior per recollir els nous requeriments d'usuari (aquest requeriment no l'he explicat a classe però el teniu explicat als apunts).

# 2. Model conceptual

## 2.1. Enllaç públic a l'esquema

[cas 3_projectes](https://drive.google.com/file/d/1TIMZnxQuz4JtsAFwr-uNJ3jfjXkBbtPP/view?usp=sharing)

## 2.2. Esquema conceptual (EC ó ER)

![cas projectes](./3_projectes.png)

# 3. Model lògic relacional

## 3.1. Esquema lògic

Empleat (<ins>Dni</ins>, Nom, Adress, Telefon, Dni_cap) <br>
Prjecte (<ins>Id_projecte</ins>, Titol, Durada_Real, Durada_Esperada, Pressupost, Dni) <br>
Departament (<ins>Id_departament</ins>, Nom, Dni)

## 3.2. Diagrama referencial

Relació referencial|Clau aliena|Relació referida
-|-|-
Empleat | Dni | Projecte
Projecte | Id-projecte | Empleat
Empleat | Dni | Departament
Empleat | Dni_cap | Empleat

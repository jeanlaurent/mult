# Mult
Help you kids know their multiplication tables.

##
```
Tables 2,3,4,5,6,7,8,9
Operandes 3,4,5,6,7,9
Nombre d'opération maximum : 48

================================
Combien fait : 5 x 8 ?
>> 40
BRAVO !
================================

================================
Combien fait : 3 x 9 ?
>> 37
<<<<<<<<<<<<<<<<<< FAUX ! >>>>>>>>>>>>>>>>>>>>>>
3 x 9 ca fait 27
                                                    Retiens le !
================================
```
and after a few questions
```
Ta note : 46/48
Tu as fais juste 2 erreurs
Il faut encore que tu révises les multiplications suivantes
    3 x 9 = 27
    3 x 4 = 12
Je t'ai posé toutes les opérations possibles.
================================
        (__)  | Meuhhhhh |
        (oo) /
 /-------\/
/ |     ||
* ||----||
  ~~    ~~
```

## run with Docker
[get Docker](https://www.docker.com/products/overview#/install_the_platform)

then

`docker run -ti jeanlaurent/mult`

## run by hand

You need [node.js](https://nodejs.org/en/download/)

* get dependencies with `npm install`
* Edit last line of mult.coffee and decide number of operands and table
* Runs `npm start`
* put your kids in front of the computer

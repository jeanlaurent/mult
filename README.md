[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/jeanlaurent/mult)

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

## Run with Docker
Install [Docker](https://www.docker.com/products/overview#/install_the_platform)

`docker run -ti jeanlaurent/mult`

## Run by hand
Install [node.js](https://nodejs.org/en/download/)

* Get dependencies once with `npm install`
* Run mult by issuing `npm start`

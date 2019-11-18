:- dynamic(health/2).
:- dynamic(milik/2).

:- discontiguous(tokemon/1).
:- discontiguous(jenis/2).
:- discontiguous(healthbase/2).
:- discontiguous(health/2).
:- discontiguous(damage/2).
:- discontiguous(skill/2).
:- discontiguous(type/2).
:- discontiguous(id/2).
:- discontiguous(milik/2).

/*nama tokemon*/
/* 20 tokemon normal*/
/* 4 tokemon super*/
tokemon(tokeyub).
tokemon(tokedon).
tokemon(tokecha).
tokemon(tokego).
tokemon(tokedo).
tokemon(tokefab).
tokemon(tokegun).
tokemon(tokepan).
tokemon(tokendra).
tokemon(tokejon).
tokemon(tokevin).
tokemon(tokenan).
tokemon(tokemezz).
tokemon(tokeat).
tokemon(toketir).
tokemon(tokekha).
tokemon(tokedhil).
tokemon(tokema).
tokemon(tokevan).
tokemon(tokeli).

tokemon(tokegill).
tokemon(tokejan).
tokemon(tokeham).
tokemon(tokenna).

/*jenis*/
jenis(tokeyub, normal).
jenis(tokedon, normal).
jenis(tokecha, normal).
jenis(tokego, normal).
jenis(tokedo, normal).
jenis(tokefab, normal).
jenis(tokegun, normal).
jenis(tokepan, normal).
jenis(tokendra, normal).
jenis(tokejon, normal).
jenis(tokevin, normal).
jenis(tokenan, normal).
jenis(tokemezz, normal).
jenis(tokeat, normal).
jenis(toketir, normal).
jenis(tokekha, normal).
jenis(tokedhil, normal).
jenis(tokema, normal).
jenis(tokevan, normal).
jenis(tokeli, normal).

jenis(tokegill, legend).
jenis(tokejan, legend).
jenis(tokeham, legend).
jenis(tokenna, legend).

/*health base*/
healthbase(tokeyub, 97). 
healthbase(tokedon, 65).
healthbase(tokecha, 80).
healthbase(tokego, 78).
healthbase(tokedo, 88).
healthbase(tokefab, 108).
healthbase(tokegun, 66).
healthbase(tokepan, 92).
healthbase(tokendra, 90).
healthbase(tokejon, 81).
healthbase(tokevin, 72).
healthbase(tokenan, 77).
healthbase(tokemezz, 69).
healthbase(tokeat, 83).
healthbase(toketir, 82).
healthbase(tokekha, 86).
healthbase(tokedhil, 87).
healthbase(tokema, 99).
healthbase(tokevan, 103).
healthbase(tokeli, 101).

healthbase(tokegill, 151).
healthbase(tokejan, 139).
healthbase(tokeham, 157).
healthbase(tokenna, 145).

/*health*/
health(tokeyub, 10). 
health(tokedon, 65).
health(tokecha, 80).
health(tokego, 78).
health(tokedo, 88).
health(tokefab, 108).
health(tokegun, 66).
health(tokepan, 92).
health(tokendra, 90).
health(tokejon, 81).
health(tokevin, 72).
health(tokenan, 77).
health(tokemezz, 69).
health(tokeat, 83).
health(toketir, 82).
health(tokekha, 86).
health(tokedhil, 87).
health(tokema, 99).
health(tokevan, 103).
health(tokeli, 10).

health(tokegill, 151).
health(tokejan, 139).
health(tokeham, 157).
health(tokenna, 145).

/*tipe*/
/* fire, water, leaves, ground, flying, ice*/
/* flying lebih besar 50% damagenya melawan ground */
/* fire lebih besar 50% damagenya melawan ice */
/* ice lebih besar 30% damagenya melawan water */
/* ground lebih besar 40% damagenya melawan leaves*/

type(tokeyub, fire).
type(tokedon, water).
type(tokecha, leaves).
type(tokego, ground).
type(tokedo, flying).
type(tokefab, ice).
type(tokegun, fire).
type(tokepan, water).
type(tokendra, leaves).
type(tokejon, ground).
type(tokevin, flying).
type(tokenan, ice).
type(tokemezz, fire).
type(tokeat, water).
type(toketir, leaves).
type(tokekha, ground).
type(tokedhil, flying).
type(tokema, ice).
type(tokevan, fire).
type(tokeli, water).

type(tokegill, water).
type(tokejan, fire).
type(tokeham, leaves).
type(tokenna, flying).

/*normal attack*/
damage(tokeyub, 25).
damage(tokedon, 11).
damage(tokecha, 19).
damage(tokego, 17).
damage(tokedo, 21).
damage(tokefab, 31).
damage(tokegun, 13).
damage(tokepan, 28).
damage(tokendra, 26).
damage(tokejon, 22).
damage(tokevin, 15).
damage(tokenan, 16).
damage(tokemezz, 9).
damage(tokeat, 23).
damage(toketir, 20).
damage(tokekha, 27).
damage(tokedhil, 24).
damage(tokema, 30).
damage(tokevan, 37).
damage(tokeli, 32).

damage(tokegill, 38).
damage(tokejan, 33).
damage(tokeham, 40).
damage(tokenna, 41).

/*special attack atau skill */
skill(tokeyub, 63).
skill(tokedon, 36).
skill(tokecha, 54).
skill(tokego, 47).
skill(tokedo, 55).
skill(tokefab, 75).
skill(tokegun, 43).
skill(tokepan, 68).
skill(tokendra, 65).
skill(tokejon, 57).
skill(tokevin, 46).
skill(tokenan, 42).
skill(tokemezz, 49).
skill(tokeat, 56).
skill(toketir, 52).
skill(tokekha, 58).
skill(tokedhil, 59).
skill(tokema, 64).
skill(tokevan, 77).
skill(tokeli, 79).

skill(tokegill, 107).
skill(tokejan, 92).
skill(tokeham, 109).
skill(tokenna, 97).

/*kepemilikan*/
milik(tokeyub, 0).
milik(tokedon, 0).
milik(tokecha, 0).
milik(tokego, 0).
milik(tokedo, 0).
milik(tokefab, 0).
milik(tokegun, 0).
milik(tokepan, 0).
milik(tokendra, 0).
milik(tokejon, 0).
milik(tokevin, 0).
milik(tokenan, 0).
milik(tokemezz, 0).
milik(tokeat, 0).
milik(toketir, 0).
milik(tokekha, 0).
milik(tokedhil, 0).
milik(tokema, 1).
milik(tokevan, 1).
milik(tokeli, 1).


milik(tokegill, 1).
milik(tokejan, 0).
milik(tokeham, 1).
milik(tokenna, 0).



/*id tokemon*/
id(tokeyub, 1).
id(tokedon, 2).
id(tokecha, 3).
id(tokego, 4).
id(tokedo, 5).
id(tokefab, 6).
id(tokegun, 7).
id(tokepan, 8).
id(tokendra, 9).
id(tokejon, 10).
id(tokevin, 11).
id(tokenan, 12).
id(tokemezz, 13).
id(tokeat, 14).
id(toketir, 15).
id(tokekha, 16).
id(tokedhil, 17).
id(tokema, 18).
id(tokevan, 19).
id(tokeli, 20).

id(tokegill, 21).
id(tokejan, 22).
id(tokeham, 23).
id(tokenna, 24).

backNormal(Toke) :- 
    tokemon(Toke),
	healthbase(Toke, X),
	retract(health(Toke, 0)),
	asserta(health(Toke, X)),
    retractall(milik(Toke,1)),
    asserta(milik(Toke,0)).

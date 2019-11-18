:- include('player.pl').

:- dynamic(battle/1).
:- dynamic(enemyTokemon/1).
:- dynamic(playerTokemonBattle/1).
:- dynamic(battle/1).
:- dynamic(sAttack/1).
:- dynamic(gagalRun/1).
:- dynamic(picked/1).
:- dynamic(pilih/1).
:- dynamic(evolvedA/0).
:- dynamic(evolvedB/0).
:- dynamic(evolvedC/0).

:- discontiguous(evolve/1).
:- discontiguous(decide/0).
:- discontiguous(fight/0).
:- discontiguous(remove/0).
:- discontiguous(run/0).
:- discontiguous(pick/1).
:- discontiguous(enemyAttack/0).
:- discontiguous(serang/2).
:- discontiguous(attack/0).
:- discontiguous(specialAttack/0).
:- discontiguous(checklose/0).
:- discontiguous(checkvictory/0).
:- discontiguous(modifier/4).
:- discontiguous(capture/0).
:- discontiguous(exit/0).
:- discontiguous(statPlayerEnemy/0).

randomenemy :-
    repeat,
        random(1, 24, Nomer),
        id(Toke, Nomer),
        milik(Toke, Siapa),
        Siapa =:= 0,
        retractall(enemyTokemon(_)),
        asserta(enemyTokemon(Toke)), !,
        write('enemy : '),
        tokemon(Toke),
        write(Toke), nl,
        write('Health : '), health(Toke, X), write(X), nl,
        write('Type : '), type(Toke, Y), write(Y), nl,
        write('Jenis : '), jenis(Toke, Z), write(Z), nl.

decide :-
    write('A wild tokemon appears!'), nl,
    randomenemy,
    write('fight or run'), nl,
    asserta(pilih(1)).

fight :-
	\+playing(_),
	write('This command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
fight :-
    asserta(battle(_)),
    write('Choose your Tokemon using pick/1 !\n\nAvailable Tokemons: '), 
    inventory(X),
    write(X),
    nl, !.

    

run:-
	\+playing(_),
	write('This command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
run :-
    random(0,2,Result),	
	(Result =:= 0 -> gagalrun; berhasilrun).
    
berhasilrun :-
    write('You successfully escape from Tokemon!'), nl,
    retractall(picked(_)),
    retractall(gagalRun(_)),
    retractall(sAttack(_)),
    retractall(battle(_)),
    retractall(enemyTokemon(_)),
    retractall(playerTokemonBattle(_)),
    !, fail.

gagalrun :-
    write('You failed to run!'), nl,
    fight. 

pick(_) :-
    picked(1),
    write('You have picked Tokemon!'), 
    !.

pick(_) :-
    \+battle(_),
    write('You are not in the battle right now!'), 
    !.

pick(PT) :-
    \+picked(1),
    milik(PT, 1),
    write('You : '), 
    write(PT), 
    write(' I choose you!\n'),
    retractall(playerTokemonBattle(_)),
    asserta(playerTokemonBattle(PT)),
    asserta(picked(1)),
    statPlayerEnemy, !,
    cek(PT),
    !.

cek(PT) :-
    PT == tokeyub,
    retractall(evolvedA),
     !.

cek(PT) :-
    PT == tokedon,
    retractall(evolvedB), !.

cek(PT) :-
    PT == tokecha,
    retractall(evolvedC), !.

pick(_) :-
    write('You dont have that Tokemon!'), !.

attack :-
    \+picked(1),
    write('Pick your Tokemon first.'),nl,!.

attack :- 
    picked(1),
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    damage(PT, Damage),
    modifier(ET, PT, Damage, X),
    NewDamage is X,
    serang(ET, NewDamage),
    nl,
    !,
    (\+checkvictory ->
        write('You dealt '),
        write(NewDamage),
        write(' damage to '),
        write(ET), nl,
        statPlayerEnemy,
        nl,
        !,
        enemyAttack, 
        !, fail
        ;
        !, fail
    ),
    !.

enemyAttack :-
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    damage(ET, Damage),    
    modifier(PT, ET, Damage, X),
    NewDamage is X,
    serang(PT, NewDamage),
    !,
    (\+checklose ->
        write(ET),
        write(' attacks!\nIt dealt '), 
        write(NewDamage), 
        write(' damage to '),
        write(PT), nl,
        statPlayerEnemy,
        !, fail
        ;
        !, fail
    ),
    !.

serang(T, Damage) :-
    health(T, HP),
    NewHP is HP - Damage,
    (NewHP =< 0 ->
        HPP is 0
        ;
        HPP is NewHP
    ),
    retractall(health(T, HP)),
    asserta(health(T, HPP)).

% PT tokemon yang diserang, ET tokemon yang menyerang, 
% Damage = damage awal, X = damage akhir
modifier(PT, ET, Damage, X) :- 
    type(ET, TE),
    type(PT, TP),
    ( TE == fire, TP == leaves ->
            X is Damage + 0.5*Damage 
        ; 
        TE == leaves, TP == water ->
            X is Damage + 0.5*Damage 
            ;    
            TE == water, TP == fire ->
                X is Damage + 0.5*Damage 
                ;
                TE == flying, TP == ground ->
                    X is Damage + 0.5*Damage 
                    ;
                    TE == ice, TP == water ->
                        X is Damage + 0.4*Damage 
                        ;
                        TE == ground, TP == leaves ->
                            X is Damage + 0.4*Damage 
                            ;
                            TP == fire, TE == leaves ->
                                X is Damage - 0.5*Damage 
                                ; 
                                TP == leaves, TE == water ->
                                    X is Damage - 0.5*Damage 
                                    ;    
                                    TP == water, TE == fire ->
                                        X is Damage - 0.5*Damage 
                                        ;
                                        TP == flying, TE == ground ->
                                            X is Damage - 0.5*Damage 
                                            ;
                                            TP == ice, TE == water ->
                                                X is Damage - 0.4*Damage 
                                                ;
                                                TP == ground, TE == leaves ->
                                                    X is Damage - 0.4*Damage 
                                                    ;
                                                    X is Damage 
    ).

capture :-
    \+battle(_),
    write('You are not in the battle right now!'), 
    !, fail.    

capture :- 
    enemyTokemon(ET),
    health(ET, HP),
    ( HP > 0 ->
        write('You cannot capture!. '),
        !, fail
        ;
        tokeCounter(X),
        (X =:= 6 ->
            write('You cannot capture another Tokemon! You have to drop one first.'), nl
            ;
            capt(ET),
            retractall(picked(_)),
            retractall(picked(_)),
            retractall(gagalRun(_)),
            retractall(sAttack(_)),
            retractall(battle(_)),
            retractall(enemyTokemon(_)),
            retractall(playerTokemonBattle(_)),
            tokeCountLegend(Z),
            (Z =:= 4 -> wingame; cek2)
        )
    ).

specialAttack :-
    \+battle(_),
    write('You are not in the battle right now!'), nl,
    !, fail.    

specialAttack :-
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    \+sAttack(_),
    skill(PT, Damage),
    modifier(ET, PT, Damage, X),
    NewDamage is X,
    serang(ET, NewDamage),
    write(PT),
    write(' uses special attack!'),nl,nl,
    nl,
    write('You dealt '), 
    write(NewDamage), 
    write(' damage to '),
    write(ET), nl, nl,
    statPlayerEnemy,
    asserta(sAttack(_)),
    !, 
    \+checkvictory, 
    !, fail.

specialAttack :- 
    sAttack(_),
    write('Special attacks can only be used once per battle!'), !, fail.

checkvictory :-
    enemyTokemon(ET),
    health(ET, HPE),
    HPE =< 0,
    write(ET),
    write(' faints! Do you want to capture ') ,
    write(ET),
    write(' capture/0 to capture '), 
    write(ET),
    write(', \notherwise exit/0 to leave the carcass.'), nl,
    !.

checklose :-
    tokeCounter(X),
    Q is X-1,
    playerTokemonBattle(ET),
    health(ET, HPE),
    HPE =< 0,
    write(ET),
    write(' died!'),nl,
    delForever(ET),
    retract(playerTokemonBattle(ET)),    
    retractall(picked(_)),
    (Q =:= 0 -> losegame;
    write('Choose your Tokemon : '),
    inventory(P),
    write(P)),
    !. 

exit :- 
    enemyTokemon(Toke),
    delForever(Toke),
    retractall(picked(_)),
    retractall(gagalRun(_)),
    retractall(sAttack(_)),
    retractall(battle(_)),
    retractall(enemyTokemon(_)),
    retractall(playerTokemonBattle(_)),
    tokeCountLegend(Z),
(Z =:= 4 -> wingame; write('You leave the carcass'), nl, cek2).

cek2 :-
    \+evolvedA,
    milik(tokeyub,1),
    write('you can evolve tokeyub!'), !.
cek2 :-
    \+evolvedB,
    milik(tokedon,1),
    write('you can evolve tokedon!'), !.
cek2 :-
    \+evolvedC,
    milik(tokecha,1),
    write('you can evolve tokecha!'), !.

statPlayerEnemy :-
    playerTokemonBattle(PT),
    enemyTokemon(ET),
    stat(PT),
    nl,
    stat(ET).

losegame :-
    write('YOU LOSEEEEE :(('),nl,
    write('Better luck next time!'),halt.

wingame :-
    write('YOU WINNNNN :))'),nl,
    write('You are amazing! You have beat all the legendary Tokemons'),nl,
    write('Come back later to test your luck'),halt.


evolve(PT) :- 
    \+evolvedA,
    asserta(evolvedA),
    PT == tokeyub,
    milik(PT, 1),
    retract(milik(tokeyub,1)),

    retract(milik(ayyub,0)),
    asserta(milik(ayyub,1)),

    retract(id(tokeyub,1)),
    retractall(id(ayyub,_)),
    asserta(id(ayyub,1)),
    write('tokeyyub evolved to ayyub!!'),
    !.

evolve(PT) :- 
    \+evolvedB,
    asserta(evolvedB),
    PT == tokedon,
    milik(PT, 1),
    retract(milik(tokedon,1)),

    retract(milik(brandon,0)),
    asserta(milik(brandon,1)),

    retract(id(tokedon,2)),
    retractall(id(brandon,_)),
    asserta(id(brandon,2)),
    write('tokedon evolved to brandon!!'), 
    !.

evolve(PT) :- 
    \+evolvedC,
    asserta(evolvedC),
    PT == tokecha,
    milik(PT, 1),
    retract(milik(tokecha,1)),

    retract(milik(chacha,0)),
    asserta(milik(chacha,1)),

    retract(id(tokecha,3)),
    retractall(id(chacha,_)),
    asserta(id(chacha,3)),
    write('tokecha evolved to chacha!!'),
    !.

evolve(_) :-
    write('can not evolve tokemon'),! .

evolve(_) :-
    write('can not evolve tokemon'),!.

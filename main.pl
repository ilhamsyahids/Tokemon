% ILHAM SYAHID S 			13518028
% M Fauzan Al-G 			13518112
% Felicia Gillian T. Tuerah 13518070
% Muhammad Rizki Fonna 		13516001

:- include('map.pl').

:- discontiguous(heal/0).
:- dynamic(healed/0).

start:-
	playing(_),
	write('You can only start the game once'),nl,!.
start:-
	write('  /$$$$$$$$        /$$'), nl,
	write(' |__  $$__/       | $$'), nl,
	write('    | $$  /$$$$$$ | $$   /$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$  /$$$$$$$'), nl,
	write('    | $$ /$$__  $$| $$  /$$/ /$$__  $$| $$_  $$_  $$ /$$__  $$| $$__  $$'), nl,
	write('    | $$| $$  \\ $$| $$$$$$/ | $$$$$$$$| $$ \\ $$ \\ $$| $$  \\ $$| $$  \\ $$'), nl,
	write('    | $$| $$  | $$| $$_  $$ | $$_____/| $$ | $$ | $$| $$  | $$| $$  | $$'), nl,
	write('    | $$|  $$$$$$/| $$ \\  $$|  $$$$$$$| $$ | $$ | $$|  $$$$$$/| $$  | $$'), nl,
	write('    |__/ \\______/ |__/  \\__/ \\_______/|__/ |__/ |__/ \\______/ |__/  |__/'), nl,
	write(''), nl,
	write(''), nl,
	write(''), nl,
	write('    /$$$$$$$$ /$$           /$$         /$$'), nl,
	write('    | $$_____/|__/          | $$        | $$'), nl,
	write('    | $$       /$$  /$$$$$$ | $$$$$$$  /$$$$$$'), nl,
	write('    | $$$$$   | $$ /$$__  $$| $$__  $$|_  $$_/'), nl,
	write('    | $$__/   | $$| $$  \\ $$| $$  \\ $$  | $$'), nl,
	write('    | $$      | $$| $$  | $$| $$  | $$  | $$ /$$'), nl,
	write('    | $$      | $$|  $$$$$$$| $$  | $$  |  $$$$/'), nl,
	write('    |__/      |__/ \\____  $$|__/  |__/   \\___/'), nl,
	write('                   /$$  \\ $$'), nl,
	write('                   |  $$$$$$/'), nl,
	write('                   \\______/'), nl,
	resetAll,
	narasi, 
	help,
	mulai,
	spawnPlayer,
	spawnTokemon,
	tokemon_init,
	asserta(evolvedA),
	asserta(evolvedB),
	asserta(evolvedC),
	asserta(playing(1)).

wronginput :-
	write('Command yang dimasukkan salah, silakan masukan ulang'),nl.

narasi:- 
	write(''),nl,nl,
	write('Di Desa Toke yang dingin hidup seorang anak bernama Kemon. Di suatu malam kemon tidak bisa tidur,'), nl,
	write('akhirnya dia memutuskan untuk keluar rumah mencari angin segar. Di tengah perjalanannya,'), nl,
	write('secara tidak sengaja Kemon melihat bola-bola yang melayangdan memancarkan cahaya biru.'), nl,
	write('Karena penasaran akhirnya Kemon mengikuti cahaya biru tersebut. karena telah terhipnotis dengan,'), nl,
	write('Tanpa sadar Kemon jatuh terjerumus ke dalam sebuah portal yang membawanya ke dunia Tokemon.'), nl,
	write(''), nl,
	write('Saat ia membuka matanya, ia bertemu dengan seorang kakek yang memberitahu bahwa ia hanya'), nl,
	write('bisa keluar dari dunia Tokemon jika mampu mengalahkan 4 buah tokemon legendary'), nl,
	write('yaitu, tokegill, tokejan, tokenna dan tokeham. Kakek tersebut juga memberi 1 buah tokemon'), nl,
	write('untuk membantu Kemon keluar dari dunia Tokemon dan kembali ke desa Toke.'), nl,
	write('Tetapi Kemon juga harus berhati-hati karena jika ia kehilangan tokemonnya maka Kemon akan'), nl,
	write('terkurung di dunia tokemon selamanya!.'), nl,
	write(''), nl,
	write('Tiba-tiba petir menyabar sangat besar dan kakek itu pun menghilang, dia juga meninggalkan sebuah'), nl,
	write('peta untuk Kemon. peta tersebut menunjukkan kunci untuk pergi ke Gym, yaitu tempat menyembuhkan'), nl,
	write('tokemonnya yang terluka dalam pertarungan.Semangat Kemon, kami tau kamu pasti bisa!'), nl,
	write(' Hello there! Welcome to the world of Tokemon!'),nl,
	write(' Find the Key to destroy the barrier to the Gym !!!'),nl, nl.

help :-
	write(' Available commands:'), nl,
	write('    start. -- start the game!'), nl,
	write('    help. -- show available commands'), nl,
	write('    quit. -- quit the game'), nl,
	write('    w. a. s. d. -- move'), nl,
	write('    map. -- look at the map'), nl,
	write('    heal. -- cure Tokemon in inventory if in gym center'), nl,
	write('    status. -- show your status'), nl,
	write('    save(\'Filename.txt\'). -- save your game to directory data/'), nl,
	write('    loads(\'Filename.txt\'). -- load your game from directory data/'), nl,nl,

	write(' Legends:'), nl,
	write('    X = Barrier'), nl,
	write('    P = Player'), nl,
	write('    G = Gym'), nl,
	write('    K = Key').

%quit	
quit:- 
	halt,!.

%status
status :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.

status :-
	write('Your Tokemon : '), nl,
	forall(between(1,25,Val), 
		(id(K, Val), milik(K, P),
		(P =:= 1 -> stat(K), nl);write(''))
	), statusenemy.

statusenemy :- nl,
	write('Your Enemy : '), nl,
	forall(between(21,25,Val), 
		(id(K, Val), milik(K, P),
		(P =:= 0 -> jenis(K, legend),stat(K), nl);write(''))
	).

%heal
heal:- 
	healed,
	write('You can only heal your tokemon once.'), nl, !.

heal:- 
	tokemon(Toke),
	milik(Toke, 1),
	player(I,J),
	\+gym(I, J),
	write('You can only use this command when you are in the gym.'),nl,
	write('Go to the gym to heal your tokemon!'),
	nl,!.

heal:- 
	\+healed,
	inventory(X),
	healList(X), 
	asserta(healed),
	write('All your tokemon has been healed.yey.'),nl,
	!.

healList([]).
healList([H|T]) :- oneHeal(H), healList(T).

oneHeal(Toke) :-
	healthbase(Toke,X),
	retractall(health(Toke,_)),
	asserta(health(Toke, X)),!.


save(_):-
	battle(_),
	write('You can\'t save while battle'),nl,!.

save(FileAwal) :-
    atom_concat('data/', FileAwal, Filename),
	open(Filename, write, FinalFile),
	facts(FinalFile),
	close(FinalFile),
	write('Saved to '),
	write(Filename), nl.

facts(FinalFile) :- save_data(FinalFile).
facts(_) :- !.

save_data(FinalFile) :-
	(selected -> write(FinalFile, selected), write(FinalFile, '.'), nl(FinalFile)),
	player(X, Y), write(FinalFile, player(X, Y)), write(FinalFile, '.'), nl(FinalFile),
    (healed -> write(FinalFile, healed), write(FinalFile, '.'), nl(FinalFile);!),
	tokemon(Toke), write(FinalFile, tokemon(Toke)), write(FinalFile, '.'), nl(FinalFile),
	jenis(Toke, Jenis), write(FinalFile, jenis(Toke, Jenis)), write(FinalFile, '.'), nl(FinalFile),
	healthbase(Toke, Healthbase), write(FinalFile, healthbase(Toke, Healthbase)), write(FinalFile, '.'), nl(FinalFile),
	health(Toke, Health), write(FinalFile, health(Toke, Health)), write(FinalFile, '.'), nl(FinalFile),
	type(Toke, Type), write(FinalFile, type(Toke, Type)), write(FinalFile, '.'), nl(FinalFile),
	damage(Toke, Damage), write(FinalFile, damage(Toke, Damage)), write(FinalFile, '.'), nl(FinalFile),
	skill(Toke, Skill), write(FinalFile, skill(Toke, Skill)), write(FinalFile, '.'), nl(FinalFile),
	milik(Toke, Milik), write(FinalFile, milik(Toke, Milik)), write(FinalFile, '.'), nl(FinalFile),
	id(Toke, Id), write(FinalFile, id(Toke, Id)), write(FinalFile, '.'), nl(FinalFile),
    fail.

loads(_):-
	battle(_),
	write('You can\'t load while battle'),nl,!.

loads(FileAwal):-
	atom_concat('data/', FileAwal, Filename),
	resetAll,
	open(Filename, read, FinalFile),
	repeat,
		read(FinalFile, In),
		asserta(In),
    at_end_of_stream(FinalFile),
	close(FinalFile),
	nl, write('Loaded!'), 
	nl, !.

loads(Filename):-
	nl, write('File '), 
	write(Filename), 
	write(' no\'t found!'), 
	nl, fail.


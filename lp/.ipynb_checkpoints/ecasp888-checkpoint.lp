%-------------------------------------------------------------------------

%                     -------------------------------
%                     |  	 Events and Fluents     |
%                     -------------------------------

% Declare events and fluents
event(changeOOI(O1, O2)) :- objectOI(O1, Po1), objectOI(O2, Po2).
event(changeLocation(L1, L2)) :- location(L1, Pl1), location(L2, Pl2).
event(anticipate(O, L)) :- objectOI(O, Po), location(L, Pl).


fluent(oOI(O, Po)) :- objectOI(O, Po).
fluent(currentLocation(L, Pl)) :- location(L, Pl).
fluent(intention(A, Pa)) :- context(A, L, O), objectOI(O, Po), location(L, Pl), Pa=(Pl*Po)/100, activity(A).

%-------------------------------------------------------------------------

%                     -------------------------------
%                     |  Specify effects of events  |
%                     -------------------------------

initiates(changeOOI(O1, O2), oOI(O2, Po2), T) :-
  objectOI(O1, Po1), objectOI(O2, Po2), time(T).
  
terminates(changeOOI(O1, O2), oOI(O1, Po1), T) :-
  objectOI(O1, Po1), objectOI(O2, Po2), time(T).


initiates(changeLocation(L1, L2), currentLocation(L2, Pl2), T) :-
  location(L1, Pl1), location(L2, Pl2), time(T).
  
terminates(changeLocation(L1, L2), currentLocation(L1, Pl1), T) :-
  location(L1, Pl1), location(L2, Pl2), time(T).
  

initiates(anticipate(O, L), intention(A, Pa), T) :-
  context(A, L, O), objectOI(O, Po), location(L, Pl), time(T), 
  Pa=(Pl*Po)/100.

terminates(changeOOI(O1, O2), intention(A, Pa), T) :-
  objectOI(O1, Po1), objectOI(O2, Po2), time(T),
  context(A, L, O1), location(L, Pl), Pa=(Pl*Po1)/100.
  
terminates(changeLocation(L1, L2), intention(A, Pa), T) :-
  location(L1, Pl1), location(L2, Pl2), time(T),
  objectOI(O1, Po1), context(A, L2, O1), Pa=(Pl2*Po1)/100.


%-------------------------------------------------------------------------

%         ------------------------------------------------------
%         |  			Specify triggered events  			   |
%         ------------------------------------------------------


happens(anticipate(O2, L2), T+1) :-
	happens(changeOOI(O1, O2), T),
	%not holdsAt(oOI(O2, Po2), T), 
	%holdsAt(currentLocation(S, L, PRL), T),
	objectOI(O1, Po1), objectOI(O2, Po2),
	happens(changeLocation(L1, L2),T),
	%holdsAt(currentActivity(S, A, PRA2), T), 
	%not holdsAt(currentLocation(L2, Pl2), T),
	location(L1, Pl1), location(L2, Pl2).

%-------------------------------------------------------------------------

%cd Etude/Doctorat/Clingo/clingo-5.4.0-win64
%clingo -c maxtime=7 -n 1 ./Trials/decOrigin2.lp ./Trials/ecasp888.lp ./Trials/ecasp8888.lp ./Trials/ecasp88888.lp ./Trials/ecasp888888.lp | format-output 7 >./Trials/ecasp88.txt

%clingo -c maxtime=3 -n 1 ./Trials/decOrigin2.lp ./Trials/ecasp888.lp ./Trials/ecasp8888.lp ./Trials/ecasp88888.lp ./Trials/ecasp888888.lp | format-output 3 >./Trials/ecasp88.txt
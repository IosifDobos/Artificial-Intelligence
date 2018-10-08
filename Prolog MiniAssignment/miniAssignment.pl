%	rules to get started
%	mini Assignment fot Artificiall Inteligence module

%	rule 1
stimulus_situation(verbal) :-
	envinronment(papers);
	envinronment(manuals);
	envinronment(documents);
	envinronment(texbooks).

%	rule 2
stimulus_situation(visual) :-
	envinronment(pictures);
	envinronment(illustrations);
	envinronment(photographs);
	envinronment(diagrams).

%	rule 3
stimulus_situation(physical_object) :-
	envinronment(machines);
	envinronment(buildings);
	envinronment(tools).

%	rule 4
stimulus_situation(symbols) :-
	envinronment(numbers);
	envinronment(formulas);
	envinronment(computer-programs).

%	rule 5
stimulus_response(oral) :-
	job(lecturing);
	job(advising);
	job(counselling).

%	rule 6
stimulus_response(hands_on) :-
	job(buildings);
	job(repairing);
	job(troubleshooting);
	job(driving).

%	rule 7
stimulus_response(documented) :-
	job(writing);
	job(typing);
	job(drawing).

%	rule 8
stimulus_response(analytical) :-
	job(evaluating);
	job(reasoning);
	job(investigating).

% rule 9
medium(workshop) :-
	stimulus_situation(physical_object),
	stimulus_response(hands_on),
	feedback(yes).

%	rule 10
medium(lecture-tutorial) :-
	stimulus_situation(symbolic),
	stimulus_response(analytical),
	feedback(yes).

%rule 11
medium(videocassette) :-
	stimulus_situation(visual),
	stimulus_response(documented),
	feedback(yes).

% rule 12
medium(lecture-tutorial) :-
	stimulus_situation(visual),
	stimulus_response(oral),
	feedback(yes).

%	rule 13
medium(lecture-tutorial) :-
	stimulus_situation(verbal),
	stimulus_response(analytical),
	feedback(yes).

%	rule 14
medium(role-play_exercises) :-
	stimulus_situation(verbal),
	stimulus_response(oral),
	feedback(yes).

% rule 15
medium(construction_site) :-
	stimulus_situation(physical_object),
	stimulus_response(hands_on),
	feedback(yes).

% rule 16
medium(court) :- 
	stimulus_situation(verbal),
	stimulus_response(documented),
	feedback(no).

% rule 17
medium(bus_driving) :-
	stimulus_situation(visual),
	stimulus_response(hands_on),
	feedback(yes).

% 	3 inputs required: 1 envinronment 2 job, 3 feedback yes/no
go :-
	getEnvironment,
	getJob,
	feedback,
	( stimulus_situation(SS),
		nl, write('Stimulus situation is: '), write(SS), nl,

        stimulus_response(SR),
        nl, write('Stimulus response is: '), write(SR), nl,

        feedback(F),
        nl, write('Feedback is '), write(F), nl,

        medium(M),
        nl, write('Medium is: '), write(M), nl
        ;
		writeln('Could not advise on an appropriate medium')
	),
	cleanInputs.

getEnvironment :-
	write('Input the envinronment: '),
	read(E),
	assert(envinronment(E)).

getJob :-
	write('Input job: '),
	read(J),
	assert(job(J)).

feedback :-
	write('Is feedback required yes/no: '),
    read(F),
	% required(F),
	assert(feedback(F)).

cleanInputs :-
	retractall(envinronment(_)),
	retractall(job(_)),
	retractall(feedback(_)).



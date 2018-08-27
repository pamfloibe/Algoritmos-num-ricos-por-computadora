sched = parcluster('local') %%Va a trabajar con el cluster local, el cual se va a estar monitoreando desde otro lado

job = createJob(sched) %%Define con qu� cluster va a trabajar.
                       %%Toma el cluster y lo que hace es crear un job. Ah�
                       %%se van a poner las tareas.

%createTask(job,@propAreasIntersecc,1,                   {});
    %%No es buena porque es un escalar y los dem�s ya son vectores
%createTask(job,@propAreasIntersecc,[1 1],             { {} {} });
%createTask(job,@propAreasIntersecc,[1 1 1],           { {} {} {} });
createTask(job,@propAreasIntersecc,[1 1 1 1],         { {} {} {} {} });
%%Quiero que corras @propAreasIntersecc en donde se corran 4 jobs.
%createTask(job,@propAreasIntersecc, [1 1 1 1 1],      { {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1],    { {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1],  { {} {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1 1],{ {} {} {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1 1 1],{ {} {} {} {} {} {} {} {} {}});
%createTask(job,@propAreasIntersecc, [1 1 1 1 1 1 1 1 1 1],{ {} {} {} {} {} {} {} {} {} {}});

tic %%Va a medir el tiempo
submit(job); %%Lanza los jobs

wait(job) %%Espera aqu� para que se ejecuten y terminen todos
sal = fetchOutputs(job); %%Espera la salida
toc

%%Las salidas de cada una de ellas
sal{1}
sal{2}
sal{3}
sal{4}
%sal{5}
%sal{6}
%sal{7}
%sal{8}
%sal{9}
%sal{10}

destroy(job) %%Hay que destruirlo para que no consuma los recursos

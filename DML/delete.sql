delete from realiza; -- Seguir a ordem inversa de criacao (realiza -> [membro, tarefas])
delete from membro;
delete from tarefa;

-- Delete com a clausula WHERE (remove dados especificos)

delete from realiza
where id_tarefa = 1
returning id_tarefa, id_membro, horas_alocadas;

delete from tarefa t
where t.id_tarefa = 1;


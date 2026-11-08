select r.id_tarefa, sum(r.horas_alocadas) from realiza r
group by r.id_tarefa
having id_tarefa = 2 
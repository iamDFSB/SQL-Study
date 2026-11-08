-- Seguir ordem de criacao ([membro, tarefas] -> realiza)

create table if not exists membro(
	id_membro SERIAL not null,
	nome VARCHAR(50) not null,
	papel varchar(100),
	primary key (id_membro)
);

create table if not exists tarefa(
	id_tarefa serial not null,
	descricao text not null,
	data_inicio timestamp without time zone default CURRENT_TIMESTAMP,
	primary key (id_tarefa)
);

create table realiza(
	id_membro int not null,
	id_tarefa int not null,
	horas_alocadas numeric,
	primary key(id_membro, id_tarefa),
	foreign key(id_membro) references membro(id_membro),
	foreign key(id_tarefa) references tarefa(id_tarefa)
);

create table departamento(
	id_departamento serial primary key,
	nome_departamento varchar(50)
);
  

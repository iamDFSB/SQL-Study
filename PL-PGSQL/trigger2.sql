-- Tabela 1: Clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela 2: Endereços (1 para 1 ou 1 para N)
CREATE TABLE enderecos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    cidade VARCHAR(100) NOT NULL
);

create or replace view vw_clientes_detalhes as
select 
	c.id as cliente_id,  
	c.nome,
	e.cidade
from clientes c
inner join enderecos e 
	on e.cliente_id = c.id;


create or replace function fn_insert_cliente_via_view()
returns trigger as $$
	declare
		indentifier_cliente bigint;	

	begin
		insert into clientes (nome) 
		values (new.nome)
		returning id into indentifier_cliente;

		insert into enderecos (cliente_id, cidade)
		values (indentifier_cliente, new.cidade);
		
		return new;
	end; 
$$ language plpgsql;


create or replace trigger trg_insert_cliente
instead of insert on vw_clientes_detalhes
for each row
execute function fn_insert_cliente_via_view();


insert into vw_clientes_detalhes (nome, cidade)
values ('Daniel', 'São Paulo');
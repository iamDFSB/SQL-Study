-- stored procedure
create or replace procedure insert_member(
	nome varchar, 
	papel varchar, 
	salario numeric, 
	nome_dep varchar
) 
as 
$$
	declare
		identifier_departamento int;
	begin 
		select id_departamento 
		into identifier_departamento 
		from departamento
		where nome_departamento = nome_dep;
	
		if not found then
			return;
		end if;
		
		insert into membro (nome, papel, salario, id_departamento)
		values (nome, papel, salario, identifier_departamento);
			
	end;
	
$$ language plpgsql;


call insert_member(
	'Nilton Carlos',
	'Colhetor de Impostos',
	6000,
	'RH'
);
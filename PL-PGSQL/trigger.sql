-- São funções executadas automaticamente quando 
-- eventos especificos ocorrem no banco de dados
-- Esses eventos podem ser 
-- - INSERT
-- - UPDATE 
-- - DELETE

-- São executadas antes ou depois de qualquer desses eventos anteriores.
-- Podemos especificar triggers tanto para tabelas quanto para views.
 

create table funcionarios (...);
create table funcionarios_auditoria(...);
-- Se alterar funcionarios em que alterar funcionarios_auditoria automaticamente.

create trigger name
    { BEFORE | AFTER | INSTEAD OF}
    { EVENT [OR ...] } ON table 
    [ FROM referenced_table_name ]
    [ FOR [ EACH ] { ROW | STATEMENT } ]
    EXECUTE PROCEDURE function_name ( arguments )


-- FOR EACH ROW vai executar cada linha como transação
-- FOR EACH STATEMENT vai executar cada comando como uma transação

create or replace function insert_user(user_name varchar, user_age int)
returns void as
$$
	declare 
		identifier_user_table bigint;
	begin
		insert into user_system (name, age)
		values (user_name, user_age)
		returning id into identifier_user_table;
		raise notice 'NOVO ID: %', identifier_user_table;		
	end;
$$ language plpgsql;

select insert_user('jo jo', 56);

create or replace function insert_user_status()
returns trigger as
$$
	declare 
		identifier_user_status_table bigint;
	begin
		insert into user_status (user_id)
		values (new.id)
		returning id into identifier_user_status_table;
		raise notice 'NOVO ID: %', identifier_user_status_table;		
		return new;
	end;
$$ language plpgsql;


create or replace trigger user_insert_trigger
after insert on user_system 
for each row 
execute procedure insert_user_status();



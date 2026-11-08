-- Os arrays não precisam ter o tamanho pré-definido 

-- Declaração 
    -- notas integer[];
    -- nomes varchar[];
    -- nascimento date[];

-- Atuação
    -- notas[0] = 8;


-- Dados quando estiverem na tabela
create table contato(
    id serial primary key,
    nome varchar (100),
    fones text[]
);

insert into contato (nome, fones)
values ('William Gate', '{
    "(234)-3243-4234",
    "(234)-3243-4234",
    "(234)-3243-4234"
}')


do $$
	declare
		user_ user_info%ROWTYPE;
		list_response text[] := ARRAY[]::TEXT[];
	begin	

		for user_ in select * from user_info loop
			if user_.posts < 12 then
				raise notice '%',user_;
				list_response := list_response || user_.nickname;
			end if;
		end loop;
		raise notice 'Result: %', list_response;
end$$;
--------------- Duas formas para a mesma coisa ---------------
do $$
	declare
		user_ user_info%ROWTYPE;
		list_response text[] := ARRAY[]::TEXT[];
	begin	

		for user_ in select * from user_info loop
			if user_.posts < 12 then
				raise notice '%',user_;
				list_response := array_append(list_response, user_.nickname);
			end if;
		end loop;
		raise notice 'Tam1: %', array_length(list_response, 1); -- len na lista
		list_response := trim_array(list_response, 1); -- pop na lista
		raise notice 'Tam2: %', array_length(list_response, 1);
		raise notice 'Result: %', list_response;
end$$;

--(5,carla_prog,3)
-- (9,gabriela_db,7)
-- (15,otavio_git,5)
-- Result: {carla_prog,gabriela_db,otavio_git}













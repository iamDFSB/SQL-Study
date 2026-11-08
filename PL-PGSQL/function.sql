CREATE TABLE public.user_info (
	id serial4 NOT NULL,
	nickname varchar(100) NOT NULL,
	posts numeric NOT NULL,
	CONSTRAINT user_info_nickname_key UNIQUE (nickname),
	CONSTRAINT user_info_pkey PRIMARY KEY (id)
);


-- DROP FUNCTION insert_user_info
create or replace function insert_user_info(user_name varchar, posts_number numeric)
returns void as 
$$
	begin
		insert into user_info (nickname, posts)
		values (user_name, posts_number)
		on conflict (nickname)
		do update set 
			posts = EXCLUDED.posts;
	end;
$$ language plpgsql;


-- Como funciona o declare e seus tipos
declare
    user_id integer;
    preco numeric;
    minhlinha minhatabela%ROWTYPE; -- pega a tupla dos tipos daquela tabela
    meucampo minhatabela.nomecoluna%TYPE; -- pega o tipo daquela coluna
    qtd integer default 32;
    uri varchar := 'http://mysite.com';
    k CONSTANT integer := 10;

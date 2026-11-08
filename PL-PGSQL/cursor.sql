-- name [ [ NO ] SCROLL ] CURSOR [ (arguments) ] FOR query;
declare 
    curs1 refcursor;
    curs2 CURSOR FOR SELECT * FROM projeto;
    curs3 CURSOR (chave integer)
        FOR SELECT * FROM projeto WHERE cod_proj = chave;


------- Exemplo 1 -------
create or replace function list_produtos(prod_cursor refcursor)
returns refcursor as $$ 

	begin  
		open prod_cursor for select * from produto;
		return prod_cursor;		

	end;
$$ language plpgsql;



select list_produtos('prod_cur');
fetch 3 in prod_cur;
------------------------------
select list_produtos('prod_cur');
fetch absolute 3 from prod_cur;
fetch prior from prod_cur;


--------------------------- 
do $$
	declare 
		resultado produto%ROWTYPE;
		prod_cur refcursor; 
	begin
		select list_produtos('prod_cur') into prod_cur;
		fetch absolute 3 from prod_cur into resultado;
		fetch relative 5 from prod_cur into resultado;
		if not found then
			raise exception 'Linha não encontrada';
		end if;
		raise notice 'resltado: %',resultado;
end $$;
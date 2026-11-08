do $$	
begin
	
	for counter in 1..5 loop 
		raise notice 'counter: %', counter;
	end loop;
end $$;


-- pulando 2 em 2

do $$	
begin
	
	for counter in 1..5 by 2 loop 
		raise notice 'counter: %', counter;
	end loop;
end $$;

-- counter: 1
-- counter: 3
-- counter: 5


-- fatorial
do $$	
    declare
        init bigint := 5;
        fat bigint := 1;
    begin
        
        for num in reverse init..1 loop
            fat = fat * num;
            raise notice 'num: %', num;
        end loop;

        raise notice 'resultado: %', fat;
end $$;

-- com select

do $$	
	declare
		rec text;
         -- Pode ser com o tipo record ou o tipo membro%ROWTYPE mas ai tem que tratar na ordem da tabela
	begin
		
		for rec in select papel from membro loop
			raise notice 'rec: %', rec;
		end loop;
	
end $$;
do $$ 
	declare
		total_of_members numeric; 
	begin
		select count(*) from membro into total_of_members;
		raise notice ' Olha o total ai %', total_of_members;

end $$;

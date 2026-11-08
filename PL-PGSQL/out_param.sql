
-- pode usar INOUT também
create or replace function say_hello(out say varchar, out hello varchar)
as $$
	
	begin
		select 'say' into say;
		select 'hello' into hello;
	end;

$$ language plpgsql;

-- ou

create or replace function say_hello(out say varchar, out hello varchar) returns record -- Record o único tipo que dá utilizando OUT e INOUT
as $$
	
	begin
		select 'say' into say;
		select 'hello' into hello;
	end;

$$ language plpgsql;

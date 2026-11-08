create or replace function fatorial(n bigint) 
returns bigint as $$
	declare 
		fat bigint := 1;
	begin
		while (2 <= n) loop
			fat := fat * n;
			n := n - 1;
		end loop;
		return fat;
	end;
$$ language plpgsql; 

fatorial(2)
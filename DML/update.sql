update membro set
papel = 'PM'
where id_membro = 1;

update membro 
set salario = 8000
where papel like '%PM%';

update membro
set salario = salario * 1.1
where papel like '%Desenvolvedor%';


-- Utilizar 'FOR UPDATE' para não ocorreu Lost Update na aplicação;
-- Pessimistic Locking
begin;
    select id_membro from membro for update -- OU for update SKIP LOCKED OU for update NOWAIT
    update conta
    set saldo = saldo + 10
    where id_membro = 1;
commit; 

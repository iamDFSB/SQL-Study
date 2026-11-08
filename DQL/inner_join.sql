-- forma 1
select m.nome, d.nome_departamento  
from membro m, departamento d
    where m.id_departamento = d.id_departamento;

-- forma 2
select m.nome, d.nome_departamento from membro m
inner join departamento d
    on m.id_departamento = d.id_departamento;

-- forma 3
select m.nome, d.nome_departamento from membro m
join departamento d 
    on m.id_departamento = d.id_departamento 
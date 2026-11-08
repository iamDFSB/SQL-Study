select m.id_membro from membro m 
intersect
select r.id_membro from realiza r


-- Interseccao com JOIN
select distinct(m.id_membro) from membro m 
inner join realiza r 
on r.id_membro = m.id_membro
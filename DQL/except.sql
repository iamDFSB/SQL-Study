select m.id_membro from membro m 
except
select r.id_membro from realiza r

-- Diferenca com JOIN
select m.* from membro m 
left join realiza r 
on r.id_membro = m.id_membro 
where r.id_membro is null


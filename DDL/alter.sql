alter table membro
add column salario numeric;

alter table membro
drop column salario;

alter table membro
rename to membro_;

alter table membro 
alter column salario set not null;

alter table membro 
add column id_departamento int references departamento(id_departamento);

ALTER TABLE user_info 
ADD UNIQUE (nickname);

-- Atualizar uma constraint
alter table membro 
drop constraint membro_id_departamento_fkey;

alter table membro 
add constraint membro_id_departamento_fkey
FOREIGN KEY (id_departamento) 
REFERENCES public.departamento(id_departamento)
on delete restrict
on update cascade;

begin;
	update membro set salario = salario * 1.1 where id_departamento = 1;
	savepoint increase_salario; -- ponto salvo
	update membro set salario = salario * 1.1 where id_departamento = 3; -- Ação não realizada
    rollback to increase_salario;
commit;
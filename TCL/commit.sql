begin; -- Começa uma transação
	update membro set salario = salario * 1.1 where id_departamento = 1;
	update membro set salario = salario * 1.1 where id_departamento = 3;
commit; --Termina essa transação afirmando tudo que aconteceu antes
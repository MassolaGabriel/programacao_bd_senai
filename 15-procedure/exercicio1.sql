/* Questão 1 - Números Pares de 1 a 100: 
Este procedimento iterativo passa por todos os números de 1 a 100 e seleciona apenas os números pares. Ao familiarizar-se com este procedimento, você aprenderá a implementar condicionais simples (IF) e loops (WHILE) no MySQL */

delimiter //
create procedure imprimindo_pares()
begin
	declare contador int default 1;
    declare numeros_pares text default '';

	while contador <= 100 do
    if contador % 2 = 0 then
	set numeros_pares = concat(numeros_pares, contador, ", ");
    end if;
    
    set contador = contador + 1;
	
    end while;
    
    select numeros_pares;

end //
delimiter ;

call imprimindo_pares();

/* Questão 2 - Múltiplos de Cinco entre os Números Pares: 
Este procedimento é uma variação do primeiro, onde ele ainda seleciona números pares de 1 a 100, mas também verifica se o número par é um múltiplo de cinco. Se for, ele exibe uma mensagem especial indicando que o número é um múltiplo de cinco. Este exercício introduz aninhamento de condicionais (IF) e a função CONCAT para manipulação de strings.
*/

delimiter //
create procedure multiplos_cinco_pares()
begin
	declare contador int default 1;
    declare numeros_pares_cinco text default '';
    
    -- Não tenho ideia como está funcionando mas funciona
    while contador <= 100 do
    if contador % 2 = 0 and contador % 5 = 0 then
    set numeros_pares_cinco = concat(numeros_pares_cinco, contador, ' multiplo de 5, ');
    elseif contador % 2 = 0 then
    set numeros_pares_cinco = concat(numeros_pares_cinco, contador, ' é  par, ');
    end if;
	
    set contador = contador + 1;
    
    end while;
    
    select numeros_pares_cinco;
end //
delimiter ;

call multiplos_cinco_pares();
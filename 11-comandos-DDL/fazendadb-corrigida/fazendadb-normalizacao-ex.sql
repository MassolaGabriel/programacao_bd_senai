select * from funcionarios;

create table funcao as select funcao from funcionarios;
select * from funcao;

alter table funcao add column id int primary key auto_increment first;
alter table funcionarios add column fk_id_funcao int after salario;

alter table funcionarios add constraint fk_func foreign key(fk_id_funcao)
references funcao(id);

select * from funcionarios fn
inner join funcao f on f.funcao = fn.funcao;
desc funcionarios
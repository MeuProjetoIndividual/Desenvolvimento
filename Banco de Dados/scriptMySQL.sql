create database AniMundo;
use AniMundo;
drop database AniMundo;

create table Usuario(
	idUsuario int primary key auto_increment,
    nome varchar(45),
    email varchar(100) unique,
    senha varchar(45),
    cargo varchar(45)
);

select * from Usuario;
truncate table Usuario;

create table Partida(
	idPartida int primary key auto_increment,
    dia date,
    qtdAcerto int,
    qtdErro int,
    fkUsuario int,
    constraint fkQuestaoUsuairo foreign key (fkUsuario)
		references Usuario(idUsuario)
);
    
insert into partida(dia, qtdAcerto, fkUsuario) values
	(current_date(), 3, 6);
select * from partida;
select count(idPartida), sum(qtdAcerto), sum(qtdErro) from Partida
	where fkUsuario = 2;
select sum(qtdAcerto), nome from Partida
	join Usuario on fkUsuario = idUsuario
    where dia = current_date()
	group by fkUsuario order by sum(qtdAcerto) desc limit 3;
    

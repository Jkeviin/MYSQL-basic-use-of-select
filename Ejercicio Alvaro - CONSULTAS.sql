create database consultas;

use consultas;

create table PRODUCTO (codigo int  not null,
			nombre varchar(100) not null,
			precio double not null,
            codigo_fabricante INT not null,
            constraint pk_producto primary key (codigo) 
            );

create table FABRICANTE (codigo int not null,
			nombre varchar(100) not null,
            constraint pk_fabricante primary key (codigo)
            );

alter table PRODUCTO add constraint fk_producto_fabricante foreign key (codigo_fabricante) references FABRICANTE(codigo);

insert into FABRICANTE (codigo,nombre) values (1,'adidas'),(2,'fox'),(3,'falabella'),
											  (4,"gussi"),(5,"koaj"),(6,"balenciaga");

insert into PRODUCTO (codigo,nombre,precio,codigo_fabricante) 
			values (1,'camisa',50000,1),(2,'pantalon',95000,2),(3,'zapatos',200000,1),(4,'corbata',20000,3),
				   (5,"medias",5000,1),(6,"sacos",220000,4),(7,"gorro",25000,5),(8,"vestido",350000,6);

use consultas;

/*1*/
select nombre from PRODUCTO;
/*2*/
select nombre, precio from PRODUCTO;
/*3*/
select * from PRODUCTO;
/*4*/
select nombre, precio/4172, precio/3798  from PRODUCTO;
/*5*/
select nombre as "nombre de producto", precio/4172 as euros, precio/3798 as dolares from PRODUCTO;
/*6*/
select UPPER(nombre),precio from PRODUCTO;
/*7*/
select LOWER(nombre),precio from PRODUCTO;
/*8*/
select nombre, upper(LEFT(nombre,2))  from FABRICANTE;
/*9*/
select nombre,round(precio,2) from PRODUCTO;
/*10*/
select nombre,TRUNCATE(precio,0) from PRODUCTO;
/*11*/
select codigo_fabricante from PRODUCTO;
/*12*/
select distinct codigo_fabricante from PRODUCTO;
/*13*/
select nombre from FABRICANTE ORDER BY nombre ASC;
/*14*/
select nombre from FABRICANTE ORDER BY nombre DESC;
/*15*/
select nombre, precio from PRODUCTO ORDER BY nombre asc, precio desc;
/*16*/
select * from FABRICANTE LIMIT 5;
/*17----*/
select * from FABRICANTE WHERE codigo LIMIT 3,4;
/*18*/
select nombre, precio from PRODUCTO ORDER BY precio asc LIMIT 1;
/*19*/
select nombre, precio from PRODUCTO ORDER BY precio desc LIMIT 1;
/*20*/
select nombre from PRODUCTO where codigo_fabricante = 2;
/*21---En peso colombiano NINGUNO tiene menor a 120*/
select nombre from PRODUCTO where precio <= 120;
/*22---En peso colombiano TODOS tiene menor a 400*/
select nombre from PRODUCTO where precio >= 400;
/*23----*/
select nombre from PRODUCTO where NOT precio >= 400;
/*24*/
select nombre from PRODUCTO where precio BETWEEN 80 and 300;
/*25*/
select nombre from PRODUCTO where precio BETWEEN 60 and 200;
/*26*/
select nombre from PRODUCTO where precio > 200 and codigo_fabricante = 6;
/*27*/
select nombre from PRODUCTO where codigo_fabricante=1 or codigo_fabricante = 3 or codigo_fabricante = 5;
/*28*/
select nombre from PRODUCTO where codigo_fabricante in(1,3,5);
/*29*/
select nombre, precio*100 as centimos from PRODUCTO;
/*30--NINGUNA COMIENZA CON S*/
select nombre from FABRICANTE where nombre like 's%';
/*31--NINGUNA TERMINA CON e*/
select nombre from FABRICANTE where nombre like '%e';
/*32--NINGUNA CONTIENE CON w*/
select nombre from FABRICANTE where nombre like '%w%';
/*33*/
select nombre from FABRICANTE where nombre like '____';
/*34*/
select nombre from PRODUCTO where nombre like '%camisa%';
/*35*/
select nombre from PRODUCTO where nombre like '%gorro%' and precio < 215;
/*36*/
select precio,nombre from PRODUCTO where precio >= 180 ORDER BY precio desc, nombre asc;

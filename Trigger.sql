create or replace function tg_jefe() returns trigger
as
$tg_jefe$
declare
permisos int;
maximo int=15;
begin
select max(duracion_permiso)into permisos from permiso where duracion_permiso=new.duracion_permiso;
if (permisos>= maximo) then
raise EXCEPTION 'ERROR EL EMPLEADO NO PUEDE SER JEFE HA EXEDIDO LOS PERMISOS MAXIMOS';
else
raise notice 'FELICIDADES EL EMPLEADO SI PUEDE SER JEFE';
return new;
end if;
end;
$tg_jefe$
language 'plpgsql';



create trigger tg_jefe after insert
on permiso for each row
execute procedure tg_jefe();



INSERT INTO PERMISO VALUES (68, 204, '22/10/2022', 'ACADEMICO', 1, 18 )
INSERT INTO PERMISO VALUES (68, 204, '22/10/2022', 'ACADEMICO', 1, 2 )

do $$
declare
sueldo record;
cursor_sueldo cursor for
select extract (year from fecha_ingreso) as año, nombre_departamento, sueldo_anual
	from departamento
	order by extract (year from departamento.fecha_ingreso) desc, nombre_departamento, sueldo_anual;
begin
open cursor_sueldo ;
fetch cursor_sueldo into sueldo ;
while (found)loop raise notice 'AÑO: %:, NOMBRE DE DEPARTAMENTO: %, SUELDO ANUAL: %',
sueldo.año,
sueldo.nombre_departamento, sueldo.sueldo_anual;
fetch cursor_sueldo into sueldo ;
end loop;
end $$
language plpgsql;
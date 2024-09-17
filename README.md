# Antig-edades_Bd

## COnsultas realizadas a la Bd.

### 1. Consulta para listar todas las antigüedades disponibles para la venta:
Obtén una lista de todas las piezas antiguas que están actualmente disponibles para la
venta, incluyendo el nombre de la pieza, su categoría, precio y estado de conservación.

```sql
SELECT p.nombre, t.nombre, p.precio, e.nombre, tp.nombre 
FROM pieza p 
INNER JOIN tipoantiguedad t ON t.id = p.idtipoantiguedad
INNER JOIN estadoconservacion e ON e.id = p.idestadoconservacion
INNER JOIN inventario i ON i.idpieza = p.id 
INNER JOIN tipoestadopieza tp ON tp.id = i.idestado 
WHERE tp.nombre = 'disponible';

```
### resultado
| Nombre               | Tipo de Antigüedad | Precio  | Estado de Conservación | Estado  |
|----------------------|--------------------|---------|------------------------|---------|
| Pintura Renacentista | Antiguo            | 50000.0 | Nuevo                  | Disponible |
| Escultura Moderna    | Moderno            | 15000.0 | Usado                  | Disponible |
| Joya Antigua         | Raro               | 20000.0 | Antiguo                | Disponible |


### 2.Consulta para buscar antigüedades por categoría y rango de precio:
"Busca todas las antigüedades dentro de una categoría específica (por ejemplo, 'Muebles')
que tengan un precio dentro de un rango determinado (por ejemplo, entre 500 y 2000
dólares)."


```sql
select t.nombre, p.precio from pieza p 
inner join tipoantiguedad t on p.idtipoantiguedad =t.id 
where p.idtipoantiguedad =1 and p.precio between 1000 and 40000;
```

### Resultado

| Tipo de Antigüedad | Precio  |
|--------------------|---------|
| Antiguo            | 15000.0 |
| Antiguo            | 20000.0 |

### 3. Consulta para mostrar el historial de ventas de un cliente específico:
"Muestra todas las piezas antiguas que un cliente específico ha vendido, incluyendo la fecha de la venta, el precio de venta y el comprador."
```sql
select per.nombre, p.nombre,t.idpersona from pieza p 
inner join persona per on per.id =p.idpropietario
inner join transaccion_venta t on p.id =t.idpieza 
where p.id =1;
```
| Nombre | Objeto                | Cantidad |
|--------|-----------------------|----------|
| Juan   | Pintura Renacentista  | 1        |








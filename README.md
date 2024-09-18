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


### 4. Consulta para obtener el total de ventas realizadas en un periodo de tiempo:
"Calcula el total de ventas realizadas en un período específico, por ejemplo, durante el último
mes

```
SELECT 
    SUM(tv.precioventa) AS total_ventas
FROM 
    transaccion_venta tv
WHERE 
    tv.fecha_venta BETWEEN '2024-08-01' AND '2024-08-31';
```
| Total ventas |
|----|---------------|
| 15.000 |



### 5. Consulta para encontrar los clientes más activos (con más compras realizadas):
"Identifica los clientes que han realizado la mayor cantidad de compras en la plataforma."

```
SELECT 
    p.id AS cliente_id,
    CONCAT(p.nombre, ' ', p.apellido) AS cliente_nombre,
    COUNT(tv.id) AS cantidad_compras
FROM 
    persona p
INNER JOIN 
    transaccion_venta tv ON p.id = tv.idpersona
GROUP BY 
    p.id, p.nombre, p.apellido
ORDER BY 
    cantidad_compras DESC
LIMIT 1;

```
| ID | Nombre        | Cantidad |
|----|---------------|----------|
| 1  | Juan Pérez    | 1        |


### 6. Consulta para listar las antigüedades más populares por número de visitas o consultas:
"Muestra las piezas antiguas que han recibido la mayor cantidad de visitas o consultas por
parte de los usuarios.


### 7. Consulta para listar las antigüedades vendidas en un rango de fechas específico:
"Obtén una lista de todas las piezas antiguas que se han vendido dentro de un rango de
fechas específico, incluyendo la información del vendedor y comprador."

```
SELECT 
    p.nombre AS nombre_pieza,
    p.descripcion,
    p.precio,
    tv.fecha_venta,
    v.nombre AS nombre_vendedor,
    v.apellido AS apellido_vendedor,
    c.nombre AS nombre_comprador,
    c.apellido AS apellido_comprador
FROM 
    pieza p
INNER JOIN 
    transaccion_venta tv ON p.id = tv.idpieza
INNER JOIN 
    persona v ON tv.idpersona = v.id -- Suponiendo que el vendedor es la misma persona que el comprador
INNER JOIN 
    persona c ON tv.idpersona = c.id -- Asegúrate de ajustar esto si vendedor y comprador son diferentes
WHERE 
    tv.fecha_venta BETWEEN '2024-01-01' AND '2024-09-01';
```
| Nombre pieza              | Descripción                | Precio  | Fecha venta       | Nombre propietario | Apellido propietario | Nombre comprador| Apellido comprador|
|----------------------|----------------------------|---------|-------------|----------|------------|----------|------------|
| Pintura Renacentista | Pintura del siglo XV       | 50000.0 | 2024-02-05  | Juan     | Pérez      | Juan     | Pérez      |
| Escultura Moderna    | Escultura contemporánea    | 15000.0 | 2024-08-28  | Ana      | García     | Ana      | García     |


### 8. Consulta para obtener un informe de inventario actual:
"Genera un informe del inventario actual de antigüedades disponibles para la venta,
mostrando la cantidad de artículos por categoría."

```
SELECT 
    ta.nombre AS categoria_antiguedad,
    ec.nombre AS estado_conservacion,
    SUM(i.cantidad) AS cantidad_total
FROM 
    inventario i
INNER JOIN 
    pieza p ON i.idpieza = p.id
INNER JOIN 
    tipoantiguedad ta ON p.idtipoantiguedad = ta.id
INNER JOIN 
    estadoconservacion ec ON p.idestadoconservacion = ec.id
WHERE 
    i.idestado = (SELECT id FROM tipoestadopieza WHERE nombre = 'disponible')
GROUP BY 
    ta.nombre, ec.nombre
ORDER BY 
    ta.nombre, ec.nombre;
```
| Tipo de Antigüedad | Estado de Conservación | Cantidad |
|--------------------|------------------------|----------|
| Antiguo            | Antiguo                | 2        |
| Antiguo            | Nuevo                  | 1        |
| Antiguo            | Usado                  | 5        |






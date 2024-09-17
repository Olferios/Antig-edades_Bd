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






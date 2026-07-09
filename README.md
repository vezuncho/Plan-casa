# CasaPlan v32 - Compra inteligente

Cambios:
- Lista de compra con categorías.
- Cantidad, unidad, tienda, precio estimado y notas.
- Total estimado de la compra.
- Historial para comprar otra vez.
- Registro de quién marcó un producto como comprado.

SQL: ejecutar `supabase/migracion_desde_v31_a_v32.sql` si vienes de v31.


## v33 - Productos más comprados

- Añadida sección **Más comprados** en la compra inteligente.
- Permite añadir de nuevo productos habituales con un toque.
- Evita duplicados si el producto ya está pendiente.
- Mantiene categoría, unidad y tienda habitual.
- No necesita SQL nuevo si ya ejecutaste la migración v31 → v32.

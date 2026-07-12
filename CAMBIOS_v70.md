# CasaPlan v70 — limpieza segura

- Eliminada por completo la limpieza automática de tareas realizadas al abrir la app.
- Ningún dispositivo nuevo, reinstalado o con datos borrados puede disparar un borrado automático.
- La limpieza del mes anterior queda únicamente como acción manual del administrador principal.
- Antes de borrar se muestra el número de tareas afectadas, una advertencia irreversible y una segunda confirmación escribiendo `BORRAR`.
- Eliminada la dependencia de `localStorage` como supuesto seguro de ejecución única.
- La vista de realizadas informa ahora de que las tareas no se borran automáticamente.

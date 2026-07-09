# CasaPlan v22

Proyecto preparado para GitHub + Cloudflare Pages + Supabase.

## Importante

No subas este ZIP directamente a GitHub. Primero hay que descomprimirlo.

En el repositorio deben verse estos archivos en la raíz:

- index.html
- manifest.webmanifest
- version.json
- _headers
- assets/
- supabase/
- docs/

Si GitHub solo muestra un archivo .zip, Cloudflare dará error 404.

## Cloudflare Pages

Configuración recomendada:

- Framework: Ninguno
- Comando de compilación: vacío
- Directorio de salida: / o .
- Rama: main

## Supabase

Si la base de datos ya funciona desde v18/v19/v20, no hace falta volver a ejecutar SQL.
El SQL completo queda guardado en /supabase como copia de seguridad.

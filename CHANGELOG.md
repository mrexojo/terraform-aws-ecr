# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
y este proyecto se adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-05-07

### Añadido
- Configuración de cifrado para repositorios (AES256 y KMS)
- Política de repositorio con acceso restringido por cuentas de AWS
- Escaneo de imágenes al subir activado por defecto
- Políticas de ciclo de vida optimizadas para gestión de imágenes
- GitHub Actions para automatizar la validación y pruebas
- Evaluación de seguridad y cumplimiento
- Documentación detallada y ejemplos de uso
- Soporte para replicación cross-region
- Configuración de inmutabilidad de etiquetas
- Soporte para pull-through cache
- Validación de parámetros de entrada

### Cambiado
- Actualizada la versión de la política a 2012-10-17
- Restringido el acceso a cuentas específicas en lugar de permitir acceso público
- Eliminados permisos destructivos del conjunto de permisos por defecto
- Mejoradas las etiquetas para seguir convenciones modernas

### Seguridad
- Eliminados permisos peligrosos (DeleteRepository, BatchDeleteImage)
- Implementada restricción de acceso por cuenta AWS
- Añadido soporte para cifrado KMS personalizado
- Opción para establecer inmutabilidad de etiquetas de imágenes

## [0.0.1] - 2020-05-15

### Añadido
- Funcionalidad básica para crear repositorios ECR
- Plantilla de política simple
- Configuración básica de ciclo de vida
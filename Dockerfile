# Etapa de construcción
FROM swift:5.7 as builder

# Establece el directorio de trabajo
WORKDIR /build

# Copia el código fuente al contenedor
COPY . .

# Construye el ejecutable en modo release
RUN swift build --configuration release

# Etapa de ejecución
FROM swift:5.7-slim

# Establece el directorio de trabajo en el contenedor final
WORKDIR /app

# Copia el ejecutable desde la etapa de construcción
COPY --from=builder /build/.build/release/App ./App

# Expone el puerto en el que corre la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["./App", "serve"]

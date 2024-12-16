# ================================
# Build image
# ================================
FROM swift:6.0-jammy AS build


# Set up a build area
WORKDIR /build

# Copy entire repo into container
COPY . .

# Build everything, with optimizations, with static linking, and using jemalloc
# N.B.: The static version of jemalloc is incompatible with the static Swift runtime.
RUN swift build -c release \
                --static-swift-stdlib \
                -Xlinker -ljemalloc

# Switch to the new home directory
WORKDIR /app

# Copy built executable and any staged resources from builder
COPY --from=build --chown=vapor:vapor /staging /app


# Ensure all further commands run as the vapor user
USER vapor:vapor

# Let Docker bind to port 8080
EXPOSE 8080

# Start the Vapor service when the image is run, default to listening on 8080 in production environment
CMD ["./App", "serve"]


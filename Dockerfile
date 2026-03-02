# 1. VERSION PINNING: Never use 'latest' in production. It leads to unpredictable builds.
# Replace 6.0.14 with the specific version of MongoDB your app requires.
FROM mongo:6.0.14

# 2. METADATA: Good practice for container registry organization.
LABEL maintainer="Your Name <your.email@example.com>" \
      description="Production MongoDB image for Roboshop Catalogue"

WORKDIR /docker-entrypoint-initdb.d

# 3. LEAST PRIVILEGE: The official Mongo image creates a 'mongodb' user (UID 999).
# We change ownership of the init scripts so MongoDB can read them securely without needing root.
COPY --chown=999:999 *.js .

# 4. IMMUTABILITY: Ensure the initialization scripts are read-only to prevent accidental modification.
RUN chmod 0444 *.js
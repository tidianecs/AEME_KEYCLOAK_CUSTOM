FROM quay.io/keycloak/keycloak:24.0

# Copie le thème custom
COPY keycloak-theme/aeme /opt/keycloak/themes/aeme

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
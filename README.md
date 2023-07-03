Despliegue automático Zabbix
---

Organizacion del proyecto:
```shell
zabbix/
├── README.md
├── roles
│   ├── adduser
│   │   └── tasks
│   │       └── main.yml
│   ├── install
│   │   ├── tasks
│   │   │   ├── config_locale_en_US.UTF-8.yml
│   │   │   ├── config_mariadb_6.0.yml
│   │   │   ├── config_mariadb_6.4.yml
│   │   │   ├── config_mariadb_7.0.yml
│   │   │   ├── config_php-cgi.yml
│   │   │   ├── import_config_zabbix.yml
│   │   │   ├── import_php_config.yml
│   │   │   ├── install_dependencias_debian.yml
│   │   │   ├── install_dependencias_redhat.yml
│   │   │   ├── install_zabbix_debian.yml
│   │   │   ├── install_zabbix_redhat.yml
│   │   │   ├── main.yml
│   │   │   ├── reload_agent.yml
│   │   │   ├── reload_apache2.yml
│   │   │   ├── reload_httpd.yml
│   │   │   ├── reload_mariadb.yml
│   │   │   └── reload_zabbix.yml
│   │   └── templates
│   │       ├── php.ini.j2
│   │       └── zabbix_server.conf.j2
│   ├── remove
│   └── status
└── run.yml
```

EJEMPLO MODO DE USO:
---
ansible-playbook run.yml -e "Install=true" -e "dbname=" -e "dbuser=" -e "dbpass="

| Argumentos | Detalles |
| --------- | --------- |
| Install=true | Comienza la instalacion |
| Remove=true | Remueve una instalacion previa |
| Status=true | Ejecuta "HealCheking" y muestra los resultados |
| dbname= | insertar el nombre de la base de datos |
| dbuser= | insertar el nombre del usuario para la base de datos |
| dbpass= | insertar el password para usuario de la base de datos |
| version= | indica la version que necesita instalar |
| adduser= | permite crear un usuario en una instancia ya pre-instalada de zabbix |
| add_user_name= | permite crear un usuario en una instancia ya pre-instalada de zabbix |
| add_user_pass= | define la password del usuario que desea agregar |

| Version | Instalacion |
| --------- | --------- |
| 6.0 | Pass... |
| 6.4 | Pending.. |
| 7.0 | Pass... |

Sistema Operativos soportados:
---
| System | Check |
| ------ | ----- |
| Debian | OK |
| Ubuntu | OK |
| RedHat | -- |
| AlmaLinux | -- |

Requisitos:
---
Consulte en: https://www.zabbix.com/documentation/6.4/en/manual/installation/requirements

Para este playbook se utilizó:

CPU: 2 Cores
RAM: 8 GiB
DISK: 100 GiB

ROADMAP BUILDING:
---
### INSTALAR PRE-REQUISITOS
### FIX WEB LOCALE UTC-8
### RECARGA DE SERVICIOS
### CONFIGURACION DE PHP
### INSTALACION ZABBIX
### IMPORTA CONF. ZABBIX
### CONFIGURACION DE LA BASE DE DATOS ZABBIX
### RECARGA DE SERVICIOS

Para acceder a la consola de Zabbix
http://direccionIP/zabbix

Las credenciales por defecto:
usuario: Admin
Passwd: zabbix


ABOUT ME
---
Rodrigo Daniel Bedani
rbedani@flexxible.com
DevOps | Flexxible IT
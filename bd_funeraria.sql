/*Creación de la BD*/
CREATE database bd_funeraria;
/*Creación de las tablas necesarias*/

CREATE TABLE funeraria( 
  id_funeraria INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(40) NOT NULL,
  telefono VARCHAR(20),
  direccion VARCHAR(50) NOT NULL,
  logo_funeraria VARCHAR (100) ,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_funeraria) 
)ENGINE=INNODB;

INSERT INTO funeraria VALUES(1, 'Vida Nueva',' 77878776', 'calle cochabamba','logo_funeraria.JPG', now(), now(), 1, 1);



CREATE TABLE empleados( 
  id_empleado INT NOT NULL AUTO_INCREMENT,
  id_funeraria INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellido VARCHAR(40) NOT NULL,
  c_i VARCHAR(20) NOT NULL,
  telefono VARCHAR(20),
  direccion VARCHAR(50),
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_empleado),
  FOREIGN KEY (id_funeraria) REFERENCES funeraria (id_funeraria)
)ENGINE=INNODB;

INSERT INTO empleados VALUES(1,1,'maribel','chambi','7204284','60254854','b/4 de julio', now(), now(), 1, 1);
INSERT INTO empleados VALUES(2,1,'gregorio','mendoza','7204384','60254864','rancho norte', now(), now(), 1, 1);
INSERT INTO empleados VALUES(3,1,'gonzalo','sanchez','7204484','60254874','b/contructor', now(), now(), 1, 1);
INSERT INTO empleados VALUES(4,1,'sinthya','tolaba','7204584','60254884','b/la loma', now(), now(), 1, 1);
INSERT INTO empleados VALUES(5,1,'delia','paredes','7204684','60254894','b/la loma', now(), now(), 1, 1);
INSERT INTO empleados VALUES(6,1,'mari','chambi','7204284','60254854','b/4 de julio', now(), now(), 1, 1);


CREATE TABLE areas( 
  id_area INT NOT NULL AUTO_INCREMENT,
  id_empleado INT NOT NULL,
  nombre VARCHAR(40),
  descripcion VARCHAR(50) NOT NULL,
  salario FLOAT,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_area),
  FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
)ENGINE=INNODB;

INSERT INTO areas VALUES(1,1,'limpieza','limpiar todo el lugar', '2000', now(), now(), 1, 1);
INSERT INTO areas VALUES(2,2,'chofer','lleva los cajones', '2200', now(), now(), 1, 1);
INSERT INTO areas VALUES(3,3,'chofer','maneja el auto funebre', '2200', now(), now(), 1, 1);
INSERT INTO areas VALUES(4,4,'encargada','supervisar', '2200', now(), now(), 1, 1);
INSERT INTO areas VALUES(5,5,'atencion al cliente','la persona encargadade atender a los clientes', '2200', now(), now(), 1, 1);
INSERT INTO areas VALUES(6,6,'encargada','supervisar', '2200', now(), now(), 1, 1);



CREATE TABLE horario_empleados( 
  id_horario_empleado INT NOT NULL AUTO_INCREMENT,
  id_empleado INT NOT NULL,
  dias VARCHAR(20) NOT NULL,
  horario_entrada VARCHAR(50) NOT NULL,
  horario_salida VARCHAR(20),
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_horario_empleado),
  FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
)ENGINE=INNODB;

INSERT INTO horario_empleados VALUES(1,1,'lunes a viernes','08:00', '18:00', now(), now(), 1, 1);
INSERT INTO horario_empleados VALUES(2,2,'lunes a domingo', '08:00', '18:00', now(), now(), 1, 1);
INSERT INTO horario_empleados VALUES(3,3,'lunes a domingo', '08:00', '18:00', now(), now(), 1, 1);
INSERT INTO horario_empleados VALUES(4,4,'lunes a domingo', '08:00', '18:00', now(), now(), 1, 1);
INSERT INTO horario_empleados VALUES(5,5,'lunes a domingo','08:00', '18:00', now(), now(), 1, 1);

INSERT INTO horario_empleados VALUES(6,6,'lunes a domingo','08:00', '18:00', now(), now(), 1, 1);



CREATE TABLE clientes( 
  id_cliente INT NOT NULL AUTO_INCREMENT,
  id_funeraria INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellido VARCHAR(40) NOT NULL,
  c_i VARCHAR(20) NOT NULL,
  telefono VARCHAR(20),
  direccion VARCHAR(50) NOT NULL,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_cliente),
  FOREIGN KEY (id_funeraria) REFERENCES funeraria (id_funeraria)
)ENGINE=INNODB;

INSERT INTO clientes VALUES(1,1,'ana','Escudero','6025485','70220428','san lorenzo', now(), now(), 1, 1);
INSERT INTO clientes VALUES(2,1,'Cristian','Guerrero','6025486','70220438','rancho norte', now(), now(), 1, 1);
INSERT INTO clientes VALUES(3,1,'Leo','Jurado','6025487','70220448','rancho sur', now(), now(), 1, 1);
INSERT INTO clientes VALUES(4,1,'Hugo','Conde','6025488','70220458','tomatitas', now(), now(), 1, 1);
INSERT INTO clientes VALUES(5,1,'Luz','Aguado','6025489','70220468','la loma', now(), now(), 1, 1);
INSERT INTO clientes VALUES(6,1,'Sara','Pinto','6025490','70220478','villa avaroa', now(), now(), 1, 1);
INSERT INTO clientes VALUES(7,1,'Ulises','Mamani','6025491','70220488','juan xxlll', now(), now(), 1, 1);
INSERT INTO clientes VALUES(8,1,'Alejandro','Quispe','6025492','70220498','san jorge', now(), now(), 1, 1);
INSERT INTO clientes VALUES(9,1,'Maria','Echeverría','6025493','70220508','san mateo', now(), now(), 1, 1);
INSERT INTO clientes VALUES(10,1,'Samuel','Gallardo','6025494','70220518','1 de mayo', now(), now(), 1, 1);



CREATE TABLE servicios_clientes (
  id_servicio_cliente INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  descripcion VARCHAR (40) NOT NULL,
  fecha DATE,
  precio FLOAT,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_servicio_cliente),
  FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
)ENGINE=INNODB;

INSERT INTO servicios_clientes VALUES(1,1,'servicio de sepelio','2021-09-25','3500', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(2,2,'solo ataúd','2021-10-2','1800', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(3,3,'salon de velatorio','2021-10-5','3500', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(4,4,'servicio de sepelio','2021-10-15','3500', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(5,5,'ataúd suelto ','2021-11-15','1800', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(6,6,'servicio de sepelio','2021-11-5','3500', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(7,7,'ataud, salon de velatorio','2021-11-15','3500', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(8,8,'salon de velatorio, servicio de sepelio','2021-12-23','3500', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(9,9,'ataúd suelto ','2021-12-24','1800', now(), now(), 1, 1);
INSERT INTO servicios_clientes VALUES(10,10,'salon de velatorio','2021-12-25','3500', now(), now(), 1, 1);



CREATE TABLE gerentes( 
  id_gerente INT NOT NULL AUTO_INCREMENT,
  id_funeraria INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellido VARCHAR(40),
  c_i VARCHAR(20) NOT NULL,
  profesion VARCHAR(30),
  telefono VARCHAR(20) NOT NULL,
  direccion VARCHAR(50),
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_gerente),
  FOREIGN KEY (id_funeraria) REFERENCES funeraria (id_funeraria)
)ENGINE=INNODB;

INSERT INTO gerentes VALUES(1,1,'Mario','Coca','77878776','adminitracion de empresas','60254854','b/4 de julio', now(), now(), 1, 1);
INSERT INTO gerentes VALUES(2,1,'Veronica','Chauque','7204284','contaduria','60254854','b/ la loma', now(), now(), 1, 1);

INSERT INTO gerentes VALUES(3,1,'Leo','Coca','77878776','adminitracion de empresas','60254854','b/4 de julio', now(), now(), 1, 1);
INSERT INTO gerentes VALUES(4,1,'Maria','Chauque','7204284','contaduria','60254854','b/ la loma', now(), now(), 1, 1);
INSERT INTO gerentes VALUES(5,1,'Marisol','Coca','77878776','adminitracion de empresas','60254854','b/4 de julio', now(), now(), 1, 1);
INSERT INTO gerentes VALUES(6,1,'Samuel','Chauque','7204284','contaduria','60254854','b/ la loma', now(), now(), 1, 1);

INSERT INTO gerentes VALUES(7,1,'Leo','Coca','77878776','adminitracion de empresas','60254854','b/4 de julio', now(), now(), 1, 1);
INSERT INTO gerentes VALUES(8,1,'Maria','Chauque','7204284','adminitracion de empresas','60254854','b/ la loma', now(), now(), 1, 1);
INSERT INTO gerentes VALUES(9,1,'Marisol','Coca','77878776','contaduria','60254854','b/4 de julio', now(), now(), 1, 1);
INSERT INTO gerentes VALUES(10,1,'Samuel','Chauque','7204284','contaduria','60254854','b/ la loma', now(), now(), 1, 1);



CREATE TABLE tipo_productos (
  id_tipo_producto INT NOT NULL AUTO_INCREMENT,
  id_funeraria INT NOT NULL,
  descripcion VARCHAR(40),
  forma VARCHAR(20),
  precio FLOAT,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_tipo_producto),
  FOREIGN KEY (id_funeraria) REFERENCES funeraria (id_funeraria)
)ENGINE=INNODB;

INSERT INTO tipo_productos VALUES(1,1,'servicio completo','completo' ,'4000', now(), now(), 1, 1);
INSERT INTO tipo_productos VALUES(2,1,'ataud ','recto' ,'2000', now(), now(), 1, 1);
INSERT INTO tipo_productos VALUES(3,1,'ataud','redondo' ,'2500', now(), now(), 1, 1);
INSERT INTO tipo_productos VALUES(4,1,'ataud','obachado' ,'2500', now(), now(), 1, 1);
INSERT INTO tipo_productos VALUES(5,1,'ataud','Cuadrado' ,'2300', now(), now(), 1, 1);
INSERT INTO tipo_productos VALUES(6,1,'sala para alquilar','salon' ,'1500', now(), now(), 1, 1);


CREATE TABLE productos (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_tipo_producto INT NOT NULL,
  nombre_producto VARCHAR(40) NOT NULL,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_producto),
  FOREIGN KEY (id_tipo_producto) REFERENCES tipo_productos (id_tipo_producto)
)ENGINE=INNODB;

INSERT INTO productos VALUES(1,1,'servicios de sepelios', now(), now(), 1, 1);
INSERT INTO productos VALUES(2,2,'escamados rectos', now(), now(), 1, 1);
INSERT INTO productos VALUES(3,3,'escamados rectos redondos', now(), now(), 1, 1);
INSERT INTO productos VALUES(4,4,'obachados', now(), now(), 1, 1);
INSERT INTO productos VALUES(5,5,'Cuadrados', now(), now(), 1, 1);
INSERT INTO productos VALUES(6,6,'servicios con salón velatorio', now(), now(), 1, 1);




CREATE TABLE vehiculos (
  id_vehiculo INT NOT NULL AUTO_INCREMENT,
  id_funeraria INT NOT NULL,
  matricula VARCHAR(20) NOT NULL,
  tipo VARCHAR(20),
  marca VARCHAR(20),
  color VARCHAR(20) NOT NULL,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_vehiculo),
  FOREIGN KEY (id_funeraria) REFERENCES funeraria (id_funeraria)
)ENGINE=INNODB;

INSERT INTO vehiculos VALUES(1,1,'123abc','funebre','nissan','blanco', now(), now(), 1, 1);
INSERT INTO vehiculos VALUES(2,1,'567xyz','camioneta','toyota','gris', now(), now(), 1, 1);

INSERT INTO vehiculos VALUES(3,1,'456abc','funebre','nissan','negro', now(), now(), 1, 1);
INSERT INTO vehiculos VALUES(4,1,'567xyz','camioneta','toyota','gris', now(), now(), 1, 1);
INSERT INTO vehiculos VALUES(5,1,'123abc','funebre','nissan','blanco', now(), now(), 1, 1);
INSERT INTO vehiculos VALUES(6,1,'567xyz','camioneta','toyota','gris', now(), now(), 1, 1);


CREATE TABLE servicios (
  id_servicio INT NOT NULL AUTO_INCREMENT,
  id_funeraria INT NOT NULL,
  nombre_servicio VARCHAR(30) NOT NULL,
  descripcion VARCHAR(40),
  precio FLOAT,
  fecha_insercion TIMESTAMP NOT NULL, 
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  usuario INT NOT NULL,
  estado CHAR(1) NOT NULL,
  PRIMARY KEY (id_servicio),
  FOREIGN KEY (id_funeraria) REFERENCES funeraria (id_funeraria)
)ENGINE=INNODB;

INSERT INTO servicios VALUES(1,1,'servicios funebres','el servicio sera completo','3500', now(), now(), 1, 1);
INSERT INTO servicios VALUES(2,1,'sala velatorio','servicios de sala velatorio','1800', now(), now(), 1, 1);

INSERT INTO servicios VALUES(3,1,'servicios funebres','el servicio sera completo','3500', now(), now(), 1, 1);
INSERT INTO servicios VALUES(4,1,'sala velatorio','servicios de sala velatorio','1800', now(), now(), 1, 1);
INSERT INTO servicios VALUES(5,1,'servicios funebres','el servicio sera completo','3500', now(), now(), 1, 1);
INSERT INTO servicios VALUES(6,1,'sala velatorio','servicios de sala velatorio','1800', now(), now(), 1, 1);




/*****************EVA CONTINUA*******************************/

CREATE TABLE institutos(
  id_instituto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  direccion VARCHAR(30) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  pag_web VARCHAR(20) NOT NULL,
  resol_min TEXT,
  mision TEXT,
  vision TEXT,
  PRIMARY KEY(id_instituto)
)ENGINE=INNODB;

CREATE TABLE carreras(
id_carrera INT NOT NULL AUTO_INCREMENT,
id_instituto INT NOT NULL,
carrera VARCHAR(30) NOT NULL,
direccion VARCHAR(30) NOT NULL,
telefono VARCHAR(20),
grado_academico VARCHAR(20),
descripcion TEXT,
duracion VARCHAR(30),
PRIMARY KEY (id_carrera),
FOREIGN KEY(id_instituto) REFERENCES institutos(id_instituto)
)ENGINE=INNODB;


INSERT INTO institutos VALUES (1, 'INCOS-TARIJA', 'CALLE LA PAZ Y MEMBRILLOS', '6649594', 'www.incos.com', '555/545',
'Formar profesionales con solida preparacion en las areas de la contabilidad e informatica mediante curriculos que se 
ajusten a las necesidade y realidad del departamento y del pais',
'Alcanzar la excelencia academica bajo parametros de calidad, eficiencia, eficacia e innovacion tecnico-tecnologica
para dar respuesta oportuna a los requerimientos del sector productivo');
INSERT INTO institutos VALUES (2, 'DOMINGO SAVIO', 'CALLE DANIEL CAMPOS', '', 'www.idms.com', '752/2009', 
'Formar integramente tecnicos altmanente capacitados, através de aplicaciones tecnologicas educativas actualizadas, excelencia
academica y vocacion de servicio, para satisfacer las demandas laborales de la region en cursos y carreras tecnicas', 
'Consolidarnos en el mercado regional como lider entre los institutos de capacitacion y/o formacion tecnica a traves de procesos
de calidad y mejora continua');
INSERT INTO institutos VALUES (3, 'CATEC', 'CALLE INGAVI ESQ. JUNIN', '', 'www.catec.com', '', '', '');
INSERT INTO institutos VALUES (4, 'IPC PASCAL', 'CALLE SANTA CRUZ', '', 'www.ipc.com', '', '', '');
INSERT INTO institutos VALUES (5, 'CCA', 'CALLE CAMPERO', '','www.cca.com', '', '', '');

INSERT INTO institutos VALUES (6, 'CCA', 'CALLE CAMPERO', '','www.cca.com', '', '', '');
INSERT INTO institutos VALUES (7, 'CCA', 'CALLE CAMPERO', '','www.cca.com', '', '', '');
INSERT INTO institutos VALUES (8, 'CCA', 'CALLE CAMPERO', '','www.cca.com', '', '', '');
INSERT INTO institutos VALUES (9, 'CCA', 'CALLE CAMPERO', '','www.cca.com', '', '', '');
INSERT INTO institutos VALUES (10, 'CCA', 'CALLE CAMPERO', '','www.cca.com', '', '', '');
INSERT INTO institutos VALUES (11, 'CCA', 'CALLE CAMPERO', '','www.cca.com', '', '', '');


INSERT INTO carreras VALUES (1, 1, 'CONTADURIA PUBLICA', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS');
INSERT INTO carreras VALUES (2, 1, 'SISTEMAS INFORMATICOS', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS');
INSERT INTO carreras VALUES (3, 2, 'AUXILIAR CONTABLE', 'Calle Daniel Campos', '6642345', 'TECNICO MEDIO', '', '2 AÑOS');
INSERT INTO carreras VALUES (4, 2, 'SECRETARIADO EJECUTIVO', 'Calle Daniel Campos', '6642345', 'TECNICO MEDIO', '', '2 AÑOS');
INSERT INTO carreras VALUES (5, 2, 'TECNICO BANCARIO', 'Calle Daniel Campos', '6642345', 'TECNICO MEDIO', '', '2 AÑOS');
INSERT INTO carreras VALUES (6, 3, 'AUXILIAR CONTABLE', 'Calle Campero', '6661598', 'TECNICO MEDIO', '', '2 AÑOS');
INSERT INTO carreras VALUES (7, 1, 'GASTRONOMIA', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS');
INSERT INTO carreras VALUES (8, 1, 'SECRETARIADO EJECUTIVO', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS');

INSERT INTO carreras VALUES (9, 3, 'AUXILIAR CONTABLE', 'Calle Campero', '6661598', 'TECNICO MEDIO', '', '2 AÑOS');
INSERT INTO carreras VALUES (10, 1, 'GASTRONOMIA', 'Av. La Paz esq. Membrillos', '6649455', 'TECNICO SUPERIOR', '', '3 AÑOS');



/*****************29--09--2022*******************************/
CREATE TABLE compania_limpieza(
id_compania_limpieza INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono INT,
logo_compania VARCHAR (100),
PRIMARY KEY(id_compania_limpieza) 
)ENGINE=INNODB;


CREATE TABLE sucursales(
id_departamento INT NOT NULL AUTO_INCREMENT,
id_compania_limpieza INT NOT NULL,
dpto VARCHAR(30) NOT NULL,
telefono INT,
dir_suc VARCHAR(40) NOT NULL,
PRIMARY KEY(id_departamento),
FOREIGN KEY(id_compania_limpieza)REFERENCES compania_limpieza(id_compania_limpieza)
)ENGINE=INNODB;

INSERT INTO compania_limpieza VALUES (1,'URRUTIBEHETY','C. Presbítero Medina–Sopocachi','22414038','ing.jpg');
INSERT INTO compania_limpieza VALUES (2,'ABC','C. JUNIN','3243555','abc.jpg');
INSERT INTO compania_limpieza VALUES (3,'LIMPIA-SUR','C. POTOSI','124444','limpia.jpg');


INSERT INTO sucursales VALUES (1,1,'Santa Cruz',33546868,'CUARTO ANILLO');
INSERT INTO sucursales VALUES (2,2,'Cochabamba',44243777, 'EL PRADO');
INSERT INTO sucursales VALUES (3,3,'La Paz',22414038, 'SOPOCACHI');
INSERT INTO sucursales VALUES (4,1,'Tarija',72118069, 'AV. LA PAZ');

/*****************Tablas de Seguridad*******************************/

CREATE TABLE _personas(
id_persona INT NOT NULL AUTO_INCREMENT,
id_funeraria INT NOT NULL,
ci VARCHAR(10) NOT NULL,
nombres VARCHAR(25)NOT NULL,
ap VARCHAR(25),
am VARCHAR(25),
telef VARCHAR(10)NOT NULL,
direccion VARCHAR(25)NOT NULL,
genero VARCHAR(25),
fecha_insercion TIMESTAMP NOT NULL,
fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuario INT NOT NULL,
estado char(1) NOT NULL,
PRIMARY KEY(id_persona),
FOREIGN KEY(id_funeraria) REFERENCES funeraria(id_funeraria)
)ENGINE=INNODB;


INSERT INTO _personas VALUES(1,1,'7220428','maribel','chambi','Alaves','60254854','C/VENEZUELA','F',now() ,now(), 1, 1);
INSERT INTO _personas VALUES(2,1,'7220429','mario','chambi','Paredes','60254854','C/VENEZUELA','M',now() ,now(), 1, 1);
INSERT INTO _personas VALUES(3,1,'7220428','maria','chambi','Alaves','60254855','C/VENEZUELA','F',now() ,now(), 1, 1);
INSERT INTO _personas VALUES(4,1,'7220429','mario','chambi','Paredes','60254854','C/VENEZUELA','M',now() ,now(), 1, 1);
INSERT INTO _personas VALUES(5,1,'7220428','maribel','chambi','Alaves','60254854','C/VENEZUELA','F',now() ,now(), 1, 1);
INSERT INTO _personas VALUES(6,1,'7220429','jorge','chambi','Paredes','60254854','C/VENEZUELA','M',now() ,now(), 1, 1);
INSERT INTO _personas VALUES(7,1,'7220428','maribel','chambi','Alaves','60254854','C/VENEZUELA','F',now() ,now(), 1, 1);
INSERT INTO _personas VALUES(8,1,'7220429','mario','chambi','Paredes','60254854','C/VENEZUELA','M',now() ,now(), 1, 1);



CREATE TABLE _roles(
id_rol INT NOT NULL AUTO_INCREMENT,
rol VARCHAR(25) NOT NULL,
fecha_insercion TIMESTAMP NOT NULL,
fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuario INT NOT NULL,
estado char(1) NOT NULL,
PRIMARY KEY(id_rol)
)ENGINE=INNODB;


INSERT INTO _roles VALUES(1, 'administrador',now() ,now(), 1, 1);



CREATE TABLE _usuarios(
id_usuario INT NOT NULL AUTO_INCREMENT,
id_persona int not NULL,
usuario1 VARCHAR(20) NOT NULL,
clave VARCHAR(100) NOT NULL,
fecha_insercion TIMESTAMP NOT NULL,
fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuario INT NOT NULL,
estado char(1) NOT NULL,
PRIMARY KEY(id_usuario),
FOREIGN KEY(id_persona) REFERENCES _personas(id_persona)
)ENGINE=INNODB;


INSERT INTO _usuarios VALUES(1,1, 'admin','$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK',now() ,now(), 1, 1);

INSERT INTO _usuarios VALUES(2,2, 'admin','1',now() ,now(), 1, 1);


CREATE TABLE _usuarios_roles(
id_usuario_rol INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL,
id_rol INT NOT NULL,
fec_insercion TIMESTAMP NOT NULL,
fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuario INT NOT NULL,
estado CHAR(1) NOT NULL,
PRIMARY KEY(id_usuario_rol),
FOREIGN KEY(id_usuario) REFERENCES _usuarios(id_usuario),
FOREIGN KEY(id_rol) REFERENCES _roles(id_rol)

)ENGINE=INNODB;

INSERT INTO _usuarios_roles VALUES(1, 1, 1, now(), now(), 1, 1);



CREATE TABLE _grupos(
id_grupo INT NOT NULL AUTO_INCREMENT,
grupo VARCHAR(30),
fecha_insercion TIMESTAMP NOT NULL,
fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuario INT NOT NULL,
estado char(1) NOT NULL,
PRIMARY KEY(id_grupo)
)ENGINE=INNODB;

INSERT INTO _grupos VALUES(1, 'HERRAMIENTAS', now(), now(), 1, 1);
INSERT INTO _grupos VALUES(2, 'PARAMETROS', now(), now(), 1, 1);
INSERT INTO _grupos VALUES(3, 'FUNERARIA', now(), now(), 1, 1);
INSERT INTO _grupos VALUES(4, 'REPORTES', now(), now(), 1, 1);
INSERT INTO _grupos VALUES(5, 'EVA CONTINUA', now(), now(), 1, 1);



CREATE TABLE _opciones(
id_opcion INT NOT NULL AUTO_INCREMENT,
id_grupo INT NOT NULL,
opcion VARCHAR(150),
contenido VARCHAR(150),
orden int(10),
fecha_insercion TIMESTAMP NOT NULL,
fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuario INT NOT NULL,
estado char(1) NOT NULL,
PRIMARY KEY(id_opcion),
FOREIGN KEY(id_grupo) REFERENCES _grupos(id_grupo)
)ENGINE=INNODB;

INSERT INTO _opciones VALUES(1, 1, 'Personas', '../privada/personas/personas.php',10, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(2, 1, 'Usuarios', '../privada/usuarios/usuarios.php',20,now(), now(), 1, 1);
INSERT INTO _opciones VALUES(3, 1, 'Grupos', '../privada/grupos/grupos.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(4, 1, 'Roles', '../privada/roles/roles.php',40, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(5, 1, 'Usuarios Roles', '../privada/usuarios_roles/usuarios_roles.php',50, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(6, 1, 'Opciones', '../privada/opciones/opciones.php',60, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(7, 1, 'Accesos', '../privada/accesos/accesos.php',70, now(), now(), 1, 1);


INSERT INTO _opciones VALUES(8, 2, 'areas', '../privada/area/areas.php',10, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(9, 2, 'horario_empleados', '../privada/horario_empleados/horario_empleados.php',20, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(10, 2, 'servicios_clientes', '../privada/servicios_clientes/servicios_clientes.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(11, 2, 'productos', '../privada/productos/productos.php',30, now(), now(), 1, 1);


INSERT INTO _opciones VALUES(12, 3, 'funeraria', '../privada/funeraria/funeraria.php',10, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(13, 3, 'cliente', '../privada/cliente/cliente.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(14, 3, 'tipo_productos', '../privada/tipo_producto/tipo_producto.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(15, 3, 'empleados', '../privada/empleados/empleados.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(16, 3, 'gerentes', '../privada/gerentes/gerentes.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(17, 3, 'vehiculos', '../privada/vehiculos/vehiculos.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(18, 3, 'servicios', '../privada/servicios/servicios.php',30, now(), now(), 1, 1);


INSERT INTO _opciones VALUES(19, 4, 'Rpt de personas_usuarios','../privada/reportes/personas_usuarios.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(20, 4, 'Rpt de personas con fechas de insercion','../privada/reportes/personas_fechas.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(21, 4, 'Ficha Tecnica de Personas','.',20, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(22, 4, 'Rpt de empleados_areas','../privada/reportes/empleados_areas.php',30, now(), now(), 1, 1);
INSERT INTO _opciones VALUES(23, 4, 'Rpt de gerentes_profesion','../privada/reportes/gerentes_profesion.php',30, now(), now(), 1, 1);

INSERT INTO _opciones VALUES(24, 5, 'carreras','../privada/carreras/carreras.php',40, now(), now(), 1, 1);

INSERT INTO _opciones VALUES(25, 5, 'SUCURSALES','../privada/SUCURSALES/sucursales.php',50, now(), now(), 1, 1);


CREATE TABLE _accesos(
id_acceso INT NOT NULL AUTO_INCREMENT,
id_opcion int NOT NULL,
id_rol int NOT NULL,
fecha_insercion TIMESTAMP NOT NULL,
fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
usuario INT NOT NULL,
estado char(1) NOT NULL,
PRIMARY KEY(id_acceso),
FOREIGN KEY(id_rol) REFERENCES _roles(id_rol),
FOREIGN KEY(id_opcion) REFERENCES _opciones(id_opcion)
)ENGINE=INNODB;

INSERT INTO _accesos VALUES(1, 1, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(2, 2, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(3, 3, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(4, 4, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(5, 5, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(6, 6, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(7, 7, 1,now() ,now(), 1, 1);

INSERT INTO _accesos VALUES(8, 8, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(9, 9, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(10, 10, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(11, 11, 1,now() ,now(), 1, 1);

INSERT INTO _accesos VALUES(12, 12, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(13, 13, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(14, 14, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(15, 15, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(16, 16, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(17, 17, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(18, 18, 1,now() ,now(), 1, 1);

INSERT INTO _accesos VALUES(19, 19, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(20, 20, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(21, 21, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(22, 22, 1,now() ,now(), 1, 1);
INSERT INTO _accesos VALUES(23, 23, 1,now() ,now(), 1, 1);

INSERT INTO _accesos VALUES(24, 24, 1,now() ,now(), 1, 1);

INSERT INTO _accesos VALUES(25, 24, 1,now() ,now(), 1, 1);





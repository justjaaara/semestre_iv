drop database my_pizzeria;
create database my_pizzeria;
use my_pizzeria;

-- ----------------------------
-- Table structure for medios_pago
-- ----------------------------
DROP TABLE IF EXISTS medios_pago;
CREATE TABLE medios_pago  (
    id varchar(3)               CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    descripcion varchar(255)    CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    PRIMARY KEY (id)            USING BTREE
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tipos_id
-- ----------------------------
DROP TABLE IF EXISTS tipos_id;
CREATE TABLE tipos_id  (
    tipo_id varchar(2)          CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    descripcion varchar(30)     CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    PRIMARY KEY (tipo_id)       USING BTREE
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes  (
    id varchar(15)                  CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    tipo_id varchar(2)              CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    nombres varchar(255)            CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    apellidos varchar(255)          CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    fecha_nacimiento datetime       NULL DEFAULT NULL,
    PRIMARY KEY (id, tipo_id)       USING BTREE,
    INDEX fk_clie_tipoid(tipo_id)   USING BTREE,
    CONSTRAINT fk_clie_tipoid       FOREIGN KEY (tipo_id)
        REFERENCES tipos_id (tipo_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS productos;
CREATE TABLE productos  (
    id varchar(10)          CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    tipo varchar(30)        CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    nombre varchar(100)     CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    precio int(9)           NULL DEFAULT NULL,
    descripcion             varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    PRIMARY KEY (id)        USING BTREE
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS proveedores;
CREATE TABLE proveedores  (
    id varchar(15)                  CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    tipo_id varchar(2)              CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    nombre varchar(255)             CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    direccion varchar(255)          CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    telefono varchar(15)            CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    PRIMARY KEY (id, tipo_id)       USING BTREE,
    INDEX fk_prov_tipoid(tipo_id)   USING BTREE,
    CONSTRAINT fk_prov_tipoid FOREIGN KEY (tipo_id)
        REFERENCES tipos_id (tipo_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for insumos
-- ----------------------------
DROP TABLE IF EXISTS insumos;
CREATE TABLE insumos  (
    id varchar(10)          CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    tipo varchar(20)        CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    nombre varchar(255)     CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    costo int(9)            NULL DEFAULT NULL,
    unidad varchar(10)      CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for insumos_proveedores
-- ----------------------------
DROP TABLE IF EXISTS insumos_proveedores;
CREATE TABLE insumos_proveedores  (
    id_proveedor varchar(15)        CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    tipo_id_proveedor varchar(2)    CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    id_insumo varchar(10)           CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    PRIMARY KEY (id_proveedor, tipo_id_proveedor, id_insumo) USING BTREE,
    INDEX fk_002(id_insumo) USING BTREE,
    CONSTRAINT fk_001 FOREIGN KEY (id_proveedor, tipo_id_proveedor)
        REFERENCES proveedores (id, tipo_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_002 FOREIGN KEY (id_insumo)
        REFERENCES insumos (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
    )
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recetas
-- ----------------------------
DROP TABLE IF EXISTS recetas;
CREATE TABLE recetas  (
    id_insumo varchar(10)       CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    id_producto varchar(10)     CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    cantidad smallint(255)      NULL DEFAULT NULL,
    unidad varchar(255)         CHARACTER SET latin1 COLLATE latin1_general_cs NULL DEFAULT NULL,
    PRIMARY KEY (id_insumo, id_producto) USING BTREE,
    INDEX fk_recetas_001(id_producto) USING BTREE,
    CONSTRAINT fk_recetas_001 FOREIGN KEY (id_producto)
        REFERENCES productos (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_recetas_002 FOREIGN KEY (id_insumo)
        REFERENCES insumos (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for facturas_venta
-- ----------------------------
DROP TABLE IF EXISTS facturas_venta;
CREATE TABLE facturas_venta  (
    id int(11) NOT NULL,
    id_cliente varchar(15)      CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    tipo_id_cliente varchar(3)  CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    id_medio_pago varchar(3)    CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    valor int(11)               NOT NULL,
    fecha datetime(0)           NULL DEFAULT NULL,
    PRIMARY KEY (id)            USING BTREE,
    INDEX fk_facturas_001(id_cliente, tipo_id_cliente) USING BTREE,
    INDEX fk_facturas_002(id_medio_pago) USING BTREE,
    CONSTRAINT fk_facturas_001 FOREIGN KEY (id_cliente, tipo_id_cliente)
        REFERENCES clientes (id, tipo_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_facturas_002 FOREIGN KEY (id_medio_pago)
        REFERENCES medios_pago (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos  (
    id_factura int(11)          NOT NULL,
    id_producto varchar(10)     CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
    fecha datetime(0)           NOT NULL,
    PRIMARY KEY (id_factura, id_producto) USING BTREE,
    INDEX fk_pedidos_001(id_producto) USING BTREE,
    CONSTRAINT fk_pedidos_001 FOREIGN KEY (id_producto)
        REFERENCES productos (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT fk_pedidos_002 FOREIGN KEY (id_factura)
        REFERENCES facturas_venta (id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)
ENGINE = InnoDB
CHARACTER SET = latin1
COLLATE = latin1_general_cs
ROW_FORMAT = Dynamic;



-- ----------------------------
-- Records of medios_pago
-- ----------------------------
INSERT INTO medios_pago VALUES ('BT', 'BITCOIN');
INSERT INTO medios_pago VALUES ('EF', 'EFECTIVO');
INSERT INTO medios_pago VALUES ('TC', 'TARJETA DE CREDITO');
INSERT INTO medios_pago VALUES ('TD', 'DEBITO');

-- ----------------------------
-- Records of tipos_id
-- ----------------------------
INSERT INTO tipos_id VALUES ('CC', 'CEDULA DE CIUDADANIA');
INSERT INTO tipos_id VALUES ('CE', 'CEDULA DE EXTRANJERIA');
INSERT INTO tipos_id VALUES ('NT', 'NUMERO UNICO TRIBUTARIO');
INSERT INTO tipos_id VALUES ('PP', 'PASAPORTE');
INSERT INTO tipos_id VALUES ('TI', 'TARJETA DE IDENTIDAD');

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO clientes VALUES ('123', 'CC', 'SELENA', 'GOMEZ', NULL);
INSERT INTO clientes VALUES ('135', 'PP', 'NATALIA', 'PARIS', NULL);
INSERT INTO clientes VALUES ('456', 'CC', 'BECKY', 'G', NULL);
INSERT INTO clientes VALUES ('789', 'TI', 'NATALIA', 'HENAO', NULL);

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO proveedores VALUES ('123', 'CC', 'LA TIENDA DE DOnA RITA', 'CALLE 1 # 5-15', '2303030');
INSERT INTO proveedores VALUES ('135', 'CE', 'TOMATE & TOMATES S.A.', 'PLAZA MINORISTA, LOCAL 2345', NULL);
INSERT INTO proveedores VALUES ('456', 'CC', 'HARINERA DEL VALLE', 'BODEGA #3 ZONA FRANCA', '2303031');
INSERT INTO proveedores VALUES ('476', 'NT', 'CARNES FRIAS DEL VALLE DE ABURRA', 'VARIANTE AUTOPISTA, KM 14', NULL);
INSERT INTO proveedores VALUES ('679', 'NT', 'AROMATICAS Y HIERBAS', 'VEREDA EL TAMBO, FINCA 300', '2303035');
INSERT INTO proveedores VALUES ('789', 'NT', 'PRODUCTORA DE QUESOS NACIONALES', 'PARQUE INDUSTRIAL ITAGUI', '2303032');

-- ----------------------------
-- Records of insumos
-- ----------------------------
INSERT INTO insumos VALUES ('H_TRIGO', 'GRANOS', 'HARINA DE TRIGO', 50, 'KG');
INSERT INTO insumos VALUES ('LEVAD', 'GRANOS', 'LEVADURA ESPECIAL', 1, 'KG');
INSERT INTO insumos VALUES ('PEPERO', 'EMBUTIDOS', 'PEPERONI', 400, 'UNIDAD');
INSERT INTO insumos VALUES ('PINA', 'VEGETALES', 'PInA OROMIEL', 100, 'G');
INSERT INTO insumos VALUES ('Q_BLAN', 'LACTEOS', 'QUESO BLANCO', 150, 'G');
INSERT INTO insumos VALUES ('Q_MOZA', 'LACTEOS', 'QUESO MOZARELLA', 300, 'G');
INSERT INTO insumos VALUES ('Q_PARME', 'LACTEOS', 'QUESO PARMESANO', 250, 'G');
INSERT INTO insumos VALUES ('SALAMI', 'EMBUTIDOS', 'SALAMI FINO', 350, 'UNIDAD');
INSERT INTO insumos VALUES ('T_CHERRY', 'VEGETALES', 'TOMATE CHERRY', 100, 'G');

-- ----------------------------
-- Records of insumos_proveedores
-- ----------------------------
INSERT INTO insumos_proveedores VALUES ('123', 'CC', 'PINA');
INSERT INTO insumos_proveedores VALUES ('135', 'CE', 'PINA');
INSERT INTO insumos_proveedores VALUES ('135', 'CE', 'T_CHERRY');
INSERT INTO insumos_proveedores VALUES ('456', 'CC', 'H_TRIGO');
INSERT INTO insumos_proveedores VALUES ('456', 'CC', 'LEVAD');
INSERT INTO insumos_proveedores VALUES ('476', 'NT', 'PEPERO');
INSERT INTO insumos_proveedores VALUES ('476', 'NT', 'SALAMI');
INSERT INTO insumos_proveedores VALUES ('789', 'NT', 'Q_BLAN');
INSERT INTO insumos_proveedores VALUES ('789', 'NT', 'Q_MOZA');
INSERT INTO insumos_proveedores VALUES ('789', 'NT', 'Q_PARME');

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO productos VALUES ('C_CARNE', 'CANELON', 'CANELON DE CARNE', 30000, 'CANELONES DE CARNE');
INSERT INTO productos VALUES ('C_RICCOTA', 'CANELON', 'CANELON DE QUESO', 25000, 'CANELONES CON QUESO RICCOTA');
INSERT INTO productos VALUES ('L_CARNE', 'LASAGNA', 'LASAGNA DE CARNE', 30000, 'LASAGNA CON CARNE MOLINA');
INSERT INTO productos VALUES ('L_MIXTA', 'LASAGNA', 'LASAGNA MIXTA', 27500, 'LASAGNA CON CARNE MOLINA Y POLLO DESMECHADO');
INSERT INTO productos VALUES ('L_POLLO', 'LASAGNA', 'LASAGNA DE POLLO', 25000, 'LASAGNA CON POLLO DESMECHADO');
INSERT INTO productos VALUES ('P_CARNFRIA', 'PIZZA', 'PIZZA DE CARNES FRIAS', 40000, 'PIZZA CON SALAMI Y PEPERONI');
INSERT INTO productos VALUES ('P_HAWAI', 'PIZZA', 'PIZZA HAWAIANA', 35000, 'PIZZA CON PInA Y JAMON');
INSERT INTO productos VALUES ('P_NAPOLI', 'PIZZA', 'PIZZA NAPOLITANA', 25000, 'PIZZA CON TOMATE Y ALBAHACA');
INSERT INTO productos VALUES ('P_POLLO', 'PIZZA', 'PIZZA DE POLLO', 35000, 'PIZZA CON POLLO DESMECHADO');

-- ----------------------------
-- Records of recetas
-- ----------------------------
INSERT INTO recetas VALUES ('H_TRIGO', 'L_CARNE', 300, 'G');
INSERT INTO recetas VALUES ('H_TRIGO', 'P_CARNFRIA', 1, 'KG');
INSERT INTO recetas VALUES ('LEVAD', 'P_CARNFRIA', 20, 'F');
INSERT INTO recetas VALUES ('PEPERO', 'P_CARNFRIA', 200, 'G');
INSERT INTO recetas VALUES ('Q_MOZA', 'L_CARNE', 100, 'G');
INSERT INTO recetas VALUES ('Q_MOZA', 'P_CARNFRIA', 2, 'KG');
INSERT INTO recetas VALUES ('Q_PARME', 'L_CARNE', 50, 'G');
INSERT INTO recetas VALUES ('SALAMI', 'P_CARNFRIA', 200, 'G');

-- ----------------------------
-- Records of facturas_venta
-- ----------------------------
INSERT INTO facturas_venta VALUES (1, '123', 'CC', 'TC', 100000, '2019-02-21 11:02:52');
INSERT INTO facturas_venta VALUES (2, '456', 'CC', 'TD', 50000, '2019-01-08 11:03:31');
INSERT INTO facturas_venta VALUES (3, '135', 'PP', 'EF', 75000, '2018-12-19 11:03:43');
INSERT INTO facturas_venta VALUES (4, '456', 'CC', 'EF', 45000, '2019-02-10 11:06:01');
INSERT INTO facturas_venta VALUES (5, '456', 'CC', 'BT', 1, '2019-01-16 11:07:34');
INSERT INTO facturas_venta VALUES (6, '123', 'CC', 'EF', 45000, '2018-11-21 11:07:38');
INSERT INTO facturas_venta VALUES (7, '456', 'CC', 'TC', 135000, '2018-12-11 11:07:42');

-- ----------------------------
-- Records of pedidos
-- ----------------------------
INSERT INTO pedidos VALUES (1, 'C_CARNE', '2019-02-21 11:02:52');
INSERT INTO pedidos VALUES (1, 'P_HAWAI', '2019-02-21 11:03:08');
INSERT INTO pedidos VALUES (1, 'P_NAPOLI', '2019-02-21 11:03:20');
INSERT INTO pedidos VALUES (2, 'L_CARNE', '2019-01-08 11:03:31');
INSERT INTO pedidos VALUES (3, 'L_CARNE', '2018-12-21 11:03:59');
INSERT INTO pedidos VALUES (3, 'L_POLLO', '2018-12-19 11:03:43');
INSERT INTO pedidos VALUES (4, 'P_CARNFRIA', '2019-02-10 11:06:01');
INSERT INTO pedidos VALUES (4, 'P_HAWAI', '2019-02-10 11:06:01');
INSERT INTO pedidos VALUES (4, 'P_NAPOLI', '2019-02-10 11:06:01');
INSERT INTO pedidos VALUES (4, 'P_POLLO', '2019-02-10 11:06:01');

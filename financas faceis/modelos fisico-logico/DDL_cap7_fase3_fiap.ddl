-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-11-13 19:15:02 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_contas (
    t_usuario_cd_usuario INTEGER NOT NULL,
    cd_banco             NUMBER(3) NOT NULL,
    cd_conta             NUMBER(15) NOT NULL
);

ALTER TABLE t_contas
    ADD CONSTRAINT t_contas_c_pk PRIMARY KEY ( t_usuario_cd_usuario,
                                               cd_banco,
                                               cd_conta );

CREATE TABLE t_extratos (
    t_contas_cd_usuario INTEGER NOT NULL,
    t_contas_cd_banco   NUMBER(3) NOT NULL,
    t_contas_cd_conta   NUMBER(15) NOT NULL,
    vl_saldo            NUMBER(14, 2) NOT NULL,
    dt_linha_extrato    DATE,
    ds_linha_extrato    VARCHAR2(20),
    vl_linha_extrato    NUMBER(14, 2)
);

ALTER TABLE t_extratos
    ADD CONSTRAINT t_extratos_pk PRIMARY KEY ( t_contas_cd_usuario,
                                               t_contas_cd_banco,
                                               t_contas_cd_conta );

CREATE TABLE t_financas_p (
    t_usuario_cd_usuario INTEGER NOT NULL,
    tp_gasto             VARCHAR2(20),
    ds_gasto             VARCHAR2(20),
    vl_gasto             NUMBER(14, 2)
);

ALTER TABLE t_financas_p ADD CONSTRAINT t_financas_p_pk PRIMARY KEY ( t_usuario_cd_usuario );

CREATE TABLE t_investimentos (
    t_contas_t_usuario_cd_usuario INTEGER NOT NULL,
    t_contas_cd_banco             NUMBER(3) NOT NULL,
    t_contas_cd_conta             NUMBER(15) NOT NULL,
    tp_investimento               VARCHAR2(20) NOT NULL,
    ds_investimento               VARCHAR2(20) NOT NULL,
    vl_inv_inicial                NUMBER(14, 2),
    vl_inv_atual                  NUMBER(14, 2)
);

ALTER TABLE t_investimentos
    ADD CONSTRAINT t_investimentos_pk PRIMARY KEY ( t_contas_t_usuario_cd_usuario,
                                                    t_contas_cd_banco,
                                                    t_contas_cd_conta );

CREATE TABLE T_USUARIO ( cd_usuario INTEGER NOT NULL, nm_usuario VARCHAR2(8, 40) NOT NULL, cd_cpf NUMBER(11) NOT NULL, cd_rg VARCHAR2
(7, 15) NOT NULL, nr_ddd NUMBER(2), nr_telefone NUMBER(9) NOT NULL, ds_endereco VARCHAR2(40) NOT NULL,
ds_end_cobranca VARCHAR2(40) ) 
;

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( cd_usuario );

ALTER TABLE t_contas
    ADD CONSTRAINT t_contas_c_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_extratos
    ADD CONSTRAINT t_extratos_t_contas_c_fk FOREIGN KEY ( t_contas_cd_usuario,
                                                          t_contas_cd_banco,
                                                          t_contas_cd_conta )
        REFERENCES t_contas ( t_usuario_cd_usuario,
                              cd_banco,
                              cd_conta );

ALTER TABLE t_financas_p
    ADD CONSTRAINT t_financas_p_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_investimentos
    ADD CONSTRAINT t_investimentos_t_contas_c_fk FOREIGN KEY ( t_contas_t_usuario_cd_usuario,
                                                               t_contas_cd_banco,
                                                               t_contas_cd_conta )
        REFERENCES t_contas ( t_usuario_cd_usuario,
                              cd_banco,
                              cd_conta );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2026-05-21 15:10:08 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE comunidade CASCADE CONSTRAINTS 
;

DROP TABLE comunidade_desafio CASCADE CONSTRAINTS 
;

DROP TABLE contadores CASCADE CONSTRAINTS 
;

DROP TABLE desafio CASCADE CONSTRAINTS 
;

DROP TABLE familiar CASCADE CONSTRAINTS 
;

DROP TABLE historico_conversa CASCADE CONSTRAINTS 
;

DROP TABLE posts CASCADE CONSTRAINTS 
;

DROP TABLE usuario CASCADE CONSTRAINTS 
;

DROP TABLE usuario_comunidade CASCADE CONSTRAINTS 
;

DROP TABLE usuario_desafio CASCADE CONSTRAINTS 
;

DROP TABLE usuario_post CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE comunidade 
    ( 
     id_comunidade   NUMBER (50)  NOT NULL , 
     nome            VARCHAR2 (100 CHAR) , 
     tipo_comunidade VARCHAR2 (10 CHAR) , 
     dt_criacao      DATE 
    ) 
;

ALTER TABLE comunidade 
    ADD CONSTRAINT comunidade_PK PRIMARY KEY ( id_comunidade ) ;

CREATE TABLE comunidade_desafio 
    ( 
     id_desafio    NUMBER (10)  NOT NULL , 
     id_comunidade NUMBER (50)  NOT NULL 
    ) 
;

ALTER TABLE comunidade_desafio 
    ADD CONSTRAINT id_comunidade_desafio_PK PRIMARY KEY ( id_desafio, id_comunidade ) ;

CREATE TABLE contadores 
    ( 
     qtd_curtida         NUMBER (10)  NOT NULL , 
     id_curtida          NUMBER (100) , 
     qtd_comentario      NUMBER (100) , 
     qtd_compatilhamento NUMBER (100) , 
     id_post             NUMBER (15)  NOT NULL , 
     id_mensagem         NUMBER (100)  NOT NULL 
    ) 
;

ALTER TABLE contadores 
    ADD CONSTRAINT contadores_PK PRIMARY KEY ( qtd_curtida ) ;

CREATE TABLE desafio 
    ( 
     id_desafio   NUMBER (10)  NOT NULL , 
     nome_desafio VARCHAR2 (70 CHAR) , 
     descricao    VARCHAR2 (255 CHAR) , 
     data_inicio  DATE , 
     data_fim     DATE 
    ) 
;

ALTER TABLE desafio 
    ADD CONSTRAINT desafio_PK PRIMARY KEY ( id_desafio ) ;

CREATE TABLE familiar 
    ( 
     id_familia NUMBER (10)  NOT NULL , 
     parentesco VARCHAR2 (30 CHAR) , 
     id_usuario NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE familiar 
    ADD CONSTRAINT familiar_PK PRIMARY KEY ( id_familia ) ;

CREATE TABLE historico_conversa 
    ( 
     id_mensagem              NUMBER (100)  NOT NULL , 
     conteudo                 VARCHAR2 (255 CHAR) , 
     dt_envio                 DATE , 
     destinatario             NUMBER (10) , 
     usuario_id_usuario       NUMBER (10)  NOT NULL , 
     comunidade_id_comunidade NUMBER (50) 
    ) 
;

ALTER TABLE historico_conversa 
    ADD CONSTRAINT historico_conversa_PK PRIMARY KEY ( id_mensagem ) ;

CREATE TABLE posts 
    ( 
     id_post        NUMBER (15)  NOT NULL , 
     conteudo       VARCHAR2 (255 CHAR) , 
     status_post    VARCHAR2 (10 CHAR) , 
     dt_criacao     DATE , 
     dt_atualizacao DATE 
    ) 
;

ALTER TABLE posts 
    ADD CONSTRAINT posts_PK PRIMARY KEY ( id_post ) ;

CREATE TABLE usuario 
    ( 
     id_usuario    NUMBER (10)  NOT NULL , 
     usuario       VARCHAR2 (50) , 
     senha         VARCHAR2 (20 CHAR) , 
     nome          VARCHAR2 (100 CHAR) , 
     dt_nascimento DATE , 
     cpf           NUMBER (12) , 
     nacionalidade VARCHAR2 (30 CHAR) , 
     email         VARCHAR2 (100 CHAR) , 
     dt_criacao    DATE 
    ) 
;

ALTER TABLE usuario 
    ADD CONSTRAINT usuario_PK PRIMARY KEY ( id_usuario ) ;

CREATE TABLE usuario_comunidade 
    ( 
     id_usuario    NUMBER (10)  NOT NULL , 
     id_comunidade NUMBER (50)  NOT NULL 
    ) 
;

ALTER TABLE usuario_comunidade 
    ADD CONSTRAINT id_usuario_comunidade_PK PRIMARY KEY ( id_usuario, id_comunidade ) ;

CREATE TABLE usuario_desafio 
    ( 
     id_usuario NUMBER (10)  NOT NULL , 
     id_desafio NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE usuario_desafio 
    ADD CONSTRAINT id_usuario_desafio_PK PRIMARY KEY ( id_usuario, id_desafio ) ;

CREATE TABLE usuario_post 
    ( 
     id_usuario NUMBER (10)  NOT NULL , 
     id_post    NUMBER (15)  NOT NULL 
    ) 
;

ALTER TABLE usuario_post 
    ADD CONSTRAINT id_usuario_post_PK PRIMARY KEY ( id_usuario, id_post ) ;

ALTER TABLE contadores 
    ADD CONSTRAINT cont_hist_conversa_FK FOREIGN KEY 
    ( 
     id_mensagem
    ) 
    REFERENCES historico_conversa 
    ( 
     id_mensagem
    ) 
;

ALTER TABLE contadores 
    ADD CONSTRAINT contadores_posts_FK FOREIGN KEY 
    ( 
     id_post
    ) 
    REFERENCES posts 
    ( 
     id_post
    ) 
;

ALTER TABLE familiar 
    ADD CONSTRAINT familiar_usuario_FK FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES usuario 
    ( 
     id_usuario
    ) 
;

ALTER TABLE historico_conversa 
    ADD CONSTRAINT hist_conversa_comun_FK FOREIGN KEY 
    ( 
     comunidade_id_comunidade
    ) 
    REFERENCES comunidade 
    ( 
     id_comunidade
    ) 
;

ALTER TABLE historico_conversa 
    ADD CONSTRAINT historico_conversa_usuario_FK FOREIGN KEY 
    ( 
     usuario_id_usuario
    ) 
    REFERENCES usuario 
    ( 
     id_usuario
    ) 
;

ALTER TABLE comunidade_desafio 
    ADD CONSTRAINT Relation_9_comunidade_FK FOREIGN KEY 
    ( 
     id_comunidade
    ) 
    REFERENCES comunidade 
    ( 
     id_comunidade
    ) 
;

ALTER TABLE comunidade_desafio 
    ADD CONSTRAINT Relation_9_desafio_FK FOREIGN KEY 
    ( 
     id_desafio
    ) 
    REFERENCES desafio 
    ( 
     id_desafio
    ) 
;

ALTER TABLE usuario_comunidade 
    ADD CONSTRAINT usuario_comun_comunidade_FK FOREIGN KEY 
    ( 
     id_comunidade
    ) 
    REFERENCES comunidade 
    ( 
     id_comunidade
    ) 
;

ALTER TABLE usuario_comunidade 
    ADD CONSTRAINT usuario_comun_usuario_FK FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES usuario 
    ( 
     id_usuario
    ) 
;

ALTER TABLE usuario_desafio 
    ADD CONSTRAINT usuario_desafio_desafio_FK FOREIGN KEY 
    ( 
     id_desafio
    ) 
    REFERENCES desafio 
    ( 
     id_desafio
    ) 
;

ALTER TABLE usuario_desafio 
    ADD CONSTRAINT usuario_desafio_usuario_FK FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES usuario 
    ( 
     id_usuario
    ) 
;

ALTER TABLE usuario_post 
    ADD CONSTRAINT usuario_post_posts_FK FOREIGN KEY 
    ( 
     id_post
    ) 
    REFERENCES posts 
    ( 
     id_post
    ) 
;

ALTER TABLE usuario_post 
    ADD CONSTRAINT usuario_post_usuario_FK FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES usuario 
    ( 
     id_usuario
    ) 
;
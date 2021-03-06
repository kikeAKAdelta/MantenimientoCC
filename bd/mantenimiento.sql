PGDMP     '    -            
    w            mantenimiento    12.1    12.1 s    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16393    mantenimiento    DATABASE     �   CREATE DATABASE mantenimiento WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_El Salvador.1252' LC_CTYPE = 'Spanish_El Salvador.1252';
    DROP DATABASE mantenimiento;
                postgres    false            �            1259    16506 
   calendario    TABLE     _   CREATE TABLE public.calendario (
    idcalendario integer NOT NULL,
    fecha date NOT NULL
);
    DROP TABLE public.calendario;
       public         heap    postgres    false            �            1259    16495    herramientas    TABLE     �   CREATE TABLE public.herramientas (
    idherramienta integer NOT NULL,
    nombre character varying(100) NOT NULL,
    cantidad integer NOT NULL
);
     DROP TABLE public.herramientas;
       public         heap    postgres    false            �            1259    16500    herramientasprocedimiento    TABLE     |   CREATE TABLE public.herramientasprocedimiento (
    idprocedimiento integer NOT NULL,
    idherramienta integer NOT NULL
);
 -   DROP TABLE public.herramientasprocedimiento;
       public         heap    postgres    false            �            1259    16479 
   inventario    TABLE     �  CREATE TABLE public.inventario (
    codinventario character varying(10) NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(250),
    modelo character varying(100),
    numeroserie character varying(100),
    ano integer,
    condicion character varying(60),
    ubicacion character varying(100),
    vidautil integer,
    garantia bit(1) NOT NULL
);
    DROP TABLE public.inventario;
       public         heap    postgres    false            �            1259    16461 
   materiales    TABLE       CREATE TABLE public.materiales (
    codmaterial character varying(10) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(150),
    idproveedor character varying(10) NOT NULL,
    cantidad integer NOT NULL,
    costo numeric(10,0) NOT NULL
);
    DROP TABLE public.materiales;
       public         heap    postgres    false            �            1259    16474    materialesprocedimiento    TABLE     �   CREATE TABLE public.materialesprocedimiento (
    idprocedimiento integer NOT NULL,
    codmaterial character varying(10) NOT NULL
);
 +   DROP TABLE public.materialesprocedimiento;
       public         heap    postgres    false            �            1259    16467    ordencompra    TABLE     �   CREATE TABLE public.ordencompra (
    idcompra character varying(10) NOT NULL,
    codmaterial character varying(10) NOT NULL,
    cantidad integer NOT NULL,
    idstatus integer NOT NULL,
    fecha date NOT NULL
);
    DROP TABLE public.ordencompra;
       public         heap    postgres    false            �            1259    16511    ordentrabajo    TABLE     �   CREATE TABLE public.ordentrabajo (
    idordentrabajo character varying(10) NOT NULL,
    idsolicitud character varying(10) NOT NULL,
    idcalendario integer NOT NULL,
    idstatus integer NOT NULL,
    idpem integer NOT NULL,
    fechafin date
);
     DROP TABLE public.ordentrabajo;
       public         heap    postgres    false            �            1259    16449    pasos    TABLE     e   CREATE TABLE public.pasos (
    idpaso integer NOT NULL,
    paso character varying(500) NOT NULL
);
    DROP TABLE public.pasos;
       public         heap    postgres    false            �            1259    16447    pasos_idpaso_seq    SEQUENCE     y   CREATE SEQUENCE public.pasos_idpaso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pasos_idpaso_seq;
       public          postgres    false    215            �           0    0    pasos_idpaso_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pasos_idpaso_seq OWNED BY public.pasos.idpaso;
          public          postgres    false    214            �            1259    16455    pasosprocedimientos    TABLE     o   CREATE TABLE public.pasosprocedimientos (
    idprocedimiento integer NOT NULL,
    idpaso integer NOT NULL
);
 '   DROP TABLE public.pasosprocedimientos;
       public         heap    postgres    false            �            1259    16439    pem    TABLE     ~   CREATE TABLE public.pem (
    idpem integer NOT NULL,
    idusuario integer NOT NULL,
    idprocedimiento integer NOT NULL
);
    DROP TABLE public.pem;
       public         heap    postgres    false            �            1259    16437    pem_idpem_seq    SEQUENCE     v   CREATE SEQUENCE public.pem_idpem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pem_idpem_seq;
       public          postgres    false    213            �           0    0    pem_idpem_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.pem_idpem_seq OWNED BY public.pem.idpem;
          public          postgres    false    212            �            1259    16431    procedimiento    TABLE        CREATE TABLE public.procedimiento (
    idprocedimiento integer NOT NULL,
    procedimiento character varying(250) NOT NULL
);
 !   DROP TABLE public.procedimiento;
       public         heap    postgres    false            �            1259    16429 !   procedimiento_idprocedimiento_seq    SEQUENCE     �   CREATE SEQUENCE public.procedimiento_idprocedimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.procedimiento_idprocedimiento_seq;
       public          postgres    false    211            �           0    0 !   procedimiento_idprocedimiento_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.procedimiento_idprocedimiento_seq OWNED BY public.procedimiento.idprocedimiento;
          public          postgres    false    210            �            1259    16424    procedimientosmantenimiento    TABLE     �   CREATE TABLE public.procedimientosmantenimiento (
    idpromant character varying(10) NOT NULL,
    descripcion character varying(100) NOT NULL
);
 /   DROP TABLE public.procedimientosmantenimiento;
       public         heap    postgres    false            �            1259    16419    proveedores    TABLE     �   CREATE TABLE public.proveedores (
    idproveedor character varying(10) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(8)
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false            �            1259    16404    rol    TABLE     a   CREATE TABLE public.rol (
    idrol integer NOT NULL,
    rol character varying(100) NOT NULL
);
    DROP TABLE public.rol;
       public         heap    postgres    false            �            1259    16402    rol_idrol_seq    SEQUENCE     v   CREATE SEQUENCE public.rol_idrol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.rol_idrol_seq;
       public          postgres    false    205            �           0    0    rol_idrol_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.rol_idrol_seq OWNED BY public.rol.idrol;
          public          postgres    false    204            �            1259    16487    solicitudordentrabajo    TABLE     \  CREATE TABLE public.solicitudordentrabajo (
    idsolicitud character varying(10) NOT NULL,
    idusuario integer NOT NULL,
    codinventario character varying(10) NOT NULL,
    idpromant character varying(10) NOT NULL,
    numero integer,
    fechasolicitud date NOT NULL,
    tipofalla numeric(10,0) NOT NULL,
    descripcion integer NOT NULL
);
 )   DROP TABLE public.solicitudordentrabajo;
       public         heap    postgres    false            �            1259    16396    status    TABLE     i   CREATE TABLE public.status (
    idstatus integer NOT NULL,
    estado character varying(50) NOT NULL
);
    DROP TABLE public.status;
       public         heap    postgres    false            �            1259    16394    status_idstatus_seq    SEQUENCE     |   CREATE SEQUENCE public.status_idstatus_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.status_idstatus_seq;
       public          postgres    false    203            �           0    0    status_idstatus_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.status_idstatus_seq OWNED BY public.status.idstatus;
          public          postgres    false    202            �            1259    16412    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    idusuario integer NOT NULL,
    username character varying(20) NOT NULL,
    nombres character varying(100) NOT NULL,
    apellidos character varying(250) NOT NULL,
    idrol integer NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    16410    usuarios_idusuario_seq    SEQUENCE        CREATE SEQUENCE public.usuarios_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuarios_idusuario_seq;
       public          postgres    false    207            �           0    0    usuarios_idusuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuarios_idusuario_seq OWNED BY public.usuarios.idusuario;
          public          postgres    false    206            �
           2604    16452    pasos idpaso    DEFAULT     l   ALTER TABLE ONLY public.pasos ALTER COLUMN idpaso SET DEFAULT nextval('public.pasos_idpaso_seq'::regclass);
 ;   ALTER TABLE public.pasos ALTER COLUMN idpaso DROP DEFAULT;
       public          postgres    false    214    215    215            �
           2604    16442 	   pem idpem    DEFAULT     f   ALTER TABLE ONLY public.pem ALTER COLUMN idpem SET DEFAULT nextval('public.pem_idpem_seq'::regclass);
 8   ALTER TABLE public.pem ALTER COLUMN idpem DROP DEFAULT;
       public          postgres    false    213    212    213            �
           2604    16434    procedimiento idprocedimiento    DEFAULT     �   ALTER TABLE ONLY public.procedimiento ALTER COLUMN idprocedimiento SET DEFAULT nextval('public.procedimiento_idprocedimiento_seq'::regclass);
 L   ALTER TABLE public.procedimiento ALTER COLUMN idprocedimiento DROP DEFAULT;
       public          postgres    false    210    211    211            �
           2604    16407 	   rol idrol    DEFAULT     f   ALTER TABLE ONLY public.rol ALTER COLUMN idrol SET DEFAULT nextval('public.rol_idrol_seq'::regclass);
 8   ALTER TABLE public.rol ALTER COLUMN idrol DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    16399    status idstatus    DEFAULT     r   ALTER TABLE ONLY public.status ALTER COLUMN idstatus SET DEFAULT nextval('public.status_idstatus_seq'::regclass);
 >   ALTER TABLE public.status ALTER COLUMN idstatus DROP DEFAULT;
       public          postgres    false    202    203    203            �
           2604    16415    usuarios idusuario    DEFAULT     x   ALTER TABLE ONLY public.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('public.usuarios_idusuario_seq'::regclass);
 A   ALTER TABLE public.usuarios ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    206    207    207            �          0    16506 
   calendario 
   TABLE DATA           9   COPY public.calendario (idcalendario, fecha) FROM stdin;
    public          postgres    false    224   ��       �          0    16495    herramientas 
   TABLE DATA           G   COPY public.herramientas (idherramienta, nombre, cantidad) FROM stdin;
    public          postgres    false    222   ˊ       �          0    16500    herramientasprocedimiento 
   TABLE DATA           S   COPY public.herramientasprocedimiento (idprocedimiento, idherramienta) FROM stdin;
    public          postgres    false    223   �       �          0    16479 
   inventario 
   TABLE DATA           �   COPY public.inventario (codinventario, nombre, descripcion, modelo, numeroserie, ano, condicion, ubicacion, vidautil, garantia) FROM stdin;
    public          postgres    false    220   �       �          0    16461 
   materiales 
   TABLE DATA           d   COPY public.materiales (codmaterial, nombre, descripcion, idproveedor, cantidad, costo) FROM stdin;
    public          postgres    false    217   "�       �          0    16474    materialesprocedimiento 
   TABLE DATA           O   COPY public.materialesprocedimiento (idprocedimiento, codmaterial) FROM stdin;
    public          postgres    false    219   ?�       �          0    16467    ordencompra 
   TABLE DATA           W   COPY public.ordencompra (idcompra, codmaterial, cantidad, idstatus, fecha) FROM stdin;
    public          postgres    false    218   \�       �          0    16511    ordentrabajo 
   TABLE DATA           l   COPY public.ordentrabajo (idordentrabajo, idsolicitud, idcalendario, idstatus, idpem, fechafin) FROM stdin;
    public          postgres    false    225   y�       �          0    16449    pasos 
   TABLE DATA           -   COPY public.pasos (idpaso, paso) FROM stdin;
    public          postgres    false    215   ��       �          0    16455    pasosprocedimientos 
   TABLE DATA           F   COPY public.pasosprocedimientos (idprocedimiento, idpaso) FROM stdin;
    public          postgres    false    216   ��       �          0    16439    pem 
   TABLE DATA           @   COPY public.pem (idpem, idusuario, idprocedimiento) FROM stdin;
    public          postgres    false    213   Ћ       �          0    16431    procedimiento 
   TABLE DATA           G   COPY public.procedimiento (idprocedimiento, procedimiento) FROM stdin;
    public          postgres    false    211   �       �          0    16424    procedimientosmantenimiento 
   TABLE DATA           M   COPY public.procedimientosmantenimiento (idpromant, descripcion) FROM stdin;
    public          postgres    false    209   
�       �          0    16419    proveedores 
   TABLE DATA           D   COPY public.proveedores (idproveedor, nombre, telefono) FROM stdin;
    public          postgres    false    208   '�       �          0    16404    rol 
   TABLE DATA           )   COPY public.rol (idrol, rol) FROM stdin;
    public          postgres    false    205   D�       �          0    16487    solicitudordentrabajo 
   TABLE DATA           �   COPY public.solicitudordentrabajo (idsolicitud, idusuario, codinventario, idpromant, numero, fechasolicitud, tipofalla, descripcion) FROM stdin;
    public          postgres    false    221   a�       �          0    16396    status 
   TABLE DATA           2   COPY public.status (idstatus, estado) FROM stdin;
    public          postgres    false    203   ~�       �          0    16412    usuarios 
   TABLE DATA           R   COPY public.usuarios (idusuario, username, nombres, apellidos, idrol) FROM stdin;
    public          postgres    false    207   ��       �           0    0    pasos_idpaso_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pasos_idpaso_seq', 1, false);
          public          postgres    false    214            �           0    0    pem_idpem_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pem_idpem_seq', 1, false);
          public          postgres    false    212            �           0    0 !   procedimiento_idprocedimiento_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.procedimiento_idprocedimiento_seq', 1, false);
          public          postgres    false    210            �           0    0    rol_idrol_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.rol_idrol_seq', 1, false);
          public          postgres    false    204            �           0    0    status_idstatus_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.status_idstatus_seq', 1, false);
          public          postgres    false    202            �           0    0    usuarios_idusuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuarios_idusuario_seq', 1, false);
          public          postgres    false    206                        2606    16510    calendario calendario_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.calendario
    ADD CONSTRAINT calendario_pk PRIMARY KEY (idcalendario);
 B   ALTER TABLE ONLY public.calendario DROP CONSTRAINT calendario_pk;
       public            postgres    false    224            �
           2606    16499    herramientas herramientas_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.herramientas
    ADD CONSTRAINT herramientas_pk PRIMARY KEY (idherramienta);
 F   ALTER TABLE ONLY public.herramientas DROP CONSTRAINT herramientas_pk;
       public            postgres    false    222            �
           2606    16504 6   herramientasprocedimiento herramientasprocedimiento_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.herramientasprocedimiento
    ADD CONSTRAINT herramientasprocedimiento_pk PRIMARY KEY (idprocedimiento, idherramienta);
 `   ALTER TABLE ONLY public.herramientasprocedimiento DROP CONSTRAINT herramientasprocedimiento_pk;
       public            postgres    false    223    223            �
           2606    16486    inventario inventario_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pk PRIMARY KEY (codinventario);
 B   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pk;
       public            postgres    false    220            �
           2606    16465    materiales materiales_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_pk PRIMARY KEY (codmaterial);
 B   ALTER TABLE ONLY public.materiales DROP CONSTRAINT materiales_pk;
       public            postgres    false    217            �
           2606    16478 2   materialesprocedimiento materialesprocedimiento_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.materialesprocedimiento
    ADD CONSTRAINT materialesprocedimiento_pk PRIMARY KEY (idprocedimiento, codmaterial);
 \   ALTER TABLE ONLY public.materialesprocedimiento DROP CONSTRAINT materialesprocedimiento_pk;
       public            postgres    false    219    219            �
           2606    16471    ordencompra ordencompra_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ordencompra
    ADD CONSTRAINT ordencompra_pk PRIMARY KEY (idcompra);
 D   ALTER TABLE ONLY public.ordencompra DROP CONSTRAINT ordencompra_pk;
       public            postgres    false    218                       2606    16515    ordentrabajo ordentrabajo_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.ordentrabajo
    ADD CONSTRAINT ordentrabajo_pk PRIMARY KEY (idordentrabajo);
 F   ALTER TABLE ONLY public.ordentrabajo DROP CONSTRAINT ordentrabajo_pk;
       public            postgres    false    225            �
           2606    16454    pasos pasos_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.pasos
    ADD CONSTRAINT pasos_pk PRIMARY KEY (idpaso);
 8   ALTER TABLE ONLY public.pasos DROP CONSTRAINT pasos_pk;
       public            postgres    false    215            �
           2606    16459 *   pasosprocedimientos pasosprocedimientos_pk 
   CONSTRAINT     }   ALTER TABLE ONLY public.pasosprocedimientos
    ADD CONSTRAINT pasosprocedimientos_pk PRIMARY KEY (idprocedimiento, idpaso);
 T   ALTER TABLE ONLY public.pasosprocedimientos DROP CONSTRAINT pasosprocedimientos_pk;
       public            postgres    false    216    216            �
           2606    16444 
   pem pem_pk 
   CONSTRAINT     K   ALTER TABLE ONLY public.pem
    ADD CONSTRAINT pem_pk PRIMARY KEY (idpem);
 4   ALTER TABLE ONLY public.pem DROP CONSTRAINT pem_pk;
       public            postgres    false    213            �
           2606    16436    procedimiento procedimiento_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.procedimiento
    ADD CONSTRAINT procedimiento_pk PRIMARY KEY (idprocedimiento);
 H   ALTER TABLE ONLY public.procedimiento DROP CONSTRAINT procedimiento_pk;
       public            postgres    false    211            �
           2606    16428 :   procedimientosmantenimiento procedimientosmantenimiento_pk 
   CONSTRAINT        ALTER TABLE ONLY public.procedimientosmantenimiento
    ADD CONSTRAINT procedimientosmantenimiento_pk PRIMARY KEY (idpromant);
 d   ALTER TABLE ONLY public.procedimientosmantenimiento DROP CONSTRAINT procedimientosmantenimiento_pk;
       public            postgres    false    209            �
           2606    16423    proveedores proveedores_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pk PRIMARY KEY (idproveedor);
 D   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pk;
       public            postgres    false    208            �
           2606    16409 
   rol rol_pk 
   CONSTRAINT     K   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pk PRIMARY KEY (idrol);
 4   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pk;
       public            postgres    false    205            �
           2606    16491 .   solicitudordentrabajo solicitudordentrabajo_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.solicitudordentrabajo
    ADD CONSTRAINT solicitudordentrabajo_pk PRIMARY KEY (idsolicitud);
 X   ALTER TABLE ONLY public.solicitudordentrabajo DROP CONSTRAINT solicitudordentrabajo_pk;
       public            postgres    false    221            �
           2606    16401    status status_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pk PRIMARY KEY (idstatus);
 :   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pk;
       public            postgres    false    203            �
           2606    16417    usuarios usuarios_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (idusuario);
 >   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pk;
       public            postgres    false    207            �
           1259    16493    codinventario    INDEX     X   CREATE INDEX codinventario ON public.solicitudordentrabajo USING btree (codinventario);
 !   DROP INDEX public.codinventario;
       public            postgres    false    221            �
           1259    16473    codmaterial    INDEX     J   CREATE INDEX codmaterial ON public.ordencompra USING btree (codmaterial);
    DROP INDEX public.codmaterial;
       public            postgres    false    218                       1259    16517    idcalendario    INDEX     M   CREATE INDEX idcalendario ON public.ordentrabajo USING btree (idcalendario);
     DROP INDEX public.idcalendario;
       public            postgres    false    225            �
           1259    16505    idherramienta    INDEX     \   CREATE INDEX idherramienta ON public.herramientasprocedimiento USING btree (idherramienta);
 !   DROP INDEX public.idherramienta;
       public            postgres    false    223            �
           1259    16460    idpaso    INDEX     H   CREATE INDEX idpaso ON public.pasosprocedimientos USING btree (idpaso);
    DROP INDEX public.idpaso;
       public            postgres    false    216                       1259    16518    idpem    INDEX     ?   CREATE INDEX idpem ON public.ordentrabajo USING btree (idpem);
    DROP INDEX public.idpem;
       public            postgres    false    225            �
           1259    16446    idprocedimiento    INDEX     J   CREATE INDEX idprocedimiento ON public.pem USING btree (idprocedimiento);
 #   DROP INDEX public.idprocedimiento;
       public            postgres    false    213            �
           1259    16494 	   idpromant    INDEX     P   CREATE INDEX idpromant ON public.solicitudordentrabajo USING btree (idpromant);
    DROP INDEX public.idpromant;
       public            postgres    false    221            �
           1259    16466    idproveedor    INDEX     I   CREATE INDEX idproveedor ON public.materiales USING btree (idproveedor);
    DROP INDEX public.idproveedor;
       public            postgres    false    217            �
           1259    16445    idresponsable    INDEX     I   CREATE UNIQUE INDEX idresponsable ON public.pem USING btree (idusuario);
 !   DROP INDEX public.idresponsable;
       public            postgres    false    213            �
           1259    16418    idrol    INDEX     ;   CREATE INDEX idrol ON public.usuarios USING btree (idrol);
    DROP INDEX public.idrol;
       public            postgres    false    207                       1259    16516    idsolicitud    INDEX     K   CREATE INDEX idsolicitud ON public.ordentrabajo USING btree (idsolicitud);
    DROP INDEX public.idsolicitud;
       public            postgres    false    225            �
           1259    16472    idstatus    INDEX     D   CREATE INDEX idstatus ON public.ordencompra USING btree (idstatus);
    DROP INDEX public.idstatus;
       public            postgres    false    218            �
           1259    16492 	   idusuario    INDEX     P   CREATE INDEX idusuario ON public.solicitudordentrabajo USING btree (idusuario);
    DROP INDEX public.idusuario;
       public            postgres    false    221                       2606    16579 :   herramientasprocedimiento herramientasprocedimiento_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.herramientasprocedimiento
    ADD CONSTRAINT herramientasprocedimiento_ibfk_1 FOREIGN KEY (idherramienta) REFERENCES public.herramientas(idherramienta);
 d   ALTER TABLE ONLY public.herramientasprocedimiento DROP CONSTRAINT herramientasprocedimiento_ibfk_1;
       public          postgres    false    222    223    2811                       2606    16544 :   herramientasprocedimiento herramientasprocedimiento_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.herramientasprocedimiento
    ADD CONSTRAINT herramientasprocedimiento_ibfk_2 FOREIGN KEY (idprocedimiento) REFERENCES public.procedimiento(idprocedimiento);
 d   ALTER TABLE ONLY public.herramientasprocedimiento DROP CONSTRAINT herramientasprocedimiento_ibfk_2;
       public          postgres    false    211    2784    223                       2606    16534    materiales materiales_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_ibfk_1 FOREIGN KEY (idproveedor) REFERENCES public.proveedores(idproveedor);
 F   ALTER TABLE ONLY public.materiales DROP CONSTRAINT materiales_ibfk_1;
       public          postgres    false    208    217    2780                       2606    16559 6   materialesprocedimiento materialesprocedimiento_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialesprocedimiento
    ADD CONSTRAINT materialesprocedimiento_ibfk_1 FOREIGN KEY (codmaterial) REFERENCES public.materiales(codmaterial);
 `   ALTER TABLE ONLY public.materialesprocedimiento DROP CONSTRAINT materialesprocedimiento_ibfk_1;
       public          postgres    false    2796    217    219                       2606    16594 6   materialesprocedimiento materialesprocedimiento_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialesprocedimiento
    ADD CONSTRAINT materialesprocedimiento_ibfk_2 FOREIGN KEY (idprocedimiento) REFERENCES public.procedimiento(idprocedimiento) NOT VALID;
 `   ALTER TABLE ONLY public.materialesprocedimiento DROP CONSTRAINT materialesprocedimiento_ibfk_2;
       public          postgres    false    219    2784    211                       2606    16564    ordencompra ordencompra_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordencompra
    ADD CONSTRAINT ordencompra_ibfk_1 FOREIGN KEY (codmaterial) REFERENCES public.materiales(codmaterial);
 H   ALTER TABLE ONLY public.ordencompra DROP CONSTRAINT ordencompra_ibfk_1;
       public          postgres    false    217    2796    218                       2606    16519    ordencompra ordencompra_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordencompra
    ADD CONSTRAINT ordencompra_ibfk_2 FOREIGN KEY (idstatus) REFERENCES public.status(idstatus);
 H   ALTER TABLE ONLY public.ordencompra DROP CONSTRAINT ordencompra_ibfk_2;
       public          postgres    false    218    203    2773                       2606    16574     ordentrabajo ordentrabajo_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordentrabajo
    ADD CONSTRAINT ordentrabajo_ibfk_1 FOREIGN KEY (idsolicitud) REFERENCES public.solicitudordentrabajo(idsolicitud);
 J   ALTER TABLE ONLY public.ordentrabajo DROP CONSTRAINT ordentrabajo_ibfk_1;
       public          postgres    false    225    2809    221                       2606    16584     ordentrabajo ordentrabajo_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordentrabajo
    ADD CONSTRAINT ordentrabajo_ibfk_2 FOREIGN KEY (idcalendario) REFERENCES public.calendario(idcalendario);
 J   ALTER TABLE ONLY public.ordentrabajo DROP CONSTRAINT ordentrabajo_ibfk_2;
       public          postgres    false    2816    225    224                       2606    16589     ordentrabajo ordentrabajo_ibfk_3    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordentrabajo
    ADD CONSTRAINT ordentrabajo_ibfk_3 FOREIGN KEY (idstatus) REFERENCES public.status(idstatus) NOT VALID;
 J   ALTER TABLE ONLY public.ordentrabajo DROP CONSTRAINT ordentrabajo_ibfk_3;
       public          postgres    false    203    2773    225                       2606    16549     ordentrabajo ordentrabajo_ibfk_4    FK CONSTRAINT     ~   ALTER TABLE ONLY public.ordentrabajo
    ADD CONSTRAINT ordentrabajo_ibfk_4 FOREIGN KEY (idpem) REFERENCES public.pem(idpem);
 J   ALTER TABLE ONLY public.ordentrabajo DROP CONSTRAINT ordentrabajo_ibfk_4;
       public          postgres    false    225    2788    213            	           2606    16554 .   pasosprocedimientos pasosprocedimientos_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pasosprocedimientos
    ADD CONSTRAINT pasosprocedimientos_ibfk_1 FOREIGN KEY (idpaso) REFERENCES public.pasos(idpaso);
 X   ALTER TABLE ONLY public.pasosprocedimientos DROP CONSTRAINT pasosprocedimientos_ibfk_1;
       public          postgres    false    216    2790    215            
           2606    16599 .   pasosprocedimientos pasosprocedimientos_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.pasosprocedimientos
    ADD CONSTRAINT pasosprocedimientos_ibfk_2 FOREIGN KEY (idprocedimiento) REFERENCES public.procedimiento(idprocedimiento) NOT VALID;
 X   ALTER TABLE ONLY public.pasosprocedimientos DROP CONSTRAINT pasosprocedimientos_ibfk_2;
       public          postgres    false    211    216    2784                       2606    16609    pem pem_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pem
    ADD CONSTRAINT pem_ibfk_1 FOREIGN KEY (idprocedimiento) REFERENCES public.procedimiento(idprocedimiento) NOT VALID;
 8   ALTER TABLE ONLY public.pem DROP CONSTRAINT pem_ibfk_1;
       public          postgres    false    213    2784    211                       2606    16529    pem pem_ibfk_2    FK CONSTRAINT     y   ALTER TABLE ONLY public.pem
    ADD CONSTRAINT pem_ibfk_2 FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario);
 8   ALTER TABLE ONLY public.pem DROP CONSTRAINT pem_ibfk_2;
       public          postgres    false    213    207    2778                       2606    16604 2   solicitudordentrabajo solicitudordentrabajo_ibfk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitudordentrabajo
    ADD CONSTRAINT solicitudordentrabajo_ibfk_1 FOREIGN KEY (idusuario) REFERENCES public.usuarios(idusuario) NOT VALID;
 \   ALTER TABLE ONLY public.solicitudordentrabajo DROP CONSTRAINT solicitudordentrabajo_ibfk_1;
       public          postgres    false    221    2778    207                       2606    16569 2   solicitudordentrabajo solicitudordentrabajo_ibfk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitudordentrabajo
    ADD CONSTRAINT solicitudordentrabajo_ibfk_2 FOREIGN KEY (codinventario) REFERENCES public.inventario(codinventario);
 \   ALTER TABLE ONLY public.solicitudordentrabajo DROP CONSTRAINT solicitudordentrabajo_ibfk_2;
       public          postgres    false    2804    221    220                       2606    16539 2   solicitudordentrabajo solicitudordentrabajo_ibfk_3    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitudordentrabajo
    ADD CONSTRAINT solicitudordentrabajo_ibfk_3 FOREIGN KEY (idpromant) REFERENCES public.procedimientosmantenimiento(idpromant);
 \   ALTER TABLE ONLY public.solicitudordentrabajo DROP CONSTRAINT solicitudordentrabajo_ibfk_3;
       public          postgres    false    2782    209    221                       2606    16524    usuarios usuarios_ibfk_1    FK CONSTRAINT     v   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_ibfk_1 FOREIGN KEY (idrol) REFERENCES public.rol(idrol);
 B   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_ibfk_1;
       public          postgres    false    207    205    2775            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     
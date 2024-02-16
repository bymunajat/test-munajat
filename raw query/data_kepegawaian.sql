PGDMP      9                |            data_kepegawaian    16.2    16.2 %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    data_kepegawaian    DATABASE     �   CREATE DATABASE data_kepegawaian WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
     DROP DATABASE data_kepegawaian;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16447    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false    4            �            1259    16436 	   education    TABLE     �  CREATE TABLE public.education (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255),
    level character varying(10),
    description character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT education_level_check CHECK (((level)::text = ANY ((ARRAY['TK'::character varying, 'SD'::character varying, 'SMP'::character varying, 'SMA'::character varying, 'S1'::character varying])::text[])))
);
    DROP TABLE public.education;
       public         heap    postgres    false    4            �            1259    16435    education_id_seq    SEQUENCE     �   CREATE SEQUENCE public.education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.education_id_seq;
       public          postgres    false    4    222            �           0    0    education_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.education_id_seq OWNED BY public.education.id;
          public          postgres    false    221            �            1259    16412    employee    TABLE     �  CREATE TABLE public.employee (
    id integer NOT NULL,
    nik character varying(255),
    name character varying(255),
    is_active boolean,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.employee;
       public         heap    postgres    false    4            �            1259    16423    employee_family    TABLE     6  CREATE TABLE public.employee_family (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255),
    identifier character varying(255),
    job character varying(255),
    place_of_birth character varying,
    date_of_birth date,
    religion character varying(10),
    is_life boolean,
    is_divorced boolean,
    relation_status character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT employee_family_relation_status_check CHECK (((relation_status)::text = ANY ((ARRAY['suami'::character varying, 'istri'::character varying, 'anak sambung'::character varying])::text[]))),
    CONSTRAINT employee_family_religion_check CHECK (((religion)::text = ANY ((ARRAY['islam'::character varying, 'katolik'::character varying, 'buddha'::character varying, 'protestan'::character varying, 'konghucu'::character varying])::text[])))
);
 #   DROP TABLE public.employee_family;
       public         heap    postgres    false    4            �            1259    16422    employee_family_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_family_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.employee_family_id_seq;
       public          postgres    false    220    4            �           0    0    employee_family_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.employee_family_id_seq OWNED BY public.employee_family.id;
          public          postgres    false    219            �            1259    16411    employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.employee_id_seq;
       public          postgres    false    4    218            �           0    0    employee_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;
          public          postgres    false    217            �            1259    16400    employee_profile    TABLE     �  CREATE TABLE public.employee_profile (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    place_of_birth character varying,
    date_of_birth date,
    gender character varying(10),
    is_married boolean,
    prof_pict character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT employee_profile_gender_check CHECK (((gender)::text = ANY ((ARRAY['Laki Laki'::character varying, 'Perempuan'::character varying])::text[])))
);
 $   DROP TABLE public.employee_profile;
       public         heap    postgres    false    4            �            1259    16399    employee_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.employee_profile_id_seq;
       public          postgres    false    4    216            �           0    0    employee_profile_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.employee_profile_id_seq OWNED BY public.employee_profile.id;
          public          postgres    false    215            6           2604    16439    education id    DEFAULT     l   ALTER TABLE ONLY public.education ALTER COLUMN id SET DEFAULT nextval('public.education_id_seq'::regclass);
 ;   ALTER TABLE public.education ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            0           2604    16415    employee id    DEFAULT     j   ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);
 :   ALTER TABLE public.employee ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            3           2604    16426    employee_family id    DEFAULT     x   ALTER TABLE ONLY public.employee_family ALTER COLUMN id SET DEFAULT nextval('public.employee_family_id_seq'::regclass);
 A   ALTER TABLE public.employee_family ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            -           2604    16403    employee_profile id    DEFAULT     z   ALTER TABLE ONLY public.employee_profile ALTER COLUMN id SET DEFAULT nextval('public.employee_profile_id_seq'::regclass);
 B   ALTER TABLE public.employee_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    16447    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    223   1       �          0    16436 	   education 
   TABLE DATA           ~   COPY public.education (id, employee_id, name, level, description, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    222   �1       �          0    16412    employee 
   TABLE DATA           �   COPY public.employee (id, nik, name, is_active, start_date, end_date, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    218   2       �          0    16423    employee_family 
   TABLE DATA           �   COPY public.employee_family (id, employee_id, name, identifier, job, place_of_birth, date_of_birth, religion, is_life, is_divorced, relation_status, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    220   �2       �          0    16400    employee_profile 
   TABLE DATA           �   COPY public.employee_profile (id, employee_id, place_of_birth, date_of_birth, gender, is_married, prof_pict, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    216   m3       �           0    0    education_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.education_id_seq', 4, true);
          public          postgres    false    221            �           0    0    employee_family_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.employee_family_id_seq', 3, true);
          public          postgres    false    219            �           0    0    employee_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.employee_id_seq', 2, true);
          public          postgres    false    217            �           0    0    employee_profile_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.employee_profile_id_seq', 1, true);
          public          postgres    false    215            F           2606    16451     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    223            D           2606    16446    education education_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.education DROP CONSTRAINT education_pkey;
       public            postgres    false    222            B           2606    16434 $   employee_family employee_family_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.employee_family DROP CONSTRAINT employee_family_pkey;
       public            postgres    false    220            @           2606    16421    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    218            >           2606    16410 &   employee_profile employee_profile_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.employee_profile DROP CONSTRAINT employee_profile_pkey;
       public            postgres    false    216            �   _   x�m�A@0 �{�Bv�_$R�M*[��߻q��d�B�ʞl���yNf��K����p����;|�z[�|��Д�3�K��T+�5�9�      �   ~   x�3�4�t�I�M�+I,�TN�����v�t/JL)M,IM�LL��̃�FF&�F��f
��V&fVF&zf��F�e���Vxd�g��u���ƜF���	�
���Ԝ�"�����T�`C*Z���� +�b�      �   r   x���1
�0D�S��?�h�����FXAc��Qp����a�<h1�+*þT��g9��W�	�L�m�߾�֛�,�L�A���ks�F�0�ُ�z,?F�g���9wЖ1)      �   �   x��бj�0���S�t�eKC��t�ru�XؒAV��}]����)����G �8��ك�nL�Y'�	����gy�\�R���Xn�CzL%U#��֤�M�%�1�������Jy���,������H(�É�z��~K�'�4N��O�9�2�ٮ5�V$�	��/sƎ����Z˜�#�y
�S������R!lP      �      x���1�@����)��lfV���� 6���Y7�$�Z����+>��l�-�Aږ�I�ŦT����<����e��sʟ*kC�$�JꮑN�~��q9��d���J|$e\��Y���O��;�^-l8�     
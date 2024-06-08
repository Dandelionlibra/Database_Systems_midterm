PGDMP      8    
            |            DBS    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16412    DBS    DATABASE     �   CREATE DATABASE "DBS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Traditional)_Taiwan.950';
    DROP DATABASE "DBS";
                postgres    false                       0    0    DATABASE "DBS"    COMMENT     *   COMMENT ON DATABASE "DBS" IS 'QA7、QA8';
                   postgres    false    4875            �            1259    17224    company    TABLE     s   CREATE TABLE public.company (
    company_name character varying(255) NOT NULL,
    city character varying(255)
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    17217    employee    TABLE     �   CREATE TABLE public.employee (
    employee_name character varying(255) NOT NULL,
    street character varying(255),
    city character varying(255)
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    17250    manages    TABLE     |   CREATE TABLE public.manages (
    employee_name character varying(255) NOT NULL,
    manager_name character varying(255)
);
    DROP TABLE public.manages;
       public         heap    postgres    false            �            1259    17231    works    TABLE     �   CREATE TABLE public.works (
    employee_name character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    salary integer DEFAULT 0,
    CONSTRAINT positive_salary CHECK ((salary >= 0))
);
    DROP TABLE public.works;
       public         heap    postgres    false            �            1259    17271    employee_avg_salary    VIEW     �   CREATE VIEW public.employee_avg_salary AS
 SELECT m.manager_name,
    avg(w.salary) AS avg
   FROM (public.works w
     JOIN public.manages m ON (((w.employee_name)::text = (m.employee_name)::text)))
  GROUP BY m.manager_name;
 &   DROP VIEW public.employee_avg_salary;
       public          postgres    false    218    217    218    217            �            1259    17267    ex5_2    VIEW     �   CREATE VIEW public.ex5_2 AS
 SELECT employee_name
   FROM public.works
  WHERE (salary > ALL ( SELECT works_1.salary
           FROM public.works works_1
          WHERE ((works_1.company_name)::text = 'Land Bank'::text)));
    DROP VIEW public.ex5_2;
       public          postgres    false    217    217    217                      0    17224    company 
   TABLE DATA           5   COPY public.company (company_name, city) FROM stdin;
    public          postgres    false    216   f                 0    17217    employee 
   TABLE DATA           ?   COPY public.employee (employee_name, street, city) FROM stdin;
    public          postgres    false    215                    0    17250    manages 
   TABLE DATA           >   COPY public.manages (employee_name, manager_name) FROM stdin;
    public          postgres    false    218   �                 0    17231    works 
   TABLE DATA           D   COPY public.works (employee_name, company_name, salary) FROM stdin;
    public          postgres    false    217   �       h           2606    17230    company company_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (company_name);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    216            f           2606    17223    employee employee_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_name);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    215            l           2606    17256    manages manages_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.manages
    ADD CONSTRAINT manages_pkey PRIMARY KEY (employee_name);
 >   ALTER TABLE ONLY public.manages DROP CONSTRAINT manages_pkey;
       public            postgres    false    218            j           2606    17239    works works_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_pkey PRIMARY KEY (employee_name, company_name);
 :   ALTER TABLE ONLY public.works DROP CONSTRAINT works_pkey;
       public            postgres    false    217    217            o           2606    17257 "   manages manages_employee_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.manages
    ADD CONSTRAINT manages_employee_name_fkey FOREIGN KEY (employee_name) REFERENCES public.employee(employee_name);
 L   ALTER TABLE ONLY public.manages DROP CONSTRAINT manages_employee_name_fkey;
       public          postgres    false    215    4710    218            p           2606    17262 !   manages manages_manager_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.manages
    ADD CONSTRAINT manages_manager_name_fkey FOREIGN KEY (manager_name) REFERENCES public.employee(employee_name);
 K   ALTER TABLE ONLY public.manages DROP CONSTRAINT manages_manager_name_fkey;
       public          postgres    false    215    4710    218            m           2606    17245    works works_company_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_company_name_fkey FOREIGN KEY (company_name) REFERENCES public.company(company_name);
 G   ALTER TABLE ONLY public.works DROP CONSTRAINT works_company_name_fkey;
       public          postgres    false    216    217    4712            n           2606    17240    works works_employee_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_employee_name_fkey FOREIGN KEY (employee_name) REFERENCES public.employee(employee_name);
 H   ALTER TABLE ONLY public.works DROP CONSTRAINT works_employee_name_fkey;
       public          postgres    false    4710    217    215               �   x�U�A
�0EיS�	�CKQ��Ҹ܄t�C�HZ�������}���ȹ�X;��B|h��:�7�j�J%*p�<�ɿD��b�l��B�&Bg<��E�L$kcG�ة�h5M#�s�iThfq�E!�v[VMed�����= ��1DV         �  x�m��n1���)�	�.�96MD�A��*�2ڝ����6���w�"���,y���o��V��T��!l����I��ˇ�Y��[N��'���|��r"G�l��HV����^�ǖ�k<y�ز��
�8����CS��/1y1KX�� Gv9e0h���s{�Pj��7+�Qs�·b8y����
k��4r�h4�#:��>�0%Gf��������8�6�l[6�r��.�L&X���"y��]D�����&��1����i�JBEl)������fw�
��h�,�3Am|-��;�}���Wݲ,����6�:�h���S���Ng��ݨ�<'�ˋl)��m�J�S�<��!���ɽ�w]pf�!���hc���g
=�Mg�C�it��'�˩���y�ޛ$pT`�z��B������Q��|           x�ePKn�@]ǧ�	z�� � J��ac��:� Oh��C�@�����RP,)c���Y�O��1G��2'G�^�K��<��`��tl�J�JR��J�G��lِQ�-� ʷ�!l)~�AŪ��u�LN�;]E=g\����:؈v�lJNw+^��k�B����v4�8���(�pȢ�EOP�����W�#,h.�k��&��������^L���[���U�Y��{��d�����}H�yv�� ���         �  x�m��n�0E��W����^�&n�:`���f M���a@�)���-P�z����&�lV��4����yYdz��0���g.��\�P�z���S`����s[7��>����SR�H�#�=΄I����~�#�1��͉���௲�r3?�UY]�Bo0%j���CTS�L9��H��ʛ�:�&����/E���\ Bo^ �������6�ٺ*�ۙc���`��ه�b�_�m�M턇�~	�>t��W�ZȺ�����YCl	f��J�-q�F���,xʭ�����ѿ8p�6���H�ɬ�_
�e��O׋��a����M^�pM�f�e,;W���r�O���$Tp����qfۺ�<
�7�����6�~��lN"�����~�eE)�z���.��M     
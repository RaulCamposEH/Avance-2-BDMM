CREATE DATABASE  IF NOT EXISTS `db_cyberkong` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_cyberkong`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_cyberkong
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_carrito`
--

DROP TABLE IF EXISTS `t_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_carrito` (
  `listado_carrito` json DEFAULT NULL COMMENT 'LISTADO DE PRODUCTOS CON DETALLES PARA SU VENTA, EN FORMATO JSON',
  `USER_ID` int NOT NULL COMMENT 'LLAVE FORANEA DEL USUARIO DUEÑO DEL CARRITO',
  `ESTADO_ID` int DEFAULT NULL COMMENT 'ESTADO EN EL QUE SE ENCUENTRA EL CARRITO',
  KEY `FK_carrito_user` (`USER_ID`),
  KEY `FK_carrito_state` (`ESTADO_ID`),
  CONSTRAINT `FK_carrito_state` FOREIGN KEY (`ESTADO_ID`) REFERENCES `t_static_state` (`ESTADO_ID`),
  CONSTRAINT `FK_carrito_user` FOREIGN KEY (`USER_ID`) REFERENCES `t_usuarios` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_carrito`
--

LOCK TABLES `t_carrito` WRITE;
/*!40000 ALTER TABLE `t_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cat_prod`
--

DROP TABLE IF EXISTS `t_cat_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cat_prod` (
  `CATEGORIA_ID` int DEFAULT NULL COMMENT 'ID DE CATEGORIA QUE REPRESENTA LA CATEGORIA ASOCIADA',
  `PRODUCTO_ID` int DEFAULT NULL COMMENT 'ID DE PRODUCTO QUE REPRESENTA EL PRODUCTO AL QUE SE LE VA ASOCIAR LA CATEGORIA',
  KEY `FK_categoria` (`CATEGORIA_ID`),
  KEY `FK_producto_cat` (`PRODUCTO_ID`),
  CONSTRAINT `FK_categoria` FOREIGN KEY (`CATEGORIA_ID`) REFERENCES `t_categorias` (`CATEGORIA_ID`),
  CONSTRAINT `FK_producto_cat` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `t_productos` (`PRODUCTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cat_prod`
--

LOCK TABLES `t_cat_prod` WRITE;
/*!40000 ALTER TABLE `t_cat_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cat_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_categorias`
--

DROP TABLE IF EXISTS `t_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_categorias` (
  `CATEGORIA_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO POR CATEGORIA',
  `cat_nombre` varchar(20) DEFAULT NULL COMMENT 'NOMBRE DE LA CATEGORIA',
  `cat_descripcion` varchar(250) DEFAULT NULL COMMENT 'DESCRIPCION DE LA CATEGORIA',
  `USER_ID` int DEFAULT NULL COMMENT 'ID DEL USUARIO QUIEN CREO ESTA CATEGORIA',
  PRIMARY KEY (`CATEGORIA_ID`),
  KEY `FK_cat_user` (`USER_ID`),
  CONSTRAINT `FK_cat_user` FOREIGN KEY (`USER_ID`) REFERENCES `t_usuarios` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_categorias`
--

LOCK TABLES `t_categorias` WRITE;
/*!40000 ALTER TABLE `t_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comentarios`
--

DROP TABLE IF EXISTS `t_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_comentarios` (
  `COMENTARIO_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO DEL COMENTARIO',
  `com_contenido` text COMMENT 'CONTENIDO DEL COMENTARIO',
  `com_valoracion` int DEFAULT NULL COMMENT 'VALORACION DEL PRODUCTO',
  `com_fecha` datetime DEFAULT NULL COMMENT 'FECHA EN QUE SE HIZO EL COMENTARIO',
  `PRODUCTO_ID` int DEFAULT NULL COMMENT 'PRODUCTO AL QUE SE ESTA HACIENDO EL COMENTARIO',
  `USER_ID` int DEFAULT NULL COMMENT 'USUARIO QUIEN ESTA HACIENDO EL COMENTARIO',
  PRIMARY KEY (`COMENTARIO_ID`),
  KEY `FK_comment_prod` (`PRODUCTO_ID`),
  KEY `FK_comment_user` (`USER_ID`),
  CONSTRAINT `FK_comment_prod` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `t_productos` (`PRODUCTO_ID`),
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`USER_ID`) REFERENCES `t_usuarios` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comentarios`
--

LOCK TABLES `t_comentarios` WRITE;
/*!40000 ALTER TABLE `t_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lista_deseados`
--

DROP TABLE IF EXISTS `t_lista_deseados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lista_deseados` (
  `LISTA_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO DE LA LISTA DE DESEOS DEL USUARIO',
  `lista_descripcion` text COMMENT 'DESCRIPCION DE LA LISTA',
  `lista_longitud` int DEFAULT NULL COMMENT 'CANTIDAD DE ARTICULOS EN LA LISTA',
  `USER_ID` int DEFAULT NULL COMMENT 'ID DEL USUARIO DUEÑO DE LA LISTA',
  `ESTADO_ID` int DEFAULT NULL COMMENT 'ESTADO DE LA LISTA (PUBLICA O PRIVADA)',
  PRIMARY KEY (`LISTA_ID`),
  KEY `FK_lista_user` (`USER_ID`),
  KEY `FK_lista_state` (`ESTADO_ID`),
  CONSTRAINT `FK_lista_state` FOREIGN KEY (`ESTADO_ID`) REFERENCES `t_static_state` (`ESTADO_ID`),
  CONSTRAINT `FK_lista_user` FOREIGN KEY (`USER_ID`) REFERENCES `t_usuarios` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lista_deseados`
--

LOCK TABLES `t_lista_deseados` WRITE;
/*!40000 ALTER TABLE `t_lista_deseados` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_lista_deseados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lista_prod`
--

DROP TABLE IF EXISTS `t_lista_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lista_prod` (
  `PRODUCTO_ID` int DEFAULT NULL COMMENT 'ID DEL PRODUCTO',
  `LISTA_ID` int DEFAULT NULL COMMENT 'ID DE LA LISTA DONDE SE MOSTRARA ESTE PRODUCTO',
  `fecha_ag` datetime DEFAULT NULL COMMENT 'FECHA EN LA QUE SE AGREGO EL PRODUCTO A LA LISTA',
  KEY `FK_prod_li` (`PRODUCTO_ID`),
  KEY `FK_lista_li` (`LISTA_ID`),
  CONSTRAINT `FK_lista_li` FOREIGN KEY (`LISTA_ID`) REFERENCES `t_lista_deseados` (`LISTA_ID`),
  CONSTRAINT `FK_prod_li` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `t_productos` (`PRODUCTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lista_prod`
--

LOCK TABLES `t_lista_prod` WRITE;
/*!40000 ALTER TABLE `t_lista_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_lista_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_media_productos`
--

DROP TABLE IF EXISTS `t_media_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_media_productos` (
  `MEDIA_ID` int DEFAULT NULL COMMENT 'ID DEL ELEMENTO MULTIMEDIA',
  `PRODUCTO_ID` int DEFAULT NULL COMMENT 'ID DEL PRODUCTO AL QUE SE ASIGNARA EL ELEMENTO MULTIMEDIA',
  `fecha_subida` datetime DEFAULT NULL COMMENT 'FECHA EN QUE SE SUBIO EL ELEMENTO MULTIMEDIA',
  KEY `FK_prod` (`PRODUCTO_ID`),
  KEY `FK_media` (`MEDIA_ID`),
  CONSTRAINT `FK_media` FOREIGN KEY (`MEDIA_ID`) REFERENCES `t_multimedia` (`MEDIA_ID`),
  CONSTRAINT `FK_prod` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `t_productos` (`PRODUCTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_media_productos`
--

LOCK TABLES `t_media_productos` WRITE;
/*!40000 ALTER TABLE `t_media_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_media_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_multimedia`
--

DROP TABLE IF EXISTS `t_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_multimedia` (
  `MEDIA_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO DEL ELEMENTO MULTIMEDIA',
  `media_data` longblob COMMENT 'ELEMENTO MULTIMEDIA',
  `media_type` varchar(15) DEFAULT NULL COMMENT 'TIPO DE ELEMENTO MULTIMEDIA',
  PRIMARY KEY (`MEDIA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_multimedia`
--

LOCK TABLES `t_multimedia` WRITE;
/*!40000 ALTER TABLE `t_multimedia` DISABLE KEYS */;
INSERT INTO `t_multimedia` VALUES (1,_binary '����\0JFIF\0\0\0\0\0\0���ICC_PROFILE\0\0\0�lcms\0\0mntrRGB XYZ �\0\0\0	\0\0acspMSFT\0\0\0\0sawsctrl\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-hand��\0=@��=@t,���\"�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	desc\0\0\0�\0\0\0_cprt\0\0\0\0\0wtpt\0\0\0\0\0rXYZ\0\0,\0\0\0gXYZ\0\0@\0\0\0bXYZ\0\0T\0\0\0rTRC\0\0h\0\0\0`gTRC\0\0h\0\0\0`bTRC\0\0h\0\0\0`desc\0\0\0\0\0\0\0uRGB\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0CC0\0XYZ \0\0\0\0\0\0�T\0\0\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0*\0\0\0|\0��u��N\nb���j. C$�)j.~3�9�?�FWM6Tv\\dl�uV~��,�6�����۾����e�w������\0C\0\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||���\0C\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||���\044\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��������µ1T4O�i���k@W�Xo����\0��AJ~h�t��6R�q�ZZ\0ni��b��\0���b�#��b�PqF1Rb�T\0�N4ޔ�\0JeIIV@��Q���,R��b�bR�1A���iأ��I��h�c*�����Dh�<#��X�ȷ����6��%i1Ek���K����^����rC�<�9�r�A�U�B��f��\0�Ԫ��Q�qX�ͨ��r��[Ʀ��j5��x���[�Ǹ�ڼ���Jg��x\"��(Jٸ�5%?$���n{\r\\K�������r��V\'H՛�Wc�@��*����~xd\\z�[�\"�510*�\Zd���Z��+Ң�55r=�b�ڒ=\nq�\Z�ڴ�ֱ��(�T��n)�Du!�p41IO�Q�J\0(���P�f�E\0>�f�O����+����),v�沕B�IRi��_�/,xNҴ�Ma.��%���7[@���\n��5\r�L4�t>r�\').ȸ\\pj��;�H TQ���/\\\'Q�h�z�FQW��ln�Y	�\rTu[�,,R�ܕf�+SBF8��j��|H��Ul\Z��3�ʌ6��q���6�)����~�Xx�P��K(��Mo��y4.Iʊ����9�iy]$�Z2@2�� �e��r�Tt���\0�pZ���������P@�������/���S��WB֌�;�\0��!�\0�;��V�+/B�Hӿ�lW�xo��b�\0��0��V�i�b�PE�M�1M�\06���F)�t��\r��\nv3@ъwCE�6�RSj�N�TJpisLm7�[��[�T�l�Yg����_`�:�eF��P�kT8����m�^܌����?i���g�l�DT�j�ľ��a�|�k�ʹ��V���fw-]Y��7-^mLƴ�j�K�-�6�-��\0E\\(\0T[����5�B�[F$�eFh�g��t}R�/�N�*,�D�̯�@�����(��{|�M���-TjL�T)|�v\"��[�<���U�fc�jB�;z��jL�=MW�1���2��M�\r_��\Z5i\Z�<��*�S�~��8q�V��<�	KM�- ~h4�Z`?L���\0�\\�W�\Z	�k*E78��bk\'P�`�\\��7j�U!Lt�9&TU��W+��p�$����{��3�%��:�T{�Y�i�Z��b9���p�c��\'�d��_�M˲��.e��H\0��]��+2&0��)h\'}��o�4�h\'gܿ���G���M+CVuޠ���.ʘ�$Dg[��s^����Y�S��K��t��׮i�ۨq��uB����Uym�+h�^e�nf���N���a��`6�\Z_��`C���+ZP	�f�����]D�z��JC0���[�n<�#b���C2�`dV��p�2�g�Q�-��VeE�q��U�-�ME���n9��(������2�c`9�����Y�/J*q�_�m;��-ll�����׺־�c�|\'�8���1F)p�a���b��LPq�n*B\Z�f)s\0;�S�y�ݍL�1*l��g�[05G�0�ڕ�A�n*/ڍ�*��\"��n(����n9�yA�3b��6��Q2ǰ��K�	n�^�^n\'J��a2�ՎF;��n�n»9ėG����ڪ�T�۹���泗�}f#���m,��B�V�r�g\"�Z��#�(`�D��ƣʚfi+>c�4�M�o^�����c���G0��)�I�)���E(�S��p4�Ph&[4��{RT:�)3�uXf�KVg\"@Z�ʑ���sG1���k���j��VEI�\rZF��R�K9��<�ˌ�S!�kh��>Y���I��Zi,*��O(�P�\"ĭ#p�Z��\Z��\0\\�j��-ЕZ�ZS�z<w�W���k�)�� ���\rgw{��#i�cezZu��D�0b�Z��)�Ѧ`x�[�D&+v�eb�vq[ĭ)��\rKi�뉵yY�\"�\"�%��@�hW�� 1�џE�.d!���P>�vvVO����+���5Kd|�^W�����#p+\Z��lqY�Ρ9R��W����_�,�	���-�Òp��	]12!��Jq,���=ِ�^��`��L��+Ǵ�q���o��5v�����V:���]���K��\Z]�:���goJ��!��THk���ặR�H�\n�&fv��^Em�3W�YD֚,� ��!mKĆb0�����r�V2�gn�sq4�l���v�s��ѡ��F(_�e`K,�e��y��iUx�pf����\0�U���SA�&ӿ��kZ���N�\0�u�LW�o�������F(�nrlSMآ�-\03&i��P��i��T�S���foL�)�X��afٶ�.%nxZƥxS:)НC=����ur�m�CXw:T�q����ґ�L$�ڌ�Էӥ~Xb��[K��	9L��Gz�Ӵ�������ޗ�f)-�+����TW���?��K��,4�-=r�/Z.T�<�Q��������>�\r��F-HM2���B1�њ�4�\Z��Ҋm;4} ���$p�KMi��\n(�\n\0p�8��ֈ�:�t��N��1�F1N�EY�--P@��i��h(��@Hp4�e�������	��4�EF*L�PaR�[\\�����a���O�N�i�����O�dnƼ��>eG��e{�XT��}�f���,���7;��C��V��z�m��%&	�a5�ivʐ��^}J�ĭ����݆Z�K���!-���l��M�\n_��\\<���]��㑱����Y01-a��,����8���d���81�J�,�k��=*c�IwN�e��1ʫWI����!��kJu�r6L�X�/��� A��r�f�\0g$���@IH�\0�7W�Km>���s��t�t���8�\\�_M��)|�\"!����N���#�����N|�a]և�8IfC��&�����ʕ��ߨ��NUV��#h�1���<��kQZZ,���B�k[Ou�K�W�R��ʹy��3\nǚb\'ТF�%,�[� �`���U�82�c�5����{�~�?\"2�\"Ό[$:RE��Uɮ[tK�\n�\"Z��s3�\n�J�+۔}JVc�Ut�-yy�h��R 1Etr�O�\0�N�\0�z��d��$�w�{�k�X����Q1IRb�V��5%;�T�0�Sz��F)��*X�i�b�M4�t��Y^��5�`va�sL��4t�T���PUF�`u�eZ���*ԙ�Xj�~cN�i5v[����@�2�9&���IP��C�v;B��ѴӒ�H�®����6I�5�l\\�[	�@t�U�搖��͕I���P�G�Fj3M�A�I�ni�����-0QP�E%-X���RP��-D:��L�u�\0H(�J);� u<�)������ p�KE-Y{5H)��Ҁ�QI@H}-%(�!�QE�:�JSҬD�jp|T4��%���9o{�Q\\��������V��Ar�ELH��^�����%��\n�9\'oE\"�c�������U�ih�f���\0y�͕2�T��O�2e�z�$�K��\0��5�ӗ%�k��~��B$�bl�шHܒ�t�t�}��\0}�\rq��]�~Y<���k�\ZN� =5�qgq�B�-��g��1�;��29NQb�	����TWC���+����,�W�Rm��ٳ^����/|�������̊kJؽ���:�+�\\3iV�V�[mB�-�a�y���Tꌽâ��i�+�ʴ�ꘉN�,��\rϖ5���O}�`�����3�M>�+$�5���dji��m�\"�!����k�x���9��W7\rka8�Y�M���?*�+SCP�\"���^9r�_��9z�ewk;ٜ�3�\rp�=���Qy��R�������tM;��ֵ�Uo�)��&:��[�O��z�\Z�&���\'\r9U2�6*�F\"c��X�\'<pU��cM�a\"-� �M��h�.�_R�H#�aElA�\\8�+[O��F��Mu�\\�+��6d��`}X�5��\'�0��ϵ���g�����vG\r��h}��{��5��;�lZ1�k�|�u.y��5�ol�v#q����Ye�I-���V=����cQM&�My�����9�QL�14����aE�\0}-���Q@���!ÃIKݩ*�p�*!֥�f�֛N��N�f��Ji)z�H��v���A���GO�@��)��¬�i)GZC���R昇�H)h$N��J^���V!��⣧f�Dǉ|7�o�e��e=���FשVF��}��C��D��4;��ټ���4})5]Vk��%ko�7im��n��O���c�\\t}ٙH�$�:|\'�U�qg���-Q���ζ%��H(�e���7!#ɯRG)�\\\\;�;a��ƾ}�?#�^�X\\[#F\'�\\��[Kf���Y�\0������54��[u-qus?dVAX`K[�9el\Z��/�l��>v�����{�/\r]�����8R���1���D��J��UuE�?0������?V-^~.<���\\X�� !k��#�ֹc�=t~)|ۈ����m��B&��c���7Ť T³3��^б�\0����,Z}���5�lkUNr��tD�Dx���Ҿh�	;/_ۯ���-�8�J�\\����W���wI�p�eZ�q-�^_�KX�\Z�Л����8=�BewaY6���2�S[Β���5��5�#��g�ϜpG^�S��.-[2���x��9s[Q�։�L5#�ҵ[�0�]�EQ^o<�7i4Rp��\Z~��v�*�����S�*���I<Ak.�\\��<�������u*�X�n[��Z�l�i����*0r�j�\r�6I��Ni�Q���G�Q��\0�G�Z*N�Q\r6�4�&ih���I�Z\0vh(\n\0��(���f�)ث3T��}30�\nm���M�N(\"AN�ӅQ�\ZQ֊��e>�H:��\n�E�����Pi�ILAJ:RRf�	(�:P��M�:�g�sQӳ@J\'#��1�[ǖ�a�z�ͥ����Gi\\z��CK]\'�)#dZ^62�����8j��]⹴�D�v�\r���E2K&|���\0����3��E�#��WW���\r�W��OW�h�la�V�]��p��\\�\0�ų\n�����8+H�����eU�R}��`O5������p0͌�te�L�-�{Ȍ,Z���V�Ajw�j��\nUMF����VHN��ׇ��z�c��=�6�쵡������k��ѥ����D�_9\n����t��)��7��\n�̼����]���;�,Շ��n�6��L�ag�f�ԓ7B����NM�֩���+��Թ��A�K[�;F¦��DLB��2����N�yN�鲪	P7&�˘ۊ�)�!�j��lf*s��q��ĥy戌t��+ֶ����ٍ��-c�Lf��%-]�*�թ�@�a:���\"���+��56*��s����=���䜠�[��<�Xiʩ�g�o�ò�Hid�<���y5�sL��d��I��c��3II��Ah��h�\0�4Q@\0��wj\0QҜ*:p�C�O�w��!3STT�ޝL���3$��֜:S��QT�	�zu6�ڂ\n)����:��)(� \\�E- ��u�P!�&i(��i����f��i�\0�\nJ)�\\��Q@�sT5=>\rBѠ�7}��W)m��T�|��H�Q���S�W]�/�\0�Wg�A�CǇJ��]\"�+Q���:�S��ȡ�j���\"D�5�:s_��BI^\Z�i|-�m���?���S\r9~���+#�Î�T��NВĖ��<��˚��B^���qp�*�\Zq9�3sjV���\"ya��{��x�Z3�_��Lcֻ_�L-Vv�^��G�Lꌽ��c�L���HC̬q��^(��l��fg�7wn����h�yz�Xj�&8�R���_���/�ʆ�:���bFqSi�E�L�����`�e�;�n��6h�:N\0_�c�Q^��ӈ�>�\\����Aӎ:��jܶM�*φ�Q��/Qk_�=�R��NrDh����#p!f��*UbZʑ���\"FF�ٕ9�ЂE`R\\G��\"��[����7{��j֞�ۅzΒ�u80�r�[\\�K:C���\0�����i��g$&d�-�6��y�����^�#��ך\\����@��\'\"��(&�������FsEA�QQќPY%6�i٤����(�wj�\Zu��e;5bR\ne(���R��:ө���!A�S)0$�m�$h��P@��($\\�ޒ�P@�)����8���4\0�)�P@�}F)j�(���~iw�����-FZ��LD��%��R]�ܶi���\\��^�d\Z��fK�8ʎ�������k��/&�19�D��|��0~Z݌Au\"������H�V��mY�$�&����\Z��\r��\rCP��T���J�xW��<����*�D���O#����^	XgL�\"\Zι��Lz�{*�<��S�\'��x�B0@>Z����!8Vt˄(��Z���$Z]�nɀk߭���>S���Nb�PU����!��(_��\\�3�:�姙Q����G�g�З4R���Ҋ�b�f���69�\\N4�9Y0�B��[,HC�����:?�z�[S�`0q����s71 �uGd�En��9�ԙPb��P��QpEA%���Z�+�lQ���Ӛ�B�H��j[Ő6�I�Vn~g����z\\jd\r�ɭ\r({�;�.�lt�x��ۼԎ�4��\0v���s�\Z�Q�sFjN�Q�Ty�4\Z�QQ��J)��4\0�QM�њb$��N������ӳM�-04�qM���Jvi��f�\0�p5-2	���Fj�IFi��:�$��*,���q��l�9�g���Ys�lL�R�;N�6���H��#U��z|�\0����ъ.i٦gP�Ze�����Lњ�4f�$ɣ5h����晚iuUbO���	r�g4��Y�����[49e�k��A��X�[�\\T�j	�O�+�-N��C�7����1�i���Rhn�s]��s�כ^\'��Z�F0����2w�<O��Gy>NEs\Z�YEM(��ǽV�r����˔��*�Z�����_�D�,��jT���y����eh�;_�+Zz���c,���_IZ_�>N�\\I�r��6�<V����̝�pƺ�0(T$���O��6[���7���Ey��i��\\�h\ZJw-k�*�W7��:V��ո�U��?���L�^���䚳lU�Ҩ�f���\\�R<Lr\Z�P�W�7s��T^cDuW*�3Q\\�\n�5�buV�.BK+�D�s��/@�YK+�]��F[�s��~�6��������՗sJdnsPN/����A���h��4��E���\0Z)(����	(��hLӪ\Zvh7z)��KL�;4��g\"�4�\\�!�����S�V\"JZ�4��H�)2��LB��ꎊ�	2)��3�b�^#�����e�W�{vi����2S��S0�L���T���6�{ףiS	�}V��|\r��`�Ox�y��{d��1���8e�b{����ތ�r+P>FA��b�x�(H#�5�g��fԀ\',��\n�S�G}�Q��{o�o�Om�譼k�O�ʚ��G������p�i�֐�r�\Z��f���h�GFWv3Lؓ4ܩ4�֡2\"�ZLK�Ϛ�.k����n2�5�^x��o�d�r�ʴD��(W|�kͼK��e{[G�z��W��1U좲��繑R 噗��4�yV����	<��D��p�*�|1���w�+]@8�C��fI�p,j\ZvqY�r���^�7��R�F�60�k�Hʞ �Ϻ�XkW0�\nZ��D�ٽ_%��k[�}�0,���GI�#�\rY҉� ��D8�Y��̢�ܜ�&�DW�Pkԡ�8������8�z���|���V��cO�Ǖap��+^係|����b�����є�nrՁl2�&�]:�iA�8j��I�t�lr����Ey�Y��H�L����0��ю4���O�ff�^���4c\nZ�r�:�pU�O*\0�kS���Hց��YrM��C�Ҫlcn�9,{B�5��S����\Z�\\�2���f�u��vۃ^{�Hɹ���0���d9e����d.j:y+���ILvh�G�3H�Lњ�4f�EE�3A\\��9�5h�9G�M���Z*:}\r:��RLӪӁ�fMEG�2��f�-IFh����3V�ڤ����\\�Q��$�4f��;5bO��;~(#�\\�$�)��D`}E;4f�1�������&��W����PL\\45�;�����q`�e���8k�<�*y#�0����T������a��Z�����wR�{�w�\rI���^6�I��Js�&kJu:38�o�v�!7%�uB+���ϵ��8�K-p�?�6�+^�gi��P�8Z�Ge:uN3ƺ��[�m!P�_�RꚌ헻���׹�\Z=��n#��X�d�$\"����F��?19$��I�`k�-�-�[��\0s�kƵH��������Z��Ei�sLp�+��N���I���\0쬦����Y��F�T��i����w�搚mq��b<��4�vht+��ψ6ao��Tgz����-\\��m��)%�\0�R�uLO\"!���;��+�T����Y�McL�[�QD\\%[p��̕�ץ�91?�\ZS�ZK�\n��L��赕�#�bxjM}�l掽����\'���y��\n87e�5�Gn�k���yC�|�$��_Д�?�E�+�6<�KyF�c��@�e���s]w������F2mֺ1�۶�蘪��<�fyjK;�8����YO�~�z�Ɵan�xP�Qh��ɕ�McIQ��p.b�F�Ҳe�d8�R��C�F�Vlv���W�Q�m�G��)��\'ye��CN����N�� 0�PHZ����˩��\ZM34��қY��bIEGFh4$4�nZ��D�isI�3AC���LR�J($�4ꎊM�}A��5fc�O�sN���杚I��;5h�G)&h�G�u�I�KQf�����N�\0?4ܵ&h����94���!���Y�4���<A�������r�����21�O�Ͳ����8��Q��c�\Zυ��&2dF��m�t������jyR,�����F�-z檖��Z�0�R�y�J�Xe����8��FZ��Ӕ�4nj�4f�\\����i�5��Q��^��j�ݴP�S e5q�s֣���g`�7���<^F�ivJ̶�ޑm8�a�WC�-T����L��)��;\"<�f��.h`j���h����3հjs�ŎY�q�b|�\0e#��Z��2����%���U8V���gf2汉���ءk&A��z5k::-Q��wa�O�z�Ylmꮧ\"�m+�Y�0����ګ���c�׹/��;G�����k�ѧX��s1\\�[���H� �v����킊����\\|���G಍���ߤ]aFM��+μp�X�Ì4^�pǌ�+���M� ��**jM?[��\0v��0�`#�V�����L��W)2�\"��>�����-�J�����V����Q7e�[F%R�R=��hm\"RrBU9\n�N[ɋ�Vi���0ܑ�G�3��G��ӏO�y�����1r�鲀�l��i�V�P�$��(�:H����Ijϔ�(H�5%BS�HӔ�4TtP�Q�LD٧Ty�P!���抲I)j:vqK�C��(��@,h�3%�4�ӳLC�Fi����G椨�FM$�;5Z���&��y��f��6���&�jL�\"LѾ���(��Fi�ZL���3M�(޴�<\ZL�y���p�4�j�Sr�@f��%��	3K����PW)&y��d�|٨��&p*�V��5D\Z��~����x��-��Х�o�l�(����B,\Z��f�Eh��9��3�m���V0�\0_��{��f�~a5wa�7���f��$��j���Ir����\\G����ƛr=^��s��h�?X<����Z�MFu�Hzɝ�MV��z�>�Pڋ��ǽ�(λ�\Z��:m�`2\"Z���\\�r�\0�yޝ���.�*Hw4���]�������k͔��G�M�4����k��JKt̄�\'�\'��\0��b�/����3ϭ�-O�K��o{�$<z˹�v�3\\弮ukl>r��N����ϡ�73 ��+�^���H�9��h/U�}�\ZS��Ss�L�\Zx晧(�*m�6=)�T�q\\�Ŵ�>:%v�\\Uk�u�TԦiG�q��ӳD����,�{T�s@�4f���Ii�j��\Z\0��*<Ө �-FZ��I���)s��4�?*\rIQf���I)3FV��.c>Q٧f��-1�;5i٠њfTQ�MEG�Zd��;5.hL��h�9I3M�74f���3M��9��yR%g�ܚ���c�۶�jo�\"�}5�<pɃ޺�������#��q�ښ�/�n9�l+�Hn����tF�>X��v|s��x��\0��jN�D�����A=���i�5u�?�l�6��bJ�$[��\0\n�<)�ޛԝ�+:���a�VG��Ɨ4�6sEr�I(�蠒J�5_5&h@V���u�5Hu��mܼS��^>��~0��P{�f�Z��7�ھ�����*F^A��<o�+�&cs	/l�^����%�L\Z��4�)����b� OV��4}����\0����j\rr|i�Z��6�`I�u�f�˹-ڽ��>_��yĎ�#��@�60�{Ӊe^\rC�\"Y6(�ī�*K=3ÒD4=;<7���RV��z0�oɍK�g�Z�Kw۔�����O\nR�8�%��Lk��{VM�¼���x\"�k���m������Z���������&�x���\n�|=�ˬj0�*\r��澆�\"��jF�\0��c�˰D��Xb�%��\nj��X\n��\n�\nD�S��@���sȐ\n1�8S���R�|D����kѧE#�j��]Ǳ�z穂�U��A�;9�3ԉ&iP�3@5e�i٪��g\"���QN�\0>��nh�1QQӪ��IN�G��nZdf��y�r���4�њ��%�3Qf�@r��ڍ���Rl��y�*M�f���3@����4u2�89�}\08�F �-χ����d��h�\rk\Z��\n�\"|���Q��w�J�򦝕�i\Z�?R�ŏi���V��~�g�j��sS*��R3`���X:[%ia@IEO1�:�%&Z����͇�f�K�J*:x5dH�*��mتC�[���Q9k��a���������e�\Z��1��O&Tϖ<O�\\h\Z��\"2�G=ֹĸ�q�̼���3�����͔���k�?���0eB+�\r��xx�|��a��V�\r�Z��0��ݖi���rZ�Ŏ��2-{U�\0�|����\"(v�g��,EF�j�{���|g���)�\rEi�Pu��]t-;����kgͷ<4u���\Z�e|��5H���OC$���7jż��S���mn�s��mN��s�H��T���4�?�|h��8��r�49���S�0�9`2���(�v%NF�0�1��)���?�3)�0S����SX\Z���	5���N.\rMCJ.Q�晣5f�/\"��U�y�>����sN��晩>jL�Uz�4�\Z���٧g4|��f���&��0S�@�E�S�M�.V���G�3@�I3N�GZuY$��T9��I�3M��$�ѕ;4�:�nh�����4�.i��(RJ)��4�;8�4�њc$�RRf�I�Ze��TC�>���SsKL�i���HD�W�	W`�1�bqT.��=P�)�JӘ�ؚa� �_9��H]7_|p��Ȟ�^�$Z�> ٭ƙo:���*�F\ZP�<<ڏ�N^���� �:=��ͥ��カ���D��,h��j��W��O���xёT���Zɐ2�E�W�.IOH��Eby�E���xz9����u�x�r�\0`�j���R���� Z��\'��\0v�����>b�	_���\r[�\r�L,����H�rkЭ�h,�a�Za�c\'��2�9�5<Q��O��>Xf����\n�L�Ҧܵ\05/z�� �O�Qf�\r>c`x�9�I��8��C��d�)	�ܵ����ȰP+��k��c�n�p�+���a$M��P�^��j�|ӳQf���\Z�\Z�=;z���?,AReH����AQb�5&���bjLՈZ}G�(�>��3L��f��4\0�}2�IFj:( �4ꆝ��S�Q�����E\0:��h�P\r6��	7�)�����SsN�\0���\0��4�њ\0}<\Zh�\nfR$��U�p�Z1�:��1Z	1OqTC�<=g�o\Ze�%6���9c�nQ�@���V���Rʍ�UsL��Jp�\'/%�\n��~�-��n]m���{���/|Fฎg�Շ��<ӡ�����)�����ǭj�6�}	F��]�ʭx~���\0gݲ+��|������7��7�cT�{�]��t�3Ԧr�(�cj+��\Z���v:��Lf�kh�8���-��fzu���ӎ7��֌��\n�}�����g��C�\0�v�5�Got$B�W[#�嫣}VCL�i٪��P����=�t�Nj�|T�,�]j@j�u��Z��Ky�z���Y>̟}4�@_�7�W�%�Qj��Qj\n�1�\rp���q(���m�WT�Vl��;��}4��+#��5&j���+K��\Z�,(.#�p5ihc4��5%@ǃRf���\0<њnsK@R棣4%;5sK@��Tt�Ջ�u����CL������M��E6�֬	(��A��Ӫ:u\0:�(���Si�\0R�N���\08�(���Ҥ*1Ҥ)D�D���r�*���e�t����i��櫊��:�pj����\0c\\�I�d�[�x�PUŒ>\\.��6��H���J౎`��<=ueo��覴��B��.��2������(r�up\Z��s�eS�-���f]0��<(�!fBG�I�vISmw�~���0Ͼ*cT�X�S�?����4��ߢ���?]<��wr�����u���늣�ĵ����FN-ֵ^�܎�L�R	r,�7��9��K<�\\�W#�E4R)��^��\\����\0\n��>��Y���\"�o�� �A��>��G\\u���X������T���0����5i�c*%�\02�2�y�y�d�\"�v���U�ţ�j	�e�X�9���nh*4�	Ȭ]\\f4>�Z�j�Ԇm�HڜNz�m��;56j��3@�i���\r�f�MEO�AC�N�N��T��Cޝ�\0��4���f��)3I�P8��٠RR�\0}&i���yE�;4�L�2L�.i���@�(�������C��QE2�(��ꏽI@�S��)���QӪ�uQ@Hx����P(1r�!z������T��JF�i��Ri�QU�L��KpLI�ץN�.\ZYOJ�-gQ�}h���\0��v\Z����+�.NgW��_p�\\��ZM����j��s��\0��s��U��HB~�:�=��e/|������o�	��G�Aq\"�.EGip�g������2,�~�a���_���WG���)���4�qn��Er��pz����n��/F��|�>�v&���^I�+r��Ax�wb�c��n�Ei@�2�veo3y���hf�9l�Y���h�b\\�$ný\\�F��&�u�<ITRJ�=r�Ĕo��ӳL�T����3EY�)6i٨�Fi�)&j����\0�Ul�����1�\0z�$���sE#q��u�P)��P���S�PjH:S�Q��\0-;�6�ހ�\Z�i٠	3N�G�u�Q�S(���R��E&sV!ih�@�f�QӳA�3M��f�IK@�QM�:�E6�(AE6��!�QFj�\r:��u\"J��H��Z��-^VXDC�EIr�}|L)��K����Z�K��*���rʹ�[:�N���[��7j�u\rev�M��~��ۼGx��x� ���ߓ&�0򄏛��Ӭ6[�e�5�Op��5Fef| �[���J���<�8Q٫��Hr-J���V��EQy\'*�gˀ�Ho۲Q��\'+��s��<��\\x��Bǘ��O��0S�k��Ӯ���@����$��ZK�W#4V�?�h�S�R(�t3�N��hުε���N@���?)�d~\n�@�D�ofli�(��ֺ�,+�`�6��k���8%\'�\Z�JR�rt\\�f�����d�6�V}V	@[���t|Pz�4�-V�Y�%YCL�%�+N�*�z�9�@���;5fd����-�V^�\"�AZY�sײ���AS4f��Z���m�\n���RP�;4�Ҋ��KO��H\r%������;58P�Rv��Z��c�AjJ(���S�JL�(�@��-2�@�6���\0�R欞Q�S)�-:�\n:�ө��\0;4v�Ԕ6�)��)�p�O4�֥�UD�(F�Wǅ��x�S�ҩ��L�G�SM�+T���^�T����5ǉ�>5�Ϝ7ޯj>�q��S}���(7?�W�|�J�	�`�2VN�sxS)\n8�\rm}�.�G��emN�)�dyv���eyq+ڃ��>�v��\'�e�L%n�=6UɆ<���F���Nj�nc��$�b{yUJ`欈�uJ���.cKtQإ	p���6;\nϖJ��ʫ]�<P��������}�|%��#P�U�I*�L��<�k��0�\0Ğ�����g�I��[�{3��IXY\0��m��B�\"SU4�\'M+I�m��U���8#\r]�r�4�8SW\",�ǽZ�N�\0����˂p���N�Y���:��r�ᠸ19�zV��w�Z9M�ם2��Y:��[\\\r�(j�w0J�A�W)�l|9=�Z2�eqYi\'�:IRz��4�j���g	1SoaH�X\Z�5DJƞ$��hwӳY��R�Ir�ޙ���w��E�Yjo�@$Ӫ����e>�eL\r;55(�,*j�5 4u<\Ze 4\Z3N�*sR\Z\0vi⡩3H	(����	�٨sRP�sM���å-74�L�J( ��L�:P����)i��}\'zm;�Y\0*J�4�&j1֝A�N���rP!Ú���,,噺�Քۜ�^O�m��xQ�m�ބO���|��9\rf��%��L���H��{�!�^gq�0&��Y�7�H�o��8�Ð�\\L�Rgrg��\'�Q��AS�>L6W���\\�fx�G�jx)N6v��i�d���r��6���Cp����Y]A9Z��:\"��x�;̀����r)�NM�Z���%�!k��g#j1� �y��7!kczr\Z�$�����0��\'�l�5�S�z��_iJ+��u��+�����W^�a.��R�CE6T��h�cA���J�3@�Vt�������v�w�\\���`�\Z��,l3�T!��jg^J��(��r���;u/���yn��\n!��A�{l�i�;���۳F������+ɬ;�|�ѫ�!������,�իo\\̨\Z��wR��H�6������<l�v��\n��C���2x�Z`<�\'rMq��	��X��ӡ��P��7\":�e+�ú��Xkr!��v�b:���OJ��э^B�,i��!�2��)�QVXQE.h�QI��)��Y��\n\0�95&jӨ,�\Z^�L�)��\\G�Sej�5-\"�S鹣4p5.j�I�\0���e.hLӪ:p9�����t�P1�QE-�(��S�\0-?4�(����-X���LњdH\\ө)r1åH����=���g	��A@F��<Y������9f��^K-��\'�mN�+��͚���p\\$�=(�9O\'1��P�,�/�V8��̼��W�V�ش�xa M.�s�G��H^�oe���[�nB��F��T�����gO�8���1T	���+�n��;����N��W��5�ʏ�xu�Ǟ�x����rj���x��J�`�<A��7_�Z�~��euj��a��Lh�Z�Ž��i[elY޾0�;9��N�2��6�\Z�4\rB�5�mk�*P�F���������8\0��B�\0f@�7��ZD�~]�땜\\_>#f��N�R�8Fu��3V9y�8Hݫ�:U���^M�늽a��/ܴǾ(�*&U�3�T<�f���[_�QG�`O�<�G��G�4lu[U�0\\C�Z��pE�\0F���q�y���Wj��)ԁQyY��p�0{TBJb+�6ȅMbj��\n��i]���4cy���\n�a#R0�)$V�fYFkzG]�+�����uS3(�(%\n��HԊ�:*U�;0XI֙w{61��Z����Q���q��!N���Wm5�R�7��*+c��P�:��q45��kq��\n�p�8���冁�EQ\\Z��CjӃ]�p�\Z���a��4�k.-V�^	\nMhS� ��IIKGz�>Y��T��v�\0;4�梧�$�L\rC��-@�\n~j jJA�IK�ڌu�\nO�Qӳ@�L��	(\ZJQ@Q���\n�X�}GE�>cL���4�斀$���vi�ߗ4�c\np�Ӏ�&B��Ss���uX�!c��aA1�1.���g27��W72�NerI4ۋ���)���j�[\r��B�v\"�� �X���2��\r��;Ff���VqF*��±��zܣG��~%�(\n\\�95�V׏�9d=Ev���O Z�����l�����˖3�.%���;ڋ�:7�3L��C�+����)�F����:���;mO|�7,�\'�� {�᝶O�V��E�~��P�|���f#n�J>�-��@�P�7cYʼ�5�ۅ�K�@�UZָ;-�(^�⸤��<V�~%�a��8��5�g�Y�,�w�.	��Y�J��U��H�_���w�4���MO4$���o�*��t��IEg��D���G�tO��K��x	�����3D�\0�덼*�r�s����OT�.�ET�\0��(vBȥk�&)�\"�2�<�EaM���i�U;�<�DLdR�``\Z���\'��ݐ�<+�ː+�<��T)N��H㍛�T�Zĸ�[�=��U%~kͭX��.�8s�桧�Ed{CjJh�S\0��\r\"�S�M�PX�S�s<-�z�\n�����F�Z�f����Q����(�C9a���a�хj⣻���\\քZ���h�i\Z�=L1��¤��ֱ��-߾+B9�EW1�*3\'�jfT�\\�Q<�&i����N�iMKL�;4?4�4��X꒢��\"�s��\n�4�4Tt�⁒PTy�H(,���y�f�	3N��Ph�����!�E-3�Zv(�vV��*D��B��X�;6a�Ϲ����޵��U�������,��1�ƪobr�9��e#��.RL�zR�L�8\Z�쌉jJ�955�\nZJZ$\06�SE+��Tb�)��É�CY��qgt�b��KV-%p(YyZַ��P��w�Yӏ�~{�d~�|�/Ǭ�6�M���\0����W�j��[�ٚ�B1��b�\Z2��V=s��$��g���1漏c�?Z�g\Z���3��z�h�*|����R����6�Ҥ�+1\\T�,�`ké#�R�J�h���g��QY�By�`xj�υ4�C���I\"Dg	�f��y�Ks�=�FM��O��g���U���ya�u\"}di�@�d�ێH����>�gl�T\r>ϼ�U���OՏ02���?*��hӬ�k7�2Ȝ��?ʶ�,1�aG����5���f�&�.=���@�R�D���q^�5� ��|5S���VD�����¨��^�}��?�R:m8���jb:�)�\0�vj<�L��R�L�8h6%&)�3VQ2je#��9�b�t@Ƭl�|�Dh�8�a�\n��&j�u��`Q�(w�i�6�Z��T\"��W��ZĠa�uc�)FF>�\']�n��:?G�T���r���Ca�*jJ����Uæ@�{}B�a��j��:�y���i�i�aVdK���DI��h �4��)E�R�3I@f�\r0S���h��4�4TylQ@S����U/5;$-<�{P#C��d�:ݝ���=��mWŲ��;_�MrRN���&ޣ�]�/˕N�Y`�\0�<\Z��a\nx5���Ƴ6,�i«�SA�dJ\rI��\Z~h6�58sQԂ�4\np\n�\n�@�n����?*�I�5��q��NA�D%�8�ETӼ	-�\"GI.���OU�W9C�ez�e\0�W���+a����g-c�#�ynW�35��]����j����W�.)�#͖�Ι:`@\r�j��a��ᾉ^��ъ�Y���\0��y��?�������?Eۅg@��\0\"���\0^k]Er���y�ug�\0m�wS\nu4S���4����U	��܈-�F���̛��޽��3�:T�8&�FC��5�Y,O��i{��A�D`U�H��S=��sM�)��V�!�i����ZZe.(R@jxњ�ؚۊ���P�V�ٍhGn���=�%c)�:|��QNآ�KY��)�QG0�J��d�+B��b9LY-�T^[\n�!MDbSU�O�1q�GC��m깈��}��iAaҐ��n3�9����e��~V�a\"8]��J����Y�sֶ�#��:|њ��f�<�\\њ�5&h,~ij:\\��`(�G�\Z7��4���n���[����k�Śl9�v@Ϋ\n{\Z�w��Z������,�g�#_c\\��O;n���Q�u���9��0;��*��{�7J�;UL{ӻ�4#���;=�>��₹�Aj��px�H�ȳ�������2-%<\Z�\rH\r�-��S�U���`j\r�\"�sS�U�����tD�u�j V���.*L`)����a\"��vFV�����]��VqI^0+мs�xOf���(���gXw��@ӻPE�2�ϑ�(���(����w����y�t���;�\nh���W�f���Lb�m�\Z78�TNkZ�e�ۜEc�W��]��eߨ�g�W ��)��H��<�J\Z�z��sU�ޤvT��j*Ri�kC>a�S)s���ݚ�y��n�խJ���vЦ:�E^j�q�0z���D��\Z�5P\Z�R;\"O�}G�\\�I(����PN�6��p��\Z��6��1Sn��=�\n��7�\'���)>a��+JKu<�)#d5Q��ZgOeq�B��W�_��Y@���Xrnk��C��~��fޠ�Aux�x���l���Y���ӹϩ�9�k�$�,�^d_|�d�$���!o�V����`�A�\r/��T�j�?���DQ�Ձw�Jn�¹]�N[��ywwl�&���j:3@N�Q��&h��Frh+��4g4�ZI�\np-����|����YSFiA�Aj��RA�A�������FE��J�j`k3�2-VV���6��)ަ\\T��H�8�k�𓨺�k�C]7��W�c��x�>jG��S�{�S��w��G�\rY�{���\Zq�𲌉��Ozv���<���4P����\0^q�I\\߃��Tѿ��k���Ϳߪ��\0�Q^Y��������|b�����r�i\rv4�k]VR������B˥���!�r�8�*bj^�dm\"3M�����m���-Q��U��P��t\"Y�j�9_4�ⱑ�D����ޫf���1l\Z�\Z�\rL�����J\rV��bZp��Z\n%��6������\n(��\n(��@�f�xѸ5`����5��x�����Y�b��mNvjx�\n@�:��L�|�2�����ȹ���<�}�_z�W�c�\Z��SO3<ny.XM�^�>�e?ހ\nǸ�չϓ!Z��kVX�����\Z�NP���4��NZ����iH�5HwӲƠ!����j��5K �;+U�Ɨ,�j��=�c4��@\r;4ʌ�U|ԛ�,��TY�@��v�A�3H�Ȕt�Z���EA�dX��f���2-��=V�J��\"�8� �S�CHꌋ�Ԩj�-V�\r�\"���6��U �\0jݞ暼�_\'�8q�9���q���Խ�Ú�jp+�kҁ�2��6��n��ݶ��n���G=i�G.~�.����~�Ed���ܢ���y`[�w����y�]6k��w����z�t��f���6���`���A�9���Dj��9���O3\'߆�1ʞA���bIc(� ��� ӥӵ�)�/����qp�k[��&��,Fj<⾪\'�jLQ�Ӂ�DO⭃U��N���D��3UsRf�茉��~p*�i���i�Njpj�584A�����Cґ�N�m\rK��\rH\rI��sP�Rg\0�Z@ihR�����eQV0�~ii\r�2���C���4��v�y������F����;���߶&h�S�N�*��20��)\"��Q��ט��S�Z��B��/�����k��F+h�ke3�����oY2hW�p!-��x�#5�O1�Q�y��a�q���ҽxĬ0Q��I�iҎm���uS�`i\Z�u�<W{\'��X|�ⳤ���!�\"�#��m\Z�*\r;85�.��!lC�qY�Z\\ ��q��8�E{B=�(vz��g�j��ږ�Ӄ�f��U�i\Z���S�Z���$Z���B�58+TD�(��:)�/��e\rg�	\"���5K��Jj��N�W<�@�o�T+�Ιm�f�[<�AU��$T+���<�^/��q�����C����G�tve+��(F\0�\"�FS]\r��W��*�3��R�������g2����U�?��k��o��\0�*�����W����8�6�3N�(������eY��^{�u+G*10�+��5�]�^�:5OG|�sm=��)AVZ�9�^���V��\'��庆�qa&8����,l*�k2� ۚ��P�\05z���E:���Ua*��<:�;#P��vj��2�Ŝ��ejӳAd������Ԡ�5��`���Pi��3hȶ�pZ�����PuFEژ\Z�\n�����2-�RU`�%�S�Pӳ�@�3IM��\0�ޛ�ni\0�6�-9ȢCN�����gr�}&+�>4h>��杊0�\0�R����\0n�.)�����^ƌ-���1�u��&X�Tn�X�ⴎ&`R������>MN~��>���1��8���ʟ	�}��M>\n�+�\'��`(�nMm�e{S��t=J԰hC{�Q1N����Ӥ���{�>ě�J觚F��!%�cz�$��o^� �t@*d��h�}d�T.N=i�iڌ턁��Et7vʇp�-2��ly���ajK��r�FD���w�I��c�#��叜�e��X\"����j@T�Ǟ��S`0Ԩ��q[�\Zܷ�C\\u+�F<Qf���aڶm��+Im�G�ڕ�ybL�5��z+#?����\0�WD�\0�5����ȩ��\0לu�W���U<�aE:�^Q�RR�VRx؊�����<�V=�5mBG^\Z��\\@°�-uet�{�]e�mXR��I�{\r_ٝǜ�l�@}�\\�͝��$n1�^� �S��*�tW�a��P�\0p3�~\n��<5�0��^iw�����R��GU:�A#Ry�j�X�3�ꌡ#�5˛���Z���VuF�w8�S�Y�L��F�Tj�|ʘ=RS]���\Z��|��QT�a\"�GDjwԡ�50|�m\Z���.�\0���x�R�6�B�u�oZ�����f��-��o3��J\n�/N��%�?2�ʤ��ZV�솲�;�D��\0\0�/P�|Ҹ�QRQ�����#�S�Rb�)ا젊D��qF(,Q��I�\"�&\Z��G�Q�8j]�8�i��e-O�n�\\�+�;eM�v��.R��U��	���F�-S�Qt}��+>���x	S�ja�W<��ԀDʎ�q�R������Y�����mU*�,Ξ-�f�c�o6\ru�l�0�.tiەJ>�As4�հ+N�O�<�U�{\rȮ�+e�+ǯ[�g=I�\Zs�[�2�U�H��8�V�� �X�=*%��_��������IʴƄ�E�!�)p(��$�|�\0\"���\0^q�M\\߃��S��\0��k��[6�\0~�gO�M��^Q��JZL�T1Ue�\Z�L!M��b�%�+�����`���tMں)�;��O<�6\rU�+��F��+&]�m���b���\"c\\r��\Z���+��J�EP��Q]�ǚFG\'y�Y\\�*ǽrw������O6�*�+��f����	�4W���w+��뜸�m�ƽ��)�q.2N)��Z7:5��%�%GaY�[\rzT�ё�k���C�<�����h�K�J�KT�	�hĚU�Ċk,:Ԟb惪8�PH�2:����\01���8�O~\r(�k<K����\r��iy�G�Y�e=�\n	��V1�4�eja��ݾ�u/,6���}2Ns�܊㯋�NZ��7N�b�#+v��00J�9�+ŭ���W�0Ƥ�W��s�U�ү�W�09L�(ٓ[��ޟ੿�����}���э�ӿ�����>�9�4ll�K�\0���?yS����9��홮����)S×]�[+���vS����u��w����?[�>�尧��xc�f������}n��q8���j���@�5b=�v&���{x{�8Fǌb�%4�U�GS�>����,�o̅����G��7���K���(�G@+b���pv�\\��u�,\'�WQ�E\\V>�d�c��L�~T��3�Z�킝�qU��W�L�,�Z�2c�@QY�I��I��gX� c-Z ei�\"���\0��D�D�QEf ��(�\0��*�(���`9_��=��k��W�?�(���uU�g�����:�)��\Z\r��M����QN��-4��wzZV0!��a\0�*J|ÍI���R5fˡ�\r�l�#Zf����4v�����O1�����8���8�˞��8����o�\rzԚ\\\rڪI�DzWe�q6�$���};�qT��D`Nk�����Wts��Gy�Q��g�T_�m��]�J�p�:d��\rm��8��Ǉ5!�	N�\0�RK��4ϱ�ꆶ��*8�����ɇ8���\"��W���\0r�i)�h��+�g�š^�_����x��+���\n=/��=��Y�?[��ǠY/PZ�c��1�Ѝ:s�\Z��9��S1���\'=�� ����=�QZ� ��4�bNF;F=+Z;r+�M=[Ku�Sc*�E���#��[���W,�L�a-;���y��	�\\QE�`Q�E<�\0���-sL�QS�0\nZ(�\0������4\0�QE\0QEX	�k���*@��*Z(���b��5`4�x����j9�(��9�(��\0(��\0�|�\0\"~��\0^q�ME�g�������Ex�����6�EmQ@Ģ�(\0�����h��#L����Gz(�&��+B�֊*�a�1Қ`�?pQEQby��\nx���y�(��<���(؟�QS\"��_JuTȑ���QY�D���QA����+ �(�\0��*dEPQEZ(����(�IE�(��\0)h��\n(���(�\0��(\0��\0⨢��ԴQPEPEPEP��','image/jpeg');
/*!40000 ALTER TABLE `t_multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_productos`
--

DROP TABLE IF EXISTS `t_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_productos` (
  `PRODUCTO_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO POR PRODUCTO',
  `prod_nombre` varchar(30) DEFAULT NULL COMMENT 'NOMBRE DEL PRODUCTO',
  `prod_description` text COMMENT 'DESCRIPCION DEL PRODUCTO',
  `precio` decimal(8,2) DEFAULT NULL COMMENT 'PRECIO DEL PRODUCTO',
  `prod_cantidad` int DEFAULT NULL COMMENT 'CANTIDAD DISPONIBLE DE ESTE PRODUCTO',
  `prod_valoracion` tinyint DEFAULT NULL COMMENT 'VALORACION DEL PRODUCTO (PROMEDIO DE LAS VALORACIONES DE LOS COMENTARIOS DE ESTE PRODUCTO)',
  `ESTADO_ID` int DEFAULT NULL COMMENT 'ESTADO EN QUE SE ENCUENTRA ESTE PRODUCTO',
  `USER_ID` int DEFAULT NULL COMMENT 'ID DE USUARIO DUEÑO DE ESTE PRODUCTO (VENDEDOR)',
  PRIMARY KEY (`PRODUCTO_ID`),
  KEY `FK_prod_state` (`ESTADO_ID`),
  KEY `FK_prod_user` (`USER_ID`),
  CONSTRAINT `FK_prod_state` FOREIGN KEY (`ESTADO_ID`) REFERENCES `t_static_state` (`ESTADO_ID`),
  CONSTRAINT `FK_prod_user` FOREIGN KEY (`USER_ID`) REFERENCES `t_usuarios` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_productos`
--

LOCK TABLES `t_productos` WRITE;
/*!40000 ALTER TABLE `t_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_static_rol`
--

DROP TABLE IF EXISTS `t_static_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_static_rol` (
  `ROL_ID` int NOT NULL COMMENT 'ID UNICO DEL ROL',
  `user_rol` varchar(10) DEFAULT NULL COMMENT 'NOMBRE/DESCRIPCION QUE LLEVARA EL ROL (EJEMP. "ADMIN")',
  PRIMARY KEY (`ROL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_static_rol`
--

LOCK TABLES `t_static_rol` WRITE;
/*!40000 ALTER TABLE `t_static_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_static_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_static_state`
--

DROP TABLE IF EXISTS `t_static_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_static_state` (
  `ESTADO_ID` int NOT NULL COMMENT 'ID UNICO DEL ESTADO',
  `descripcion` varchar(30) DEFAULT NULL COMMENT 'DESCRIPCION DEL ESTADO (EJEM. "DISPONIBLE")',
  PRIMARY KEY (`ESTADO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_static_state`
--

LOCK TABLES `t_static_state` WRITE;
/*!40000 ALTER TABLE `t_static_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_static_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_token`
--

DROP TABLE IF EXISTS `t_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_token` (
  `TOKEN_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO DEL TOKEN',
  `token` varchar(45) DEFAULT NULL COMMENT 'TOKEN DE AUTENTIFICACION',
  `fecha_registro` datetime DEFAULT NULL COMMENT 'FECHA EN QUE SE CREO EL TOKEN',
  `USER_ID` int DEFAULT NULL COMMENT 'ID DEL USUARIO AL QUE PERTENECE EL TOKEN',
  `ESTADO_ID` int DEFAULT NULL COMMENT 'ESTADO DEL TOKEN',
  PRIMARY KEY (`TOKEN_ID`),
  KEY `FK_token_user` (`USER_ID`),
  KEY `FK_token_state` (`ESTADO_ID`),
  CONSTRAINT `FK_token_state` FOREIGN KEY (`ESTADO_ID`) REFERENCES `t_static_state` (`ESTADO_ID`),
  CONSTRAINT `FK_token_user` FOREIGN KEY (`USER_ID`) REFERENCES `t_usuarios` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_token`
--

LOCK TABLES `t_token` WRITE;
/*!40000 ALTER TABLE `t_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuarios`
--

DROP TABLE IF EXISTS `t_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_usuarios` (
  `USER_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO POR USUARIO',
  `email` varchar(40) DEFAULT NULL COMMENT 'EMAIL DEL USUARIO CON EL QUE LOGEARA',
  `username` varchar(30) DEFAULT NULL COMMENT 'USERNAME CON EL QUE SE IDENTIFICA EL USUARIO',
  `user_password` varchar(65) DEFAULT NULL COMMENT 'CONTRASEÑA CON LA QUE EL USUARIO LOGEARA',
  `user_nombre` varchar(50) DEFAULT NULL COMMENT 'NOMBRE(S) PERSONAL DEL USUARIO',
  `user_apPat` varchar(25) DEFAULT NULL COMMENT 'APELLIDO PATERNO DEL USUARIO',
  `user_apMat` varchar(25) DEFAULT NULL COMMENT 'APELLIDO MATERNO DEL USUARIO (SI LO TIENE)',
  `user_sex` tinyint DEFAULT NULL COMMENT 'SEXO DEL USUARIO',
  `fecha_nac` date DEFAULT NULL COMMENT 'FECHA DE NACIMIENTO DEL USUARIO',
  `fecha_in` datetime DEFAULT NULL COMMENT 'FECHA DE INGRESO DEL USUARIO',
  `ROL_ID` int DEFAULT NULL COMMENT 'ROL DE USUARIO, SE DEFINE CON LLAVE FORANEA DE TABLA ROL',
  `IMAGEN_ID` int DEFAULT NULL COMMENT 'IMAGEN DEL AVATAR DEL USUARIO',
  `ESTADO_ID` int DEFAULT NULL COMMENT 'ESTADO DEL USUARIO, SE DEFINE CON LLAVE FORANEA DE TABLA ESTADO',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_usuarios_rol` (`ROL_ID`),
  KEY `FK_usuarios_state` (`ESTADO_ID`),
  KEY `FK_usuarios_imagen` (`IMAGEN_ID`),
  CONSTRAINT `FK_usuarios_imagen` FOREIGN KEY (`IMAGEN_ID`) REFERENCES `t_multimedia` (`MEDIA_ID`),
  CONSTRAINT `FK_usuarios_rol` FOREIGN KEY (`ROL_ID`) REFERENCES `t_static_rol` (`ROL_ID`),
  CONSTRAINT `FK_usuarios_state` FOREIGN KEY (`ESTADO_ID`) REFERENCES `t_static_state` (`ESTADO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuarios`
--

LOCK TABLES `t_usuarios` WRITE;
/*!40000 ALTER TABLE `t_usuarios` DISABLE KEYS */;
INSERT INTO `t_usuarios` VALUES (1,'zealotoneking@gmail.com','Zeal','125f8d4352212a4e7412df458e693b9887cef2e34a491871d5877241fd85836b','Raul Eleazar','Hernandez','Campos',1,'1999-11-10','2022-10-10 05:10:00',1,1,1);
/*!40000 ALTER TABLE `t_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_venta`
--

DROP TABLE IF EXISTS `t_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_venta` (
  `VENTA_ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID UNICO DE VENTA',
  `fecha_venta` date DEFAULT NULL COMMENT 'FECHA EN QUE SE CREO ESTA VENTA',
  `USER_ID` int DEFAULT NULL COMMENT 'USUARIO PARA OBTENER EL CARRITO AL QUE PERTENECE ESTA VENTA',
  PRIMARY KEY (`VENTA_ID`),
  KEY `FK_venta_comprador` (`USER_ID`),
  CONSTRAINT `FK_venta_comprador` FOREIGN KEY (`USER_ID`) REFERENCES `t_usuarios` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_venta`
--

LOCK TABLES `t_venta` WRITE;
/*!40000 ALTER TABLE `t_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_venta_detalle`
--

DROP TABLE IF EXISTS `t_venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_venta_detalle` (
  `DETALLE_VENTA_ID` int NOT NULL COMMENT 'ID UNICO DE DETALLE VENTA',
  `cantidad` int DEFAULT NULL COMMENT 'CANTIDAD DE PRODUCTOS',
  `precio` int DEFAULT NULL COMMENT 'PRECIO UNITARIO DEL PRODUCTO',
  `importe` int DEFAULT NULL COMMENT 'PRECIO TOTAL POR TODOS LOS PRODUCTOS',
  `VENTA_ID` int DEFAULT NULL COMMENT 'VENTA A LA QUE PERTENECE',
  `PRODUCTO_ID` int DEFAULT NULL COMMENT 'ID DEL PRODUCTO',
  PRIMARY KEY (`DETALLE_VENTA_ID`),
  KEY `FK_detalleVenta_venta` (`VENTA_ID`),
  KEY `FK_detalleVenta_producto` (`PRODUCTO_ID`),
  CONSTRAINT `FK_detalleVenta_producto` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `t_productos` (`PRODUCTO_ID`),
  CONSTRAINT `FK_detalleVenta_venta` FOREIGN KEY (`VENTA_ID`) REFERENCES `t_venta` (`VENTA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_venta_detalle`
--

LOCK TABLES `t_venta_detalle` WRITE;
/*!40000 ALTER TABLE `t_venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_cyberkong'
--
/*!50003 DROP FUNCTION IF EXISTS `getNextAutoIncFromTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`devadmin`@`localhost` FUNCTION `getNextAutoIncFromTable`(db_name varchar(30), db_table varchar(30)) RETURNS int
    READS SQL DATA
begin
	declare id int;
	SET id = (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = db_name AND TABLE_NAME = db_table);
	return id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UsuarioActions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`devadmin`@`localhost` PROCEDURE `sp_UsuarioActions`(
in _action tinyint,
in _user_id int,
in _email varchar(40),
in _username varchar(30),
in _userpassword varchar(65),
in _nombre varchar(50),
in _apPat varchar(25),
in _apMat varchar(25),
in _sexo tinyint,
in _fechaNacimiento date,
in _fechaIngreso datetime,
in _rol_id int,
in _state_id int,
in _file_data longblob,
in _file_type varchar(15)
)
BEGIN
declare image_id int;

	if _action = 1 then
		insert into 
        t_multimedia
        (media_data, media_type)
        value
        (_file_data, _file_type);
    
		set image_id = getNextAutoIncFromTable("db_cyberkong", "t_multimedia") - 1;
        
		insert into 
		t_usuarios
		(email, username, user_password, user_nombre, 
		user_apPat, user_apMat, user_sex, fecha_nac, 
		fecha_in, ROL_ID, IMAGEN_ID, ESTADO_ID)
		value
		(_email, _username, _userpassword, _nombre, 
		_apPat, _apMat, _sexo, _fechaNacimiento, 
		_fechaIngreso, _rol_id, image_id, _state_id);

    else if _action = 2 then
    
		if _email is not null then
			update t_usuarios set email = _email where USER_ID = _user_id;
        end if;
        if _username is not null then
			update t_usuarios set username = _username where USER_ID = _user_id;
        end if;
        if _userpassword is not null then
			update t_usuarios set user_password = _userpassword where USER_ID = _user_id;
        end if;
        if _nombre is not null then
			update t_usuarios set user_nombre = _nombre where USER_ID = _user_id;
        end if;
        if _apPat is not null then
			update t_usuarios set user_apPat = _apPat where USER_ID = _user_id;
        end if;
        if _apMat is not null then
			update t_usuarios set user_apMat = _apMat where USER_ID = _user_id;
        end if;
        if _sexo is not null then
			update t_usuarios set user_sex = _sexo where USER_ID = _user_id;
        end if;
        if _fechaNacimiento is not null then
			update t_usuarios set fecha_nac = _fechaNacimiento where USER_ID = _user_id;
        end if;
        
	elseif _action = 3 then
    
		if _rol_id is not null then
			update t_usuarios set ROL_ID = _rol_id where USER_ID = _user_id;
        end if;
        
	elseif _action = 4 then
    
		if _image_id is not null then
			update t_usuarios set IMAGE_ID = _image_id where USER_ID = _user_id;
        end if;
        
     elseif _action = 5 then
    
		if _state_id is not null then
			update t_usuarios set ESTADO_ID = _state_id where USER_ID = _user_id;
        end if;
        
	else 
		SELECT "ACTION NOT EXISTS" AS 'ERROR MESSAGE';
    end if;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UsuarioReads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`devadmin`@`localhost` PROCEDURE `sp_UsuarioReads`(
in _action tinyint,
in _username varchar(30),
in _password varchar(65),
in _userId int,
in _email varchar(40)
)
BEGIN
-- OBTENER USUARIO CON ID

	if _action = 1 then
		if _username is not null then
			SELECT 
			u.username as "USUARIO",
			u.user_password as "PASSWORD"
			FROM t_usuarios as u
			where u.username = _username;
        end if;
        
		if _email is not null then
			SELECT 
			u.email as "EMAIL",
			u.user_password as "PASSWORD"
			FROM t_usuarios as u
			where u.email = _email;
        end if;
	
    elseif _action = 2 then
		if(_username is not null) then
			if (exists(select username from t_usuarios where username = _username)) then
				select 1 as "EXISTS";
			else
				select 0 as "EXISTS";
			end if;
            
		elseif(_email is not null) then
			if (exists(select username from t_usuarios where email = _email)) then
				select 1 as "EXISTS";
			else
				select 0 as "EXISTS";
			end if;
		end if;

    elseif _action = 3 then
		select 
        u.email as "EMAIL",
        u.username as "USUARIO",
        concat(u.user_nombre, u.user_apPat, u.user_apMat) as "NOMBRE COMPLETO",
        u.user_sex "SEXO",
        u.fecha_nac "FECHA NACIMIENTO",
        m.media_data "IMAGEN",
        m.media_type "TIPO DE ARCHIVO"
        FROM t_usuario as u
        join t_multimedia as m
        on u.IMAGEN_ID = m.MEDIA_ID
        where u.username = _username;

	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-20  9:08:45

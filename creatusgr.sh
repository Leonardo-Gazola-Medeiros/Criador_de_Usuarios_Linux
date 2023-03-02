#!/bin/bash

echo "Criando pastas de diretórios"

mkdir /adm
mkdir /ven
mkdir /sec
mkdir /public

echo "Criando os grupos de usuários"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando os usuários"

useradd leonardo -m -s /bin/bash -p $(openssl passwd -crypt senha) -G GRP_ADM

useradd user1 -m -s /bin/bash -p $(openssl passwd -crypt senha) -G GRP_VEN

useradd user2 -m -s /bin/bash -p $(openssl passwd -crypt senha) -G GRP_SEC

echo "Adicionando permissões aos diretórios"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /public

echo "O processo foi finalizado com exito!"

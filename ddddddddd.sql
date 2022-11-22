/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  21/10/2022 14:45:43                      */
/*==============================================================*/


drop table if exists APPORTE;

drop table if exists BAR;

drop table if exists BIERE;

drop table if exists CHERCHE;

drop table if exists COMMENTE;

drop table if exists CONFIRME;

drop table if exists DECRIT;

drop table if exists HAPPY_HOUR;

drop table if exists PROPOSE;

drop table if exists QUARTIER;

drop table if exists RECHERCHE;

drop table if exists SERT;

drop table if exists UTILISATEUR;

drop table if exists VALIDE;

drop table if exists VILLE;

/*==============================================================*/
/* Table : APPORTE                                              */
/*==============================================================*/
create table APPORTE
(
   IDUSER               int not null,
   IDBIERE              int not null,
   primary key (IDUSER, IDBIERE)
);

/*==============================================================*/
/* Table : BAR                                                  */
/*==============================================================*/
create table BAR
(
   IDBAR                int not null,
   IDUSER               int,
   IDQUARTIER           int not null,
   NOMBAR               text,
   NORUE                text,
   NOMRUE               text,
   CODEPOSTAL           text,
   JOUROUVERTURE        text,
   primary key (IDBAR)
);

/*==============================================================*/
/* Table : BIERE                                                */
/*==============================================================*/
create table BIERE
(
   IDBIERE              int not null,
   NOM                  text,
   primary key (IDBIERE)
);

/*==============================================================*/
/* Table : CHERCHE                                              */
/*==============================================================*/
create table CHERCHE
(
   IDBIERE              int not null,
   IDUSER               int not null,
   primary key (IDBIERE, IDUSER)
);

/*==============================================================*/
/* Table : COMMENTE                                             */
/*==============================================================*/
create table COMMENTE
(
   IDUSER               int not null,
   IDBIERE              int not null,
   primary key (IDUSER, IDBIERE)
);

/*==============================================================*/
/* Table : CONFIRME                                             */
/*==============================================================*/
create table CONFIRME
(
   IDUSER               int not null,
   IDBIERE              int not null,
   primary key (IDUSER, IDBIERE)
);

/*==============================================================*/
/* Table : DECRIT                                               */
/*==============================================================*/
create table DECRIT
(
   IDBAR                int not null,
   IDUSER               int not null,
   primary key (IDBAR, IDUSER)
);

/*==============================================================*/
/* Table : HAPPY_HOUR                                           */
/*==============================================================*/
create table HAPPY_HOUR
(
   IDHAPPYHOUR          int not null,
   HEURE_DEBUT          time,
   JOURS                text,
   HEURE_FIN            time,
   primary key (IDHAPPYHOUR)
);

/*==============================================================*/
/* Table : PROPOSE                                              */
/*==============================================================*/
create table PROPOSE
(
   IDBAR                int not null,
   IDHAPPYHOUR          int not null,
   primary key (IDBAR, IDHAPPYHOUR)
);

/*==============================================================*/
/* Table : QUARTIER                                             */
/*==============================================================*/
create table QUARTIER
(
   IDQUARTIER           int not null,
   IDVILLE              int not null,
   NOMQUARTIER          text,
   primary key (IDQUARTIER)
);

/*==============================================================*/
/* Table : RECHERCHE                                            */
/*==============================================================*/
create table RECHERCHE
(
   IDBAR                int not null,
   IDUSER               int not null,
   primary key (IDBAR, IDUSER)
);

/*==============================================================*/
/* Table : SERT                                                 */
/*==============================================================*/
create table SERT
(
   IDBAR                int not null,
   IDBIERE              int not null,
   primary key (IDBAR, IDBIERE)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR
(
   IDUSER               int not null,
   PSEUDO               text,
   IDENTIFIANT          text,
   MOTDEPASSE           text,
   primary key (IDUSER)
);

/*==============================================================*/
/* Table : VALIDE                                               */
/*==============================================================*/
create table VALIDE
(
   IDUSER               int not null,
   IDBAR                int not null,
   primary key (IDUSER, IDBAR)
);

/*==============================================================*/
/* Table : VILLE                                                */
/*==============================================================*/
create table VILLE
(
   IDVILLE              int not null,
   NOMVILLE             text,
   primary key (IDVILLE)
);

alter table APPORTE add constraint FK_APPORTE foreign key (IDBIERE)
      references BIERE (IDBIERE) on delete restrict on update restrict;

alter table APPORTE add constraint FK_APPORTE2 foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table BAR add constraint FK_AJOUTE foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table BAR add constraint FK_APPARTIENT foreign key (IDQUARTIER)
      references QUARTIER (IDQUARTIER) on delete restrict on update restrict;

alter table CHERCHE add constraint FK_CHERCHE foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table CHERCHE add constraint FK_CHERCHE2 foreign key (IDBIERE)
      references BIERE (IDBIERE) on delete restrict on update restrict;

alter table COMMENTE add constraint FK_COMMENTE foreign key (IDBIERE)
      references BIERE (IDBIERE) on delete restrict on update restrict;

alter table COMMENTE add constraint FK_COMMENTE2 foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table CONFIRME add constraint FK_CONFIRME foreign key (IDBIERE)
      references BIERE (IDBIERE) on delete restrict on update restrict;

alter table CONFIRME add constraint FK_CONFIRME2 foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table DECRIT add constraint FK_DECRIT foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table DECRIT add constraint FK_DECRIT2 foreign key (IDBAR)
      references BAR (IDBAR) on delete restrict on update restrict;

alter table PROPOSE add constraint FK_PROPOSE foreign key (IDHAPPYHOUR)
      references HAPPY_HOUR (IDHAPPYHOUR) on delete restrict on update restrict;

alter table PROPOSE add constraint FK_PROPOSE2 foreign key (IDBAR)
      references BAR (IDBAR) on delete restrict on update restrict;

alter table QUARTIER add constraint FK_CONTIENT foreign key (IDVILLE)
      references VILLE (IDVILLE) on delete restrict on update restrict;

alter table RECHERCHE add constraint FK_RECHERCHE foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;

alter table RECHERCHE add constraint FK_RECHERCHE2 foreign key (IDBAR)
      references BAR (IDBAR) on delete restrict on update restrict;

alter table SERT add constraint FK_SERT foreign key (IDBIERE)
      references BIERE (IDBIERE) on delete restrict on update restrict;

alter table SERT add constraint FK_SERT2 foreign key (IDBAR)
      references BAR (IDBAR) on delete restrict on update restrict;

alter table VALIDE add constraint FK_VALIDE foreign key (IDBAR)
      references BAR (IDBAR) on delete restrict on update restrict;

alter table VALIDE add constraint FK_VALIDE2 foreign key (IDUSER)
      references UTILISATEUR (IDUSER) on delete restrict on update restrict;


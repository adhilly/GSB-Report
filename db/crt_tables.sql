/*==============================================================*/
/* Table : activity                                           */
/*==============================================================*/
create table activity  (
   activity_id        int(11)       not null       auto_increment,
   activity_date      date,
   activity_place     varchar(200),
   activity_theme     varchar(100),
   activity_purpose   varchar(100),
   constraint pk_activity primary key (activity_id)
);

/*==============================================================*/
/* Table : component                                          */
/*==============================================================*/
create table component  (
   component_id       int(11)                         not null,
   component_name     varchar(100),
   constraint pk_component primary key (component_id)
);

/*==============================================================*/
/* Table : district                                           */
/*==============================================================*/
create table district  (
   district_id        int(11)       not null       auto_increment,
   sector_id          int(11),
   district_name      varchar(100),
   constraint pk_district primary key (district_id)
);

/*==============================================================*/
/* Table : dosage                                             */
/*==============================================================*/
create table dosage  (
   dosage_id          int(11)       not null       auto_increment,
   dosage_quantity    numeric(2,0),
   dosage_unit        char(10),
   constraint pk_dosage primary key (dosage_id)
);

/*==============================================================*/
/* Table : drug                                               */
/*==============================================================*/
create table drug  (
   drug_id            int(11)       not null       auto_increment,
   family_id          int(11),
   copyrighting       varchar(100),
   trade_name         varchar(100),
   content            char(255),
   effects            varchar(512),
   contraindication   char(255),
   sample_price       numeric(11,2),
   constraint pk_drug primary key (drug_id)
);

/*==============================================================*/
/* Table : expense_form_detail                             */
/*==============================================================*/
create table expense_form_detail  (
   expense_form_id    int(11)                         not null,
   flate_rate_expense_id int(11)                         not null,
   detail_quantity    int(11),
   constraint pk_expense_account_detail primary key (expense_form_id, flate_rate_expense_id)
);

/*==============================================================*/
/* Table : expense_form                                       */
/*==============================================================*/
create table expense_form  (
   expense_form_id    int(11)       not null       auto_increment,
   state_id           int(11)                         not null,
   visitor_id         int(11)                         not null,
   yearmonth          char(6)                         not null,
   doc_evidence_number int(11),
   lastest_update     date,
   valid_amount       numeric(11,2),
   constraint pk_expense_form primary key (expense_form_id)
);

/*==============================================================*/
/* Table : extra_flate_rate_expense                           */
/*==============================================================*/
create table extra_flate_rate_expense  (
   extra_fr_expense_id int(11)       not null       auto_increment,
   expense_form_id    int(11)                         not null,
   extra_fr_expense_date date,
   extra_fr_expense_amount numeric(11,2),
   extra_fr_expense_name varchar(200),
   constraint pk_extra_flate_rate_expense primary key (extra_fr_expense_id)
);

/*==============================================================*/
/* Table : family                                             */
/*==============================================================*/
create table family  (
   family_id          int(11)       not null       auto_increment,
   family_name        varchar(100),
   constraint pk_family primary key (family_id)
);

/*==============================================================*/
/* Table : flate_rate_expense                                */
/*==============================================================*/
create table flate_rate_expense  (
   flate_rate_expense_id int(11)       not null       auto_increment,
   flate_rate_expense_name varchar(100),
   flate_rate_expense_amount numeric(11,2),
   constraint pk_flate_rate_expenses primary key (flate_rate_expense_id)
);

/*==============================================================*/
/* Table : formulating                                        */
/*==============================================================*/
create table formulating  (
   drug_id            int(11)                         not null,
   presentation_id    int(11)                         not null,
   constraint pk_formulating primary key (drug_id, presentation_id)
);

/*==============================================================*/
/* Table : individual_type                                    */
/*==============================================================*/
create table individual_type  (
   individual_type_id int(11)       not null       auto_increment,
   individual_type_name varchar(100),
   constraint pk_individual_type primary key (individual_type_id)
);

/*==============================================================*/
/* Table : interacting                                        */
/*==============================================================*/
create table interacting  (
   drug_id_src        int(11)                         not null,
   drug_id_dest            int(11)                         not null,
   constraint pk_interacting primary key (drug_id_src, drug_id_dest)
);

/*==============================================================*/
/* Table : inviting                                           */
/*==============================================================*/
create table inviting  (
   activity_id        int(11)       not null       auto_increment,
   practitioner_id    int(11)                         not null,
   specialist         char(1)                         not null,
   constraint pk_inviting primary key (activity_id, practitioner_id)
);

/*==============================================================*/
/* Table : laboratory                                         */
/*==============================================================*/
create table laboratory  (
   laboratory_id      int(11)       not null       auto_increment,
   laboratory_name    varchar(100),
   sales_manager      varchar(100),
   constraint pk_laboratory primary key (laboratory_id)
);

/*==============================================================*/
/* Table : offering                                           */
/*==============================================================*/
create table offering  (
   drug_id            int(11)                         not null,
   report_id          int(11)                         not null,
   visitor_id         int(11)                         not null,
   delivered_quantity numeric(2,0),
   constraint pk_offering primary key (drug_id, report_id, visitor_id)
);

/*==============================================================*/
/* Table : organizing                                         */
/*==============================================================*/
create table organizing  (
   activity_id        int(11)                         not null,
   visitor_id         int(11)                         not null,
   activity_amount    numeric(11,2),
   constraint pk_organizing primary key (activity_id, visitor_id)
);

/*==============================================================*/
/* Table : owning                                             */
/*==============================================================*/
create table owning  (
   practitioner_id    int(11)                         not null,
   speciality_id      int(11)                         not null,
   graduate           varchar(100),
   prescription_coefficient numeric(11,2),
   constraint pk_owning primary key (practitioner_id, speciality_id)
);

/*==============================================================*/
/* Table : practitioner                                       */
/*==============================================================*/
create table practitioner  (
   practitioner_id    int(11)       not null       auto_increment,
   practitioner_type_id int(11),
   practitioner_name  varchar(100),
   practitioner_first_name varchar(100),
   practitioner_address varchar(200),
   practitioner_zip_code char(5),
   practitioner_city  varchar(100),
   notoriety_coefficient numeric(11,2),
   constraint pk_practitioner primary key (practitioner_id)
);

/*==============================================================*/
/* Table : practitioner_type                                  */
/*==============================================================*/
create table practitioner_type  (
   practitioner_type_id int(11)       not null       auto_increment,
   practitioner_type_name varchar(100),
   practitioner_type_place varchar(200),
   constraint pk_practitioner_type primary key (practitioner_type_id)
);

/*==============================================================*/
/* Table : prescribing                                        */
/*==============================================================*/
create table prescribing  (
   dosage_id          int(11)                         not null,
   drug_id            int(11)                         not null,
   individual_type_id int(11)                         not null,
   dose_range         varchar(100),
   constraint pk_prescribing primary key (dosage_id, drug_id, individual_type_id)
);

/*==============================================================*/
/* Table : presentation                                       */
/*==============================================================*/
create table presentation  (
   presentation_id    int(11)                         not null,
   presentation_name  varchar(100),
   constraint pk_presentation primary key (presentation_id)
);

/*==============================================================*/
/* Table : sector                                             */
/*==============================================================*/
create table sector  (
   sector_id          int(11)       not null       auto_increment,
   sector_name        varchar(100),
   constraint pk_sector primary key (sector_id)
);

/*==============================================================*/
/* Table : setting_up                                         */
/*==============================================================*/
create table setting_up  (
   component_id       int(11)                         not null,
   drug_id            int(11)                         not null,
   component_quantity numeric(11,2),
   constraint pk_setting_up primary key (component_id, drug_id)
);

/*==============================================================*/
/* Table : speciality                                         */
/*==============================================================*/
create table speciality  (
   speciality_id      int(11)       not null       auto_increment,
   speciality_name    varchar(100),
   constraint pk_speciality primary key (speciality_id)
);

/*==============================================================*/
/* Table : state                                              */
/*==============================================================*/
create table state  (
   state_id           int(11)       not null       auto_increment,
   state_name         varchar(120),
   constraint pk_state primary key (state_id)
);

/*==============================================================*/
/* Table : visit_report                                       */
/*==============================================================*/
create table visit_report  (
   report_id          int(11)                         not null,
   practitioner_id    int(11),
   visitor_id         int(11)                         not null,
   reporting_date     date,
   assessment         varchar(512),
   purpose            varchar(255),
   constraint pk_visit_report primary key (report_id)
);

/*==============================================================*/
/* Table : visitor                                            */
/*==============================================================*/
create table visitor  (
   visitor_id         int(11)       not null       auto_increment,
   sector_id          int(11),
   laboratory_id      int(11),
   visitor_last_name  varchar(100),
   visitor_first_name varchar(100),
   visitor_address    varchar(200),
   visitor_zip_code   char(5),
   visitor_city       varchar(100),
   hiring_date        date,
   user_name          varchar(50)                    not null,
   password           varchar(100)                   not null,
   salt               varchar(23)                    not null,
   role               varchar(100)                   not null,
   visitor_type       char(1),
   constraint pk_visitor primary key (visitor_id)
);

/*==============================================================*/
/* Table : working                                            */
/*==============================================================*/
create table working  (
   visitor_id         int(11)                         not null,
   ddmmyy             date                            not null,
   district_id        int(11)                         not null,
   visitor_role       varchar(100),
   constraint pk_working primary key (visitor_id, ddmmyy, district_id)
);
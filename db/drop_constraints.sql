alter table district
   drop foreign key fk_district_sector;

alter table drug
   drop foreign key fk_drug_family;

alter table expense_form
   drop foreign key fk_expense_form_state;

alter table expense_form
   drop foreign key fk_expense_form_visitor;

alter table formulating
   drop foreign key fk_formulating_presentation;

alter table formulating
   drop foreign key fk_formulating_drug;

alter table extra_flate_rate_expense
   drop foreign key fk_extra_flate_rate_expense_expense_form;

alter table interacting
   drop foreign key fk_interacting_drug_src;

alter table interacting
   drop foreign key fk_interacting_drug_dest;

alter table inviting
   drop foreign key fk_inviting_activity;

alter table inviting
   drop foreign key fk_inviting_practitioner;

alter table expense_form_detail
   drop foreign key fk_expense_form_detail_expense_form;

alter table expense_form_detail
   drop foreign key fk_expense_form_detail_flate_rate_expense;

alter table offering
   drop foreign key fk_offering_visit_report;

alter table offering
   drop foreign key fk_offering_visitor;

alter table offering
   drop foreign key fk_offering_drug;

alter table organizing
   drop foreign key fk_organizing_activity;

alter table organizing
   drop foreign key fk_organizing_visitor;

alter table owning
   drop foreign key fk_owning_practitioner;

alter table owning
   drop foreign key fk_owning_speciality;

alter table practitioner
   drop foreign key fk_practitioner_practitioner_type;

alter table prescribing
   drop foreign key fk_prescribing_drug;

alter table prescribing
   drop foreign key fk_prescribing_individual_type;

alter table prescribing
   drop foreign key fk_prescribing_dosage;

alter table setting_up
   drop foreign key fk_setting_up_component;

alter table setting_up
   drop foreign key fk_setting_up_drug;

alter table visit_report
   drop foreign key fk_visit_report_practitioner;

alter table visit_report
   drop foreign key fk_visit_report_visitor;

alter table visitor
   drop foreign key fk_visitor_sector;

alter table visitor
   drop foreign key fk_visitor_laboratory ;

alter table working
   drop foreign key fk_working_district;

alter table working
   drop foreign key fk_working_visitor;


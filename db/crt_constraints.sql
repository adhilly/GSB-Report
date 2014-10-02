alter table district
   add constraint fk_district_sector foreign key (sector_id)
      references sector (sector_id);

alter table drug
   add constraint fk_drug_family foreign key (family_id)
      references family (family_id);

alter table expense_form
   add constraint fk_expense_form_state foreign key (state_id)
      references state (state_id);

alter table expense_form
   add constraint fk_expense_form_visitor foreign key (visitor_id)
      references visitor (visitor_id);

alter table formulating
   add constraint fk_formulating_presentation foreign key (presentation_id)
      references presentation (presentation_id);

alter table formulating
   add constraint fk_formulating_drug foreign key (drug_id)
      references drug (drug_id);

alter table extra_flate_rate_expense
   add constraint fk_extra_flate_rate_expense_expense_form foreign key (expense_form_id)
      references expense_form (expense_form_id);

alter table interacting
   add constraint fk_interacting_drug_src foreign key (drug_id_src)
      references drug (drug_id);

alter table interacting
   add constraint fk_interacting_drug_dest foreign key (drug_id_dest)
      references drug (drug_id);

alter table inviting
   add constraint fk_inviting_activity foreign key (activity_id)
      references activity (activity_id);

alter table inviting
   add constraint fk_inviting_practitioner foreign key (practitioner_id)
      references practitioner (practitioner_id);

alter table expense_form_detail
   add constraint fk_expense_form_detail_expense_form foreign key (expense_form_id)
      references expense_form (expense_form_id);

alter table expense_form_detail
   add constraint fk_expense_form_detail_flate_rate_expense foreign key (flate_rate_expense_id)
      references flate_rate_expense (flate_rate_expense_id);

alter table offering
   add constraint fk_offering_visit_report foreign key (report_id)
      references visit_report (report_id);

alter table offering
   add constraint fk_offering_visitor foreign key (visitor_id)
      references visitor (visitor_id);

alter table offering
   add constraint fk_offering_drug foreign key (drug_id)
      references drug (drug_id);

alter table organizing
   add constraint fk_organizing_activity foreign key (activity_id)
      references activity (activity_id);

alter table organizing
   add constraint fk_organizing_visitor foreign key (visitor_id)
      references visitor (visitor_id);

alter table owning
   add constraint fk_owning_practitioner foreign key (practitioner_id)
      references practitioner (practitioner_id);

alter table owning
   add constraint fk_owning_speciality foreign key (speciality_id)
      references speciality (speciality_id);

alter table practitioner
   add constraint fk_practitioner_practitioner_type foreign key (practitioner_type_id)
      references practitioner_type (practitioner_type_id);

alter table prescribing
   add constraint fk_prescribing_drug foreign key (drug_id)
      references drug (drug_id);

alter table prescribing
   add constraint fk_prescribing_individual_type foreign key (individual_type_id)
      references individual_type (individual_type_id);

alter table prescribing
   add constraint fk_prescribing_dosage foreign key (dosage_id)
      references dosage (dosage_id);

alter table setting_up
   add constraint fk_setting_up_component foreign key (component_id)
      references component (component_id);

alter table setting_up
   add constraint fk_setting_up_drug foreign key (drug_id)
      references drug (drug_id);

alter table visit_report
   add constraint fk_visit_report_practitioner foreign key (practitioner_id)
      references practitioner (practitioner_id);

alter table visit_report
   add constraint fk_visit_report_visitor foreign key (visitor_id)
      references visitor (visitor_id);

alter table visitor
   add constraint fk_visitor_sector foreign key (sector_id)
      references sector (sector_id);

alter table visitor
   add constraint fk_visitor_laboratory foreign key (laboratory_id)
      references laboratory (laboratory_id);

alter table working
   add constraint fk_working_district foreign key (district_id)
      references district (district_id);

alter table working
   add constraint fk_working_visitor foreign key (visitor_id)
      references visitor (visitor_id);


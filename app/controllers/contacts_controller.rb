class ContactsController < ApplicationController
  def new
    @form = ContactForm.new

    @form.assign_attributes(
      organization_attributes: { name: "name1", description: "desc1" },
      contact_attributes: { name: "name2", email: "email" },
      deal_attributes: { description: "desc" }
    )
  end

  def create
    @form = ContactForm.new
    @form.assign_attributes(contact_form_params)
    @form.valid?
    render :new
  end


  private

  def contact_form_params
    params.require(:contact_form).permit(
      organization_attributes: [:name, :description],
      contact_attributes: [:name, :email],
      deal_attributes: [:description]
    )
  end
end

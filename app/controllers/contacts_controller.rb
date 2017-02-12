class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    @contact.save
    redirect_to company_jobs_path(@contact.company)
  end

  private

  def contact_params
    params.require(:contact).permit( :company_id, :name, :email, :position)
  end
end

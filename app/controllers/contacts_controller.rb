class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver.later
      flash.now[:notice] = 'Thank YOU'
      render root_path
    else
      flash.now[:error] = 'Cannot send message.'
      render :index
    end
  end

end

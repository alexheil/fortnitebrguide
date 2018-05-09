class EmailsController < ApplicationController

  def create
    @email = Email.new(email_params)
    if @result = @email.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js { render :action => "emails" }
        flash.now[:notice] = "You've successfully been added to the email list!"
        EmailMailer.success_email(@email).deliver_now
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js { render :action => "emails" }
        flash.now[:alert] = "You've failed!"
      end
    end
  end

  def unsubscribe
    @email = Email.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def email_params
      params.require(:email).permit(:email, :daily)
    end

end
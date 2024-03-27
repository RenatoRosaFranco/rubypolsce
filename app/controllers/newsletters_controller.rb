# frozen_string_literal: true

class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:destroy]
  def create
    newsletter = Newsletter.find_or_create_by(newsletter_params)

    if newsletter.persisted?
      flash[:notice] = "You have signup with success."
    else
      flash[:notice] = 'Failed to signup newsletter, try again.'
    end

    redirect_to root_path
  end

  def destroy
    if @newsletter.destroy
      flash[:notice] = 'You have cancel your newsletter with success.'
    else
      flash[:notice] = 'Failed to cancel newsletter, try again.'
    end

    redirect_to root_path
  end

  private

  def set_newsletter
    @newsletter = Newsletter.find_by(token: params[:token])
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
# frozen_string_literal: true

class DonationsController < ApplicationController
  def index
    @donation = Donation.new
  end

  def create
    donation = Donation.new(donation_params)

    if donation.save
       donation.change_donation_status('completed')
       flash[:notice] = 'Donation received with success.'
    else
      flash[:notice] = 'Failed to donate, try again.'
    end

    redirect_to root_path
  end

  def analytics
    @donations = Donation.order(created_at: :desc).page(params[:page]).per(8)
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount)
  end
end
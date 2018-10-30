class Admin::BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bid, only: [:edit, :show, :update, :destroy]
  include BidsConcern

  def new
    @bid = Bid.new
  end

  def index
    @bids = Bid.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "application",
        template: "bids/print.html.erb",
        layout: 'document'
      end
    end
  end

  def edit
  end

  def update
    return redirect_to admin_bid_path(@bid) if @bid.update(bid_params)
    flash.now[:error] = 'Не удалось сохранить заявление!'
    render 'edit'
  end

  def destroy
    @bid.destroy
    redirect_to admin_bids_path
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end
end

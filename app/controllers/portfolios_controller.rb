class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

	def index
		@portfolio_item = Portfolio.by_position
	end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def angular
    @angular_portfolio_item = Portfolio.angular
  end

	def new 
		@portfolio_item = Portfolio.new
    3.times { @portfolio_item.tecgnologies.build }
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy

  	# Destroy/Delete the record
    @portfolio_item.destroy

    #Redirecty
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "The record was removed." }
    end
  end

  private 

  def portfolio_params 
    params.require(:portfolio).permit(:title, 
                                      :subtitle,
                                      :body, 
                                      :main_image,
                                      :thumb_image,
                                      tecgnologies_attributes: [:name]
                                      )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end

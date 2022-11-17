class PaymentsController < ApplicationController
    def index
      redirect_to groups_path
    end
  
    def new
      @payment = Payment.new
      # @groups = Group.where(user: current_user)
    end
  
    def create
      @payment = Payment.create(payment_params)
      @payment.author = current_user
  
      respond_to do |format|
        if @payment.save
          format.html { redirect_to @payment.groups.first, notice: 'Payment was successfully created.' }
          format.json { render :show, status: :created, location: @payment }
        else
          format.html { render :new }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @payment = Payment.find(params[:id])
      @payment.destroy
      redirect_to groups_path
    end
  
    private
  
    def payment_params
      params.require(:payment).permit(:name, :amount, group_ids: [])
    end
  end
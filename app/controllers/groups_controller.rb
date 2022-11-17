class GroupsController < ApplicationController
    def index
      @groups = Group.where(user_id: current_user.id).order('created_at DESC')
    end
  
    def show
      @group = Group.find(params[:id])
      @payments = @group.payments.order('created_at DESC')
    end
  
    def new
      @group = Group.new
    end
  
    def create
      @group = current_user.groups.new(group_params)
      if @group.save
        redirect_to groups_path
      else
        render :new
      end
    end
  
    def destroy
      @group = Group.find(params[:id])
      @group.destroy
      redirect_to groups_path
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name, :icon, :description)
    end
  end
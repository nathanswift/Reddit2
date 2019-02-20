class SubsController < ApplicationController
                          # except: [:index, :new, :create]
  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @sub.update(sub_params)
      # redirect_to subs_path(@sub) or a shortcut of ....
      redirect_to sub_path(@sub)
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
    # redirect_to root_path - you could change that to root but if you change the root it could be problematic
  end

  private
    def sub_params
      params.require(:sub).permit(:name)  
    end

    def set_sub
      # localhost:3000/subs/:id
      @sub = Sub.find(params[:id])
      #this will now call this method at the start of every method so you can delete it from edit update destroy show
    end
end

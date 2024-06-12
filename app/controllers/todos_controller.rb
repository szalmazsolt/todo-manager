class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @uncompleted_todos_count = uncompleted_count
  end

  def show
    redirect_to todos_path
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todos_params)
    @todo.user = current_user
   
    if @todo.save
      flash[:notice] = "Todo was successfully created"
      redirect_to todos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todos_params)
      flash[:notice] = "Todo text was successfully updated"
      redirect_to todos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_completed
    @todo = Todo.find(params[:id])
    if @todo.toggle!(:completed)
      flash[:notice] = "Todo completed status was successfully updated" 
      redirect_to todos_path
    else
      flash.now[:alert] = "Todo completed status could not be updated"
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Todo was successfully deleted"
    redirect_to todos_url, status: :see_other
  end

  private

  def todos_params
    params
      .require(:todo)
      .permit(:title)
  end

  def uncompleted_count
    @todos.where(completed: false).count
  end

end

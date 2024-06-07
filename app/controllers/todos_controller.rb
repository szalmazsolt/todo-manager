class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @uncompleted_todos_count = uncompleted_count
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todos_params)
    if @todo.save
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
      redirect_to todos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_completed
    @todo = Todo.find(params[:id])
    @todo.toggle!(:completed)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
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

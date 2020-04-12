class TodoItemsController < ApplicationController
 before_action :set_todo_list
 before_action :set_todo_item, except: [:create]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.all
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
  end

  # GET /todo_lists/new
  def new
    @todo_item = TodoItem.new
  end

  # GET /todo_lists/1/edit
def edit
  @todo_item = TodoItem.find(params[:id])
end

def create
 @todo_item = @todo_list.todo_items.create(todo_item_params)
 redirect_to @todo_list, notice: 'Task created.'
end

def destroy
 @todo_item = @todo_list.todo_items.find(params[:id])
 if @todo_item.destroy
  flash[:notice] = "Task deleted."
 else
  flash[:notice] = "Task could not be deleted."
 end
 redirect_to @todo_list 
end

def update
  respond_to do |format|
    if @todo_item.update(todo_item_params)
      format.html { redirect_to @todo_list, notice: 'Task updated.' }
      format.json { render :show, status: :ok, location: @todo_list }
    else
      format.html { render :edit }
      format.json { render json: @todo_list.errors, status: :unprocessable_entity }
    end
  end
end

def complete
 @todo_item.update_attribute(:completed_at, Time.now)
 redirect_to @todo_list, notice: "Task completed."
end

def uncomplete
  @todo_item.update_attribute(:completed_at, "")
  redirect_to @todo_list, notice: "Task uncompleted."
 end

private

def set_todo_list
 @todo_list = TodoList.find(params[:todo_list_id])
end

def set_todo_item
 @todo_item = @todo_list.todo_items.find(params[:id])
end

def todo_item_params
 params[:todo_item].permit(:content, :priority, :deadline)
end

end
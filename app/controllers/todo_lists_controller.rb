class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  # GET /todo_lists
  def index
    if user_signed_in?
      @todo_lists = TodoList.where(:user_id => current_user.id)
    end
    #@todo_lists = TodoList.all
    #@todo_lists = TodoList.all.order("created_at DESC")
  end

  # GET /todo_lists/1
  def show
  end

  # GET /todo_lists/new
  def new
    #@todo_list = TodoList.new
    @todo_list = current_user.todo_lists.build
  end

  # POST /todo_lists
  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)
    #@todo_list = TodoList.new(todo_list_params)
    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: 'To-Do list was successfully created.' }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # PATCH/PUT /todo_lists/1
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'To-Do list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'To-Do list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end

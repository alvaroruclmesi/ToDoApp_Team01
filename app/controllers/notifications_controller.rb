class NotificationsController < ApplicationController
    #before_action :set_todo_list
    #before_action :set_todo_item, except: [:create]

    # GET /todo_lists
    # GET /todo_lists.json
    def index
        if user_signed_in?
            @notifications = Notification.where(:receiver_id => current_user.id)
        end
        #@notifications = Notification.all
    end

    # GET /todo_lists/1
    # GET /todo_lists/1.json
    def show
    end

    # GET /todo_lists/new
    def new
        @notification = Notification.new
        #@notification = current_user.notifications.build
    end

    def create
        @notification = current_user.notifications.build(notification_params)
        #@todo_list = TodoList.new(todo_list_params)
        respond_to do |format|
            if @notification.save
                format.html { redirect_to todo_list_path, notice: 'Notification was successfully created.' }
                format.json { render :show, status: :created, location: todo_list_path }
            else
                format.html { render :new }
                format.json { render json: @notification.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @notification.destroy
        respond_to do |format|
            format.html { redirect_to root_url, notice: 'Notification was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def accepted
        #@todo_item.update_attribute(:completed_at, Time.now)
        #redirect_to @todo_list, notice: "Task completed."
    end

    def rejected
        #@todo_item.update_attribute(:completed_at, "")
        #redirect_to @todo_list, notice: "Task uncompleted."
    end

    private

    def notification_params
        params[:notification].permit(:status, :sender_id, :receiver_id)
    end
    
    def set_todo_list
        @todo_list = TodoList.find(params[:id])
    end
end

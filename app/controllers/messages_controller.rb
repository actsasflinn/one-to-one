class MessagesController < ApplicationController
  before_action :set_user
  before_action :set_author
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    if @user
      @messages = @user.messages.all
    else
      @messages = Message.all
    end
    @message = Message.new(:user => @user, :author => @author, :status => "new")
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new(:user => @user, :author => @author, :status => "new")
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        #format.html { head :ok } #redirect_to @message, notice: 'Message was successfully created.' }
        format.html {
          @message = Message.new(:user => @user, :author => @author, :status => "new")
          render :new, status: :created
        }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      if @user
        @message = @user.messages.find(params[:id])
      else
        @message = Message.find(params[:id])
      end
    end

    def set_author
      if !params[:author_id].nil?
        @author = User.find(params[:author_id])
      elsif !@user.nil?
        @author = @user
      end
    end

    def set_user
      unless params[:user_id].nil?
        @user = User.find(params[:user_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :author_id, :content, :status, :file, :file_cache)
    end
end

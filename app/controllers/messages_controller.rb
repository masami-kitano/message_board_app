class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  
  def show
    @message = Message.find(params[:id])
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = 'Messageが正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Messageが投稿されませんでした'
      render :new
    end
  end
  
  def edit
    @message = Message.find(params[:id])
  end
  
  def update
    @message = Message.find(params:[:id])
    
    if @message.upgrade(message_params)
      flash[:success] = 'Messageは正常終了しました'
      redirect_to @message
    else
      flash.now[:danger] = 'Messageは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
end

private

# Strong Parameter
def message_params
  params.require(:message).permit(:content)
end

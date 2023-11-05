class WuyunsController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit,:show, :create, :destroy]
  include WuyunsHelper

    def index
      @wuyuns = Wuyun.paginate(:page => params[:page], :per_page => 10)
    end

    def new
      @wuyun = Wuyun.new

    end

    def show
      @wuyun = Wuyun.find(params[:id])

    end

    def destroy
      @wuyun = Wuyun.find(params[:id])


      if @wuyun.destroy

        flash[:success] = "删除成功！"
        redirect_to wuyuns_path
        #redirect_to action: :index, status: :see_other
      else
        flash[:alert] = "删除失败！"
      end

    end

    def create
      @wuyun = Wuyun.create(wuyun_params)
      year=params[:wuyun][:year]
      time= params[:wuyun][:time]
      s= get_tgyear(year)
      st=get_wulq(year,time)
      @wuyun.tgyear= s
      @wuyun.wyst=st.split(" ")[0]
      @wuyun.wykq=st.split(" ")[1]
      @wuyun.wyzhy=st.split(" ")[2]
      @wuyun.wyzhq=st.split(" ")[3]
      @wuyun.wyzq=st.split(" ")[4]

      if @wuyun.save
        flash[:success] = "人物创建成功"
        redirect_to wuyuns_path

      else
        render 'new'
      end
    end

    def edit
      @user = Wuyun.find(params[:id])

    end

    private

    def wuyun_params
      params.require(:wuyun).permit(:name, :year, :time)
    end
end

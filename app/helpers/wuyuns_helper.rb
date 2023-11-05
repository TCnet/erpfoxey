
module WuyunsHelper
  LQ_De="巳亥厥阴风木 子午少阴君火 丑未太阴湿土 寅申少阳相火 卯酉阳明燥金 辰戌太阳寒水"
  TG_De="甲 乙 丙 丁 戊 己 庚 辛 壬 癸"
  DZ_De="寅 卯 辰 巳 午 未 申 酉 戌 巳 子 丑"
  WY_De="甲己化土 乙庚化金 丙辛化水 丁壬化水 戊癸化火"
  KQS_De="厥阴 少阴 太阴 少阳 阳明 太阳"
  ZQS_De="厥阴风木 少阴君火 少阳相火 太阴湿土 阳明燥金 太阳寒水"
  LQBNum_De="410 115 126 17 28 39"
  GZN_De="1900"

#计算天干地支
    def get_tgyear(year)
      gzyear= GZN_De.to_i
      m=(year.to_i-gzyear)%60
      x=m%10
      y=m%12
      x1=(x+7)%10
      y1=(y+11)%12
      tg=TG_De.split(' ')
      dz=DZ_De.split(' ')
      s= tg[x1-1]+" "+dz[y1-1]
    end

    def set_qr(tgyear)
      str=get_qr(tgyear)
      case str
      when "1"
        "<i class='fa fa-arrow-up'></i>".html_safe
      when "0"
        "<i class='fa fa-arrow-down'></i>".html_safe
      else
        ""
      end
    end

#getqiangruo
    def get_qr(tgyear)
      ss=""
      str="甲 丙 戊 庚 壬"
      str2="乙 丁 己 辛 癸"
      if(!tgyear.nil?)
        stg=tgyear.split(" ")[0]
        if(str.include?stg)
          ss="1"
        elsif(str2.include?stg)
          ss="0"
        end
      end
      return ss
    end

#计算五运六气
    def get_wulq(year,time)
      gzyear=get_tgyear(year).split(" ")
      lq=LQ_De.split(" ")
      st=""
      stn=0
      zq=""

#计算司天在泉
      lq.each_with_index do |f,n|
        if(f.include?gzyear[1])
         st=f.to_s
         stn=n
        end
      end

      zqn=(stn+3)%6
      zq=lq[zqn]
      # 中运。
      zhy=""
      zhyn=0
     zy=WY_De.split(" ")
     zy.each_with_index do |f,n|
       if(f.include?gzyear[0])
        zhy=f.to_s
        zhyn=n
       end
     end
     #主气客气
     zhkq=get_zhkq(stn,year,time).split(" ")


     ss= st++" "+zhkq[0]+" "+ zhy+" "+zhkq[1]+" "+ zq

    end

    def get_zhkq(stnum,year,time)
      zqnum=0
      stime= Date.parse(year+"-"+ time)
      if(stime>Date.parse(year+"-"+"1-21") && stime<=Date.parse(year+"-"+"3-21"))
        zqnum=1
      elsif (stime>Date.parse(year+"-"+"3-21") && stime<=Date.parse(year+"-"+"5-21"))
        zqnum=2
      elsif (stime>Date.parse(year+"-"+"5-21") && stime<=Date.parse(year+"-"+"7-22"))
        zqnum=3
      elsif (stime>Date.parse(year+"-"+"7-22") && stime<=Date.parse(year+"-"+"9-22"))
        zqnum=4
      elsif (stime>Date.parse(year+"-"+"9-22") && stime<=Date.parse(year+"-"+"11-22"))
        zqnum=5
      elsif (stime>Date.parse(year+"-"+"11-22") && stime<=Date.parse((year.to_i+1).to_s+"-"+"1-21"))
        zqnum=6
      else
        zqnum=0
      end



      zhq=ZQS_De.split(" ")[zqnum-1]
      kqnum=(stnum-3+zqnum)%6
      kq=LQ_De.split(" ")[kqnum]

      ss=kq+" " +zhq
    end

end

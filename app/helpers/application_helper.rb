# coding: utf-8
module ApplicationHelper
  def full_title(page_title = '')

  # 根据所在的页面返回完整的标题 def full_title(page_title = '')
    base_title = "ERP for Aodrusa"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def sitename
    base_name = "Aodrusa"
  end

  def siteurl
    base_url = "www.aodursa.com"
  end

  def email
    "232181579@qq.com"
  end



  # 只允许一个isused
      def set_current_used(current_ag,themode)
        obs =  themode
        is_current= current_ag.isused
        obs.each_with_index do |f,e|
          if is_current
            if f!=current_ag
              f.isused = false
              f.save
            end

          end
        end
      end


end

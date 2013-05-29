class Admin::HolyDaysController < AdminController
  skip_load_and_authorize_resource
  before_filter { authorize! :read, :holy_days }

  def index
    @holy_day_lists = HolyDayList.all
    @days = @holy_day_lists.first.days unless @holy_day_lists.empty?
  end

  def add_list
    if !params[:name].blank?
      HolyDayList.create(name: params[:name])
    end

    @holy_day_lists = HolyDayList.all
  end

  def add_day
    @date = Date.parse(params[:date])
    @holy_day_list = HolyDayList.find_by_id(params[:list_id])

    unless @holy_day_list.formatted_days.include?(@date.strftime('%d/%m/%Y'))
      @holy_day_list.holy_days.create(day: @date)      
    end

    @days = @holy_day_list.days
  end

  def remove_day
    @date = Date.parse(params[:date])
    @holy_day_list = HolyDayList.find_by_id(params[:list_id])

    @holy_day_list.holy_days.select{ |hd| hd.day.strftime('%d/%m/%Y') == @date.strftime('%d/%m/%Y') }.first.destroy
    @days = @holy_day_list.days

    respond_to do |format|
      format.js { render action: 'add_day' }
    end
  end

  def update_list
    @holy_day_list = HolyDayList.find_by_id(params[:id])
    @days = @holy_day_list.days

    respond_to do |format|
      format.js { render action: 'add_day' }
    end
  end
end

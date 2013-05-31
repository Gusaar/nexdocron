module Admin::InvoicesHelper

  def get_invoice_hours(user)
    user.hours.where('date BETWEEN ? AND ?', @start_date.beginning_of_day, @end_date.end_of_day).order('date ASC')
  end

  def get_invoice_total_hours_per_client(user)
    user_hours = get_invoice_hours(user)
    total_hours = {}
    user_hours.each do |uh|
      total_hours[uh.project.client] ||= []
      total_hours[uh.project.client] << uh
    end
    total_hours
  end

  def get_project_hours(project)
    project.hours.where('date BETWEEN ? AND ?', @start_date.beginning_of_day, @end_date.end_of_day).order('date ASC')
  end
end

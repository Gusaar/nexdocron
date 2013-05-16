module Admin::InvoicesHelper

  def get_invoice_hours(user)
    user.hours.where('date BETWEEN ? AND ?', @start_date.beginning_of_day, @end_date.end_of_day).order('date ASC')
  end
end

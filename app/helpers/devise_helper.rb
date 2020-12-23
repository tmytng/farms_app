module DeviseHelper
  # test2
  def bootstrap_alert(key)
    case key
    when 'warning'
      'warning'
    when 'alert'
      'warning'
    when 'notice'
      'success'
    when 'error'
      'danger'
    when 'success'
      'success'
    end
  end
end

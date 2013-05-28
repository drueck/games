module ApplicationHelper

  def foundation_alert_class(flash_type)
    case flash_type
    when :notice
      'success'
    when :error
      'alert'
    else
      ''
    end
  end

end

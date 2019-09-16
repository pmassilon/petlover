module ApplicationHelper
  def bootstrap_alert_class_for(kind)
    klass = bootstrap_class_for(kind)
    prefix ='alert'
    bootstrap_make_class_for(prefix, kind)
  end

  def bootstrap_text_class_for(kind)
    klass = bootstrap_class_for(kind)
    prefix ='text'

    bootstrap_make_class_for(prefix, kind)
  end

  def bootstrap_make_class_for(prefix, kind)
    klass = bootstrap_class_for(kind)

    "#{prefix}-#{klass}"
  end

  private

  def bootstrap_class_for(kind)
    case kind
    when 'success'
      'success'
    when 'error'
      'danger'
    when 'alert'
      'warning'
    when 'notice'
      'info'
    else
      return kind.to_s
    end
  end
end

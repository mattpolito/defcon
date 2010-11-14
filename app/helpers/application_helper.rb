module ApplicationHelper
  def active_class(path)
    request.path =~ /#{path}/ ? 'active' : nil
  end
end

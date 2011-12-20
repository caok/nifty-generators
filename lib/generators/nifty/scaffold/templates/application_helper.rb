module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def scope_link(label, method, value)
    if params[method] == value.to_s or params[method].nil? && value == :all
      link_to label, params.merge(method => value, :page => 1), :class => :active
    else
      link_to label, params.merge(method => value, :page => 1)
    end
  end

  def filter_sort_link(search, attribute, *args)
    args << args.extract_options!.merge(params.except(:q).merge(:page => 1))
    sort_link search, attribute, *args
  end

  def xls_path(template = nil)
    template = controller.action_name if template.nil?
    "#{Rails.root}/app/xls/#{controller.controller_name}/#{template}.xls"
  end

  def b(obj)
    t("#{obj}_value")
  end

  def format_datetime(datetime)
    if datetime.nil?
      datetime
    else
      datetime.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end


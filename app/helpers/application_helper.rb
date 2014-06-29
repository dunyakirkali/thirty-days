module ApplicationHelper
  def markdown(text)
    extensions = {
      hard_wrap: true,
      filter_html: true,
      autolink: true,
      no_intraemphasis: true,
      fenced_code: true,
      gh_blockcode:true
    }
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)
    renderer.render(text).html_safe
  end
end

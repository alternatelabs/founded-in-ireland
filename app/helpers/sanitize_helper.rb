module SanitizeHelper
  def sanitize_html(html)
    Sanitize.fragment(html, Sanitize::Config.merge(Sanitize::Config::BASIC,
      elements: ['h2', 'h3', 'h4', 'a', 'p', 'strong', 'em', 'ul', 'ol', 'li']
    )).html_safe
  end
end
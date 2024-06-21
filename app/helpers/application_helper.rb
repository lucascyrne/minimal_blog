module ApplicationHelper
  def custom_simple_format(text, html_options = {}, options = {})
    # text = sanitize(text) if options.fetch(:sanitize, true)
    paragraphs = split_paragraphs(text)

    if paragraphs.empty?
      content_tag('p', nil, html_options)
    else
      paragraphs.map! { |paragraph|
        content_tag('p', raw(paragraph.gsub(/\n/, '<br />')), html_options)
      }.join("\n\n").html_safe
    end
  end

  private

  def split_paragraphs(text)
    text.to_str.split(/\n\n+/)
  end
end

# Jekyll - Easy Youtube Embed
#
# Katie Harron - https://github.com/pibby
#
#   Input:
#     {% youtube Al9FOtZcadQ %}
#   Output:
#   <div class="video">
#     <figure>
#       <iframe width="640" height="480" src="//www.youtube.com/embed/Al9FOtZcadQ?rel=0" allowfullscreen></iframe>
#     </figure>
#   </div>

module Jekyll
  class Map < Liquid::Tag
    @url = nil

    MAP_URL = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ MAP_URL
        @url = $1
      end
    end

    def render(context)

      source = "<div class=\"map\">"
      source += "<figure>"
      source += "<iframe width='100%' height='520' frameborder='0' src=#{@url} allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>"
      source += "</figure>"
      source += "</div>"

      source
    end
  end
end

Liquid::Template.register_tag('map', Jekyll::Map)
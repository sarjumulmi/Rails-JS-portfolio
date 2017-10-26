module ApplicationHelper
  def title(text)
    content_for :title, text
  end

  def link_to_add_fields(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.semantic_fields_for(association, new_object, :child_index=> id) do |builder|
      render(association.to_s.singularize, f:builder)
    end
    link_to(name, '#', :class => "add_fields " + (args[:class] || ''), :data => {:id => id, :fields => fields.gsub('\n', '')})
  end
end

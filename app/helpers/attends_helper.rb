module AttendsHelper

    def display_header
        if params[:event_id]
            content_tag(:h1, "RSVPs:")
        else
            content_tag(:h1, "My RSVPs")
        end
    end

end

class LinkDecorator < ApplicationDecorator
  decorates :Link

  def vote_button(link, current_user, signed_in)
    return h.content_tag :span, '+1', :class => 'inactive_button' if signed_in == false
    if current_user.votes.where(:link_id => link.id).count == 0
      button_class = "has_not_voted"
    else
      button_class = ""
    end
    h.link_to '+1', "#", :rel => link.id, :class => "btn btn-mini vote_link #{button_class}"
  end
end
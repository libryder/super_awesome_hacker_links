class LinkDecorator < ApplicationDecorator
  decorates :Link

  def vote_button(link, current_user, signed_in)
    return h.content_tag :span, '+1', :class => 'inactive_button' if signed_in == false

    if current_user.votes.exists?(:link_id => link.id) || current_user.links.exists?(:id => link.id)
      h.content_tag :span, '+1', :class => 'inactive_button'
    else
      h.link_to '+1', "/votes?user_id=#{current_user.id}&link_id=#{link.id}", method: 'post', :class => 'btn btn-mini'
    end
  end
end

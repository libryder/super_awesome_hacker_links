module LinksHelper
  def devise_link(signed_in)
    if signed_in
      link_to 'Sign Out', destroy_user_session_path, method: 'delete', :class => 'btn btn-mini', :id => 'logout'
    else
      link_to 'Sign In', new_user_session_path, method: 'get', :class => 'btn btn-mini', :id => 'logout'
    end
  end
end

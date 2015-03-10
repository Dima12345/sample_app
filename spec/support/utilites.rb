include ApplicationHelper

def a_p_s(user)
  fill_in "session_email", with: user.email.upcase
  fill_in "session_password", with: user.password
  click_button( "Sign in" )
end

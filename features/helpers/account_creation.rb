def clear_session_before_login
  visit '/logout'
  visit '/login'
end

def login_as_law_firm
  clear_session_before_login
  login_with_credentials 'law_firm_email', 'test'
end

def login_as_mediation_centre
  clear_session_before_login
  login_with_credentials 'mediation_centre_email', 'test'
end

def login_as_agent
  clear_session_before_login
  login_with_credentials 'agent_email', 'test'
end

def login_as_individual
  login_as_agent
end

def login_with_credentials (email, password)
  fill_in 'Email',    :with => email
  fill_in 'Password', :with => password
  click_button 'Login'
end
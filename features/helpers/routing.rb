def get_current_uri_path
  URI.parse(current_url).path
end

def get_current_uri_params
  URI.parse(current_url).query
end
# Include modules and add methods that are for all API requests
abstract class ApiAction < Lucky::Action
  # APIs typically do not need to send cookie/session data.
  # Remove this line if you want to send cookies in the response header.
  disable_cookies
  accepted_formats [:json]

  route_prefix "/api/v1"

  private def render_error(message, status)
    Errors::Show.new(HTTP::Server::Context.new(request, response)).render({message: message, status: status})
  end

  private def check_auth
    return render_error("auth.error.unauthorized", 401) if auth_header.blank?
    return render_error("auth.error.unauthorized", 401) if auth_header != ENV["AUTH_TOKEN"]
    continue
  end

  private def auth_header
    request.headers["Authorization"].split(" ").last
  end
end

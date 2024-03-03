# https://medium.com/@davidgurevich_11928/cloudfront-as-a-reverse-proxy-fb6a8dcbed96
# 6. Set allowed HTTP methods. Methods can be restricted but I allow all.
# 7. Configure caching based on request headers. You can configure caching of content by CloudFront to improve performance. I want to forward all requests to my application server, so I select All. This seems confusing, but CloudFront does not cache if All is selected.
# 8. Set cookie forwarding. Similarly, I want to forward all cookies because my application needs them.
# 9. Query string forwarding is likewise forwarded in all cases.
# ServerAlias your.domain your.cloudfront is required to add.
# modify app/controllers/application_controller.rb with redirect if redmine is using SSO.

  def handle_unverified_request
    unless api_request?
      super
      cookies.delete(autologin_cookie_name)
      self.logged_user = nil
      set_localization
      #render_error :status => 422, :message => "Invalid form authenticity token."
      # https://stackoverflow.com/questions/28719646/redmine-422-invalid-form-authenticity-token
      redirect_back_or_default(home_path)
    end
  end

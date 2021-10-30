class LoggedInConstraint < Struct.new(:value)
  def matches?(request)
    request.session[:admin] == value || request.session[:voter_id] == value
  end
end

class LoggedInConstraint < Struct.new(:value)
  def matches?(request)
    request.session[:admin] == value
  end
end

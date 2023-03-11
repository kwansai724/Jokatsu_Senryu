LoggedInConstraint = Struct.new(:value) do
  def matches?(request)
    request.session[:admin] == value || request.session[:voter_id] == value
  end
end

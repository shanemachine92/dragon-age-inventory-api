module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def valid_headers
    {
      "Authorization" => JsonWebToken.encode({user_id: user.id}),
      "Content-Type" => "application/json"
    }
  end
end

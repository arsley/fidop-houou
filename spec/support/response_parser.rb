module ResponseParser
  def json
    JSON.parse(response.body)
  end
end

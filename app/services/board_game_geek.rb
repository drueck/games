class BoardGameGeek
  def self.search(query)
    results = BggApi.search_by_name(query) || []
    results.map { |r| { title: r[:name], bgg_id: r[:id] } }
  end
end

base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url{
      xml.loc("https://sxy550.herokuapp.com")
      xml.changefreq("weekly")
      xml.priority(1.0)
  }
  xml.url{
      xml.loc("https://sxy550.herokuapp.com/genres")
      xml.changefreq("daily")
      xml.priority(0.9)
  }
  @movies.each do |movie|
    xml.url {
      xml.loc "#{movie_url(movie)}"
      xml.changefreq("weekly")
      xml.priority(0.9)
    }
  end
end
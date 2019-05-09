username = "liuyanqing" # GitHub 用户名
token = "0868de95052ddebea2b8c9fb3bd08a4c058a6548"  # GitHub Token
repo_name = "liuyanqing.github.io" # 存放 issues
sitemap_url = "https://liuyanqing.github.io/sitemap.xml" # sitemap
kind = "Gitalk" # "Gitalk" or "gitment"

require 'open-uri'
require 'faraday'
require 'active_support'
require 'active_support/core_ext'
require 'sitemap-parser'

sitemap = SitemapParser.new sitemap_url
urls = sitemap.to_a

conn = Faraday.new(:url => "https://api.github.com/repos/#{username}/#{repo_name}/issues") do |conn|
  conn.basic_auth(username, token)
  conn.adapter  Faraday.default_adapter
end

urls.each_with_index do |url, index|
  title = open(url).read.scan(/<title>(.*?)<\/title>/).first.first.force_encoding('UTF-8')
  response = conn.post do |req|
    req.body = { body: url, labels: [kind, url[0, 48]], title: title }.to_json
  end
  puts response.body
  sleep 15 if index % 20 == 0
end
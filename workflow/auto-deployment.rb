listen 'github::repos::push', repo:'Joshuaatt/blogger-rails' do |repo|
  run 'heroku::deploy', app:'blogger', content:repo.content do |deploy|
    success "Deploy complete"
  end
end

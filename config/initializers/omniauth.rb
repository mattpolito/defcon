Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '24ee04831b66bb4df7cc', 'e3f2b343f5b484a4b0571fff0f609f4abff48afe'
end

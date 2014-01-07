json.array!(@dashboards) do |dashboard|
  json.extract! dashboard, :admin, :developer
  json.url dashboard_url(dashboard, format: :json)
end

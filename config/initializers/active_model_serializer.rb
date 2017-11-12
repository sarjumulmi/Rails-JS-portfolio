ActiveModelSerializers.config.tap do |c|
  c.default_includes = '**'
  # c.adapter = :json_api
  # c.jsonapi_include_toplevel_object = true
  # c.jsonapi_version = "1.0"
end

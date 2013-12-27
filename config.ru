use Rack::Static,
  :urls => ["/packages", "/style_binding_test.css", "/style_binding_test.html_bootstrap.dart.js"],
  :root => "build"

run Rack::File.new("build/style_binding_test.html")
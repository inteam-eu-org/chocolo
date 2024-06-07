Rails.application.config.after_initialize do
  if defined?(::Rails::Server)
    ip = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
    warn "\nThis is your IP: #{ip}"
    warn "Use it to access the app from your mobile device on the same network"
    warn "For instance: http://#{ip}:3000\n\n"
  end
end
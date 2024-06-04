Rails.application.config.after_initialize do
  warn "\nThis is your IP: #{Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address}"
  warn "Use it to access the app from your mobile device on the same network"
  warn "For instance: http://192.168.0.1:3000\n\n"
end
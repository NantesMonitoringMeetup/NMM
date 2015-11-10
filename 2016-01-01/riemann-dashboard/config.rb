# Example configuration file for riemann-dash.

# Serve HTTP traffic on this port
set  :port, 4567

# Answer queries sent to this IP address
set  :bind, "0.0.0.0"

config[:ws_config] = 'dashboard.json'

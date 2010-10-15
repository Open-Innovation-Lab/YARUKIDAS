# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kzy_session',
  :secret      => 'fda0bcc355d44dea08358490228ab6fb2320d53e81dd8d92ad783a73ceae698a81a2b71bb368b3d8961508c8544af8d9604990de286bb4894a0d61b90291a572'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

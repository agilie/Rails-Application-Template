def capistrano_callback
  run_bundle
  run 'bundle exec cap install'
end
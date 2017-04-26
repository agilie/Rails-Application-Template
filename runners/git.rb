append_file '.gitignore', before: :end do
  <<-GIT

/.idea*
.DS_Store

config/database.yml

/coverage

public/uploads
public/ckeditor_assets
public/apidocs

  GIT
end

git :init
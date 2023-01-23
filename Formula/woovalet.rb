class Woovalet < Formula
  desc "WooCommerce development site valet"

#  homepage "https://github.com/rrennick/woovalet/"
#  url 'https://github.com/rrennick/woovalet.git' #, using: :git, :tag => "v0.1"
  version '1.0.0'

#  head do
    url 'https://github.com/rrennick/woovalet.git', branch: 'main'
#  end

  # Add the MySQL option for choice of DB server
  option 'with-mysql', 'Use MySQL for the database server'
  dbserver = if build.with? 'mysql'
      'mysql'
  else
      'mariadb'
  end

  depends_on 'php' => '8.1'
  depends_on dbserver
  depends_on 'composer'
  depends_on 'wp-cli'
  depends_on 'git'
  depends_on 'nvm'
  depends_on 'pnpm'

  # Install laravel/valet
  system 'composer', 'global', 'require', 'laravel/valet'
  system 'valet', 'install'

  def install
    bin.install 'woovalet'
  end
end

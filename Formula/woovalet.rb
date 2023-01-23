class Woovalet < Formula
  desc "WooCommerce development site valet"

#  homepage "https://github.com/rrennick/woovalet/"
#  url 'https://github.com/rrennick/woovalet.git' #, using: :git, :tag => "v0.1"
  version '1.0.2'

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
  depends_on 'nvm' => '16'
  depends_on 'pnpm'

  # Start the DB server
  system 'mysql.server', 'start'

  def install
    bin.install 'woovalet'
  end

  def caveats; <<~EOS
    Run 'sudo mysql_secure_installation'  to enable root user access to MySQL (if it has not been run already).
    Ensure the MySQL root user has a password.
  EOS
  end
end

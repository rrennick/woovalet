# WooCommerce Valet

Create a WordPress and WooCommerce development environment with the help of [Valet](https://laravel.com/docs/5.2/valet).

## Installation

1. Install or update [Homebrew](http://brew.sh/)
1. Run the following commands

```shell
brew tap woocommerce/woovalet git@github.com:rrennick/woovalet.git
brew install woocommerce/woovalet/woovalet
```

## Available Commands:

For now, WooCommerce Valet has just one command: `woovalet`.

The `woovalet` command will:

1. ask for the name of your project, enter something like `myproject`, defaults to `woocommerce`
1. ask for your MySQL/MariaDB root password (if you haven't set a password leave this blank)
1. download WordPress into the directory `~/Sites/myproject`
1. setup the database called `myproject` & configure the WordPress installation
1. create a new user with your MacOS username and password of `password`
1. remove the default WordPress plugins
1. configure `myproject.localhost` to run using TLS/SSL
1. clone the [WooCommerce](http://github.com/woocommerce/woocommerce/) git repository
1. activate the WooCommerce plugin
1. installs a number of plugins useful for development
1. install and activate the [Storefront](https://www.woothemes.com/storefront/) theme
1. install WooCommerce dummy data for test products

## Notes

This script will change your Valet configuration to serve projects using `.localhost`, a [reserved top level domain for development](https://iyware.com/dont-use-dev-for-development/), as the top level domain, instead of the default `.dev`, which is not a reserved TLD.

The script also uses `~/Sites` as a Valet project directory, as per the [Valet installation instructions](https://laravel.com/docs/5.2/valet#installation).

### Updating WooCommerce

WooCommerce Valet installs the development version of WooCommerce from its [GitHub repository](http://github.com/woocommerce/woocommerce/).

When new versions of WooCommerce are released, its recommended you update WooCommerce via Git from the command line, rather than the [WordPress Plugins](https://codex.wordpress.org/Managing_Plugins#Installing_Plugins) administration screen. Using the latter will overwrite the development version with the publicly released version which does not have the `/tests/` directory necessary for running unit tests.

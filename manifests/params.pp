# == Class nodejs::params
#
# This class is meant to be called from module.
# It sets variables according to platform.
#
class nodejs::params {

  $repository = "git@github.com:joyent/node.git"
  $path_tmp = "/var/tmp/"
  $app_name = "node"
  $full_path = $path_tmp . $app_name

  case $::osfamily {
    'Debian': {
      $package_require = [
                          "git",
                          "curl",
                          "build-essential",
                          "openssl",
                          "libssl-dev",
                            ]
      $version_repository = "master"
    }
    'RedHat', 'Amazon': {
      $package_name = 'nil'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

# == Class nodejs::params
#
# This class is meant to be called from module.
# It sets variables according to platform.
#
class nodejs::params {

  $repository = "git@github.com:joyent/node.git"
  $path_tmp = "/var/tmp/"

  case $::osfamily {
    'Debian': {
      $package_require = [
                          "git",
                            ]
      $app_name = "nodejs"
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

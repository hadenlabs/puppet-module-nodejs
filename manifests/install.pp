# == Class nodejs::install
#
# This class is called from module for install.
#
class nodejs::install {

  exec{"nodejs clone repository":
    command => "git clone ${::nodejs::repository} ${::nodejs::app_name} ",
    cwd => $::nodejs::path_tmp,
    require => [Package['git']],
    unless => "ls -l ${::nodejs::full_path}"
  }

  exec{"nodejs configure":
    command => "configure --openssl-libpath=/usr/lib/ssl"
    cwd => $::nodejs::full_path,
    unless => "which ${::nodejs::app_name}",
    require => [Exec["nodejs clone repository"],
                Package[$::nodejs::package_require]],
    logoutput=> true,
  }

  exec{"nodejs make":
    command => "make",
    cwd => $::nodejs::full_path,
    unless => "which ${::nodejs::app_name}",
    require => [Exec["nodejs configure"]],
    logoutput=> true,
  }

  exec{"nodejs make install":
    command => "make install",
    cwd => $::nodejs::full_path,
    unless => "which ${::nodejs::app_name}",
    require => [Exec["nodejs configure"]],
    logoutput=> true,
  }

}
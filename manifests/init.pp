# == Class: phantomjs
#
# Full description of class module here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class nodejs (
  $repository = $::nodejs::params::repository
) inherits ::nodejs::params {

  # validate parameters here

  class { '::nodejs::install': } ->
    Class['::nodejs']
}

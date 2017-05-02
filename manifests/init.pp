# Class: archiveplus
# ===========================
#
define archiveplus (

  $source         = undef,
  $archive_path   = undef,

  $app_name       = undef,
  $allow_insecure = undef,

  $ensure         = undef,
  $extract        = true,
  $extract_path   = undef,

  $checksum       = undef,
  $checksum_type  = undef,

  $creates        = undef,
  $cleanup        = true,

  $staging_path   = undef,

  # NOTE: Windows only, command to run to finish installation
  # after extraction has been completed.
  $install_exec = undef,

) {

  if $facts['osfamily'] == 'Windows' {

    # Include the archive class to ensure that appropriate tools are
    # installed.
    include '::archive'

    # call the archive defined type to do the heavy lifting
    archive { "${staging_path}/${app_name}/${archive}":
      allow_insecure => $allow_insecure,
      archive_path   => $archive_path,
      checksum       => $checksum,
      checksum_type  => $checksum_type
      cleanup        => $cleanup,
      creates        => $creates,
      ensure         => $ensure,
      extract        => true,
      extract_path   => $extract_path,
      source         => $source,
    }

    # run an exec to finish installation, make sure that the value of
    # $creates is something that is created during installation, not
    # during download / extraction
    exec { "finish_${app_name}_installation":
      command => $install_exec,
      path    => 'C:\\Windows\\System32',
      unless  => $creates
    }
  }
  elsif $facts['osfamily'] == 'RedHat' {

    # call the archive defined type to do the heavy lifting
    archive { "${staging_path}/${app_name}/${archive}":
      allow_insecure => $allow_insecure,
      archive_path   => $archive_path,
      checksum       => $checksum,
      checksum_type  => $checksum_type
      cleanup        => $cleanup,
      creates        => $creates,
      ensure         => $ensure,
      extract        => true,
      extract_path   => $extract_path,
      source         => $source,
    }
  }
  else {
    fail("Module $module_name} is not supported on ${$facts['os']['family']}") 
  }
}











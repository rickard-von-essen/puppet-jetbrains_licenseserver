# == Class: jetbrains_licenseserver
#
# Installs the JetBrains License Server with the bundled Tom Cat.
# See http://confluence.jetbrains.com/display/LS/Home
#
# Requires JAVA_HOME to point to Java 6 JRE/JDK or later and unzip.
#
# === Parameters
#
# [*version*]
#   The version of the License Server to install. Default 332
#
# [*tomcat_version*]
#   The version of tomcat that is bundled with the license server.
#   Used to create a link from the start script to /etc/init.d .
#
# === Variables
#
#
# === Examples
#
#  include jetbrains_licenseserver
#
#  class { jetbrains_licenseserver:
#    version        => '328',
#    tomcat_version => '6.0.30',
#  }
#
# === Authors
#
# Rickard von Essen <rickard.von.essen@gmail.com>
#
# === Copyright
#
# Copyright 2014 Rickard von Essen
#
class jetbrains_licenseserver ( $version = '332', $tomcat_version = '6.0.36' ) {

  $short_arch = $::architecture ? {
    'x86_64' => 'x64',
    default  => 'x86',
  }

  archive { "jetbrains-licenseServer-${version}-${short_arch}":
    ensure     => present,
    url        => "http://download-ln.jetbrains.com/lcsrv/licenseServer-tomcat-${version}-${short_arch}.zip",
    extension  => 'zip',
    src_target => '/tmp',
    checksum   => false,
    target     => "/opt/jetbrains-licenseServer-${version}-${short_arch}",
  } ->

  file { "/opt/jetbrains-licenseServer-${version}-${short_arch}/apache-tomcat-${tomcat_version}-${short_arch}/bin/jb-licenseserver.sh":
    ensure => present,
    source => 'puppet:///modules/jetbrains_licenseserver/jb-licenseserver.sh',
    mode   => '0744',
  } ->

  file { '/etc/init.d/jb-licenseserver':
    ensure => link,
    target => "/opt/jetbrains-licenseServer-${version}-${short_arch}/apache-tomcat-${tomcat_version}-${short_arch}/bin/jb-licenseserver.sh",
  } ->

  service { 'jb-licenseserver':
    ensure => running,
    enable => true,
  }
}

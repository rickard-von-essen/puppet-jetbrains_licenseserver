JetBrains License Server
========================

This is a puppet module to install jetbrains_licenseserver module.
See [JetBrains License Server](http://confluence.jetbrains.com/display/LS/Home)

Requires
--------

Modules: [gini-archive](https://github.com/gini/puppet-archive) >= 0.2.0

Packages:
 - Java 6 JRE/JDK or later
 - unzip

Usage
-----

To use the default version:
```
package { 'java-1.7.0-openjdk':
  ensure => installed,
}
package { 'unzip':
  ensure => installed,
}

include jetbrains_licenseserver
```

To select a specific version:
```
class { jetbrains_licenseserver:
  version        => '328',
  tomcat_version => '6.0.30',
}
```

License
-------

This puppet module is licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

Contact
-------

Rickard von Essen <rickard.von.essen@gmail.com>

Support
-------

Please log tickets and issues at our [GitHub issues](https://github.com/rickard-von-essen/puppet-jetbrains_licenseserver/issues)

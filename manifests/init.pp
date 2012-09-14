# /etc/puppet/modules/java/manifests/init.pp

class java {

	require java::params

        Exec { path => "/bin" }

        file {"$java::params::java_base":
		ensure => "directory",
		owner => "root",
		group => "root",
		alias => "java-base"
	}
        
	file { "${java::params::java_base}/jdk${java::params::java_version}.tar.gz":
		mode => 0644,
		owner => root,
		group => root,
		source => "puppet:///modules/java/jdk${java::params::java_version}.tar.gz",
		alias => "java-source-tgz",
		before => Exec["untar-java"],
		require => File["java-base"]
	}
	
	exec { "untar jdk${java::params::java_version}.tar.gz":
		command => "tar -zxf jdk${java::params::java_version}.tar.gz",
		cwd => "${java::params::java_base}",
		creates => "${java::params::java_base}/jdk${java::params::java_version}",
		alias => "untar-java",
		refreshonly => true,
		subscribe => File["java-source-tgz"],
		before => File["java-app-dir"]
	}
	
	file { "${java::params::java_base}/jdk${java::params::java_version}":
		ensure => "directory",
		mode => 0644,
		owner => root,
		group => root,
		alias => "java-app-dir"
	}
}

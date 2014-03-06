node 'puppet-standalone' {
    include nginx
    package { 'joe':
        ensure => installed,
        
    }
    package { 'git':
        ensure => installed,    
    }
    
}


node "lb-compute-web-nodes" {
  include nginx
  include cron
  
  package { 'git':
    ensure => installed,
  }
  package { 'joe':
    ensure => installed,
    
  }
  package { 'name':
    ensure => installed,
  }
  # Class: name
  #
  #
  
  sudo::conf {
      'eric':
          priority => 10,
          source => 'puppet:///files/etc/sudoers.d/users/eric',
  }
  
  cron::job {
      'puppet-apply':
      minute => '*/5',
      hour => '*',
      date => '*',
      month => '*',
      weekday => '*',
      user => 'root',
      command => 'cd /opt/puppet-django-demo/ && git pull && puppet apply /opt/puppet-django-demo/manifests/sites.pp --modulepath=/opt/puppet-django-demo/modules',
      
  }
  
}

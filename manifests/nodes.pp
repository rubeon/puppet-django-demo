node "windowspuppet" {
        scheduled_task { 'puppet-repo-update':
        name => 'puppet updater',
        ensure => 'present',
        enabled => 'true',
        command => 'c:\Program Files (x86)\Git\bin\git.exe',
        arguments => 'pull',
        working_dir => 'c:\puppet-django-demo',
        
    }
        
}


node 'puppet-standalone' {
    include nginx
    package { 'joe':
        ensure => installed,
    
    }
    package { 'git':
        ensure => installed,    
    }
    sudo::conf {
        'eric':
            priority => 10,
            source => 'puppet:///etc/sudoers.d/users/eric',
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


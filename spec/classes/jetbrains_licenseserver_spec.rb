require 'spec_helper'

describe 'jetbrains_licenseserver', :type => :class do

  context "On x86_64 architecture" do
    let :facts do
      { :architecture => 'x86_64' }
    end

    it {
      should contain_file( '/etc/init.d/jb-licenseserver' )
      .with(
        {
          'ensure' => 'link',
          'target' => '/opt/jetbrains-licenseServer-385-x64/apache-tomcat-7.0.52-x64/bin/catalina.sh',
        }
      )

      should contain_service( 'jb-licenseserver' ).with(
        {
          'name'      => 'jb-licenseserver',
          'ensure'    => 'running',
          'hasstatus' => false,
        } )
      }
  end
end

require 'spec_helper'

describe 'jetbrains_licenseserver', :type => :class do

  context "On x86_64 architecture" do
    let :facts do
      { :architecture => 'x86_64' }
    end

    it {
      should contain_file( '/opt/jetbrains-licenseServer-332-x64/apache-tomcat-6.0.36-x64/bin/jb-licenseserver.sh' )
      .with(
        { 'mode' => '0744' }
      )

      should contain_service( 'jb-licenseserver' ).with(
        {
          'name'   => 'jb-licenseserver',
          'ensure' => 'running',
          'enable' => true,
        } )
      }
  end
end

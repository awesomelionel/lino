require 'spec_helper'

describe 'rvm::system' do

  # assume RVM is already installed
  let(:facts) {{ :rvm_version => '1.10.0' }}

  context "default parameters", :compile do
    it { should_not contain_exec('system-rvm-get') }
  end

  context "with present version", :compile do
    let(:params) {{ :version => 'present' }}
    it { should_not contain_exec('system-rvm-get') }
  end

  context "with latest version", :compile do
    let(:params) {{ :version => 'latest' }}
    it { should contain_exec('system-rvm-get').with_command('rvm get latest') }
  end

  context "with explicit version", :compile do
    let(:params) {{ :version => '1.20.0' }}
    it { should contain_exec('system-rvm-get').with_command('rvm get 1.20.0') }
  end
end

control 'vault_check' do

  describe systemd_service ("vault.service") do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/etc/vault.d/scripts/vault_init.sh') do
    it { should exist }
  end

  describe file('/etc/vault.d/scripts/vault_unseal.sh') do
    it { should exist }
  end

  describe command('/etc/vault.d/scripts/vault_init.sh') do
    its('exit_status') { should eq 0 }
  end

  describe command('/etc/vault.d/scripts/vault_unseal.sh') do
    its('exit_status') { should eq 0 }
  end

end

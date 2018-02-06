# # encoding: utf-8

# Inspec test for recipe db::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Mongo should be installed
describe package('mongodb-org') do
	it {should be_installed}
	# Mongo versions
	its('version') {should match /3\.2\../}
end

# Check listening on right port

describe port(27017) do
  it { should be_listening }
  its('addresses') {should include '0.0.0.0'}
end


# Mongo enables
# Mongo running
describe service 'mongod' do
  it { should be_running }
  it { should be_enabled }
end

# mongo_conf_file = attribute('conf_file', default: '/etc/mongod.conf', description: 'Path to the mongod.conf file')
# conf_file = yaml(mongo_conf_file)

# # Check the bind ip is 0.0.0.0
# describe conf_file do
# 	its(["net", "bindIp"]) { should cmp "0.0.0.0" }
# end

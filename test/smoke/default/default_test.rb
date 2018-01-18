

describe file('/var/www/html/style.css') do
 it { should exist }
end

describe file('/var/www/html/index.html') do
 it { should exist }
end

describe command 'wget -qO- localhost' do
  its('stdout') { should match(/Killer/) }
end
#
# Author:: David A. Golden
# Contributors:: J.R. Mash <jrmash@cpan.org>
# Cookbook Name:: perlbrew
# Recipe:: default
#
# Copyright:: 2012, David A. Golden <dagolden@cpan.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"

perlbrew node['perlbrew']['perlbrew_root']

perlbrew '/opt/perlbrew' do
    perls         [ 'perl-5.8.8' ]
    upgrade       true
  end

perlbrew_switch 'perl-5.8.8'

perlbrew_cpanm 'Modern Perl modules' do
    modules ['DBD::mysql', 'DBI', 'Text::CSV', 'JSON', 'Canary::Stability', 'JSON::XS', 'LWP', 'Module::Build', 'Mail::IMAPClient', 'XML::LibXML', 'Authen::SASL', 'Net::FTP', 'Net::FTPSSL', 'Web::Scraper', 'Mail::POP3Client', 'MIME::Parser', 'DateTime', 'DateTime::Format::MySQL', 'Math::GMP', 'Net::SSH::Perl', 'Math::Pari', 'Net::SFTP']
    perlbrew 'perl-5.8.8@mylib'
 end

perlbrew_profile '/etc/profile.d/perlbrew.sh' do
    mode          0644
    group         'root'
    owner         'root'
    template      'perlbrew.sh.erb'
  end


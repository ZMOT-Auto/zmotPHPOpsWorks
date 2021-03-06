#
# Author:: David A. Golden
# Cookbook Name:: perlbrew
# Attribute:: default
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

# sets PERLBREW_ROOT
default['perlbrew']['perlbrew_root'] = '/opt/perlbrew'
# list of perls to install in perlbrew recipe, e.g. ["perl-5.14.2", ...]
default['perlbrew']['perls'] = []
# default command line options for "perlbrew install" if no LWRP options
# attribute is given
default['perlbrew']['install_options'] = ''
default['perlbrew']['cpanm_options'] = '--notest'
default['perlbrew']['self_upgrade'] = true

default['perlbrew']['profile']['group'] = 'root'
default['perlbrew']['profile']['mode'] = 0644
default['perlbrew']['profile']['owner'] = 'root'
default['perlbrew']['profile']['script'] = '/etc/profile.d/perlbrew.sh'
default['perlbrew']['profile']['template'] = 'perlbrew.sh.erb'

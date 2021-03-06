#
# Cookbook:: phylogeny
# Recipe:: tools
#
# Copyright:: 2016-2019 Jörgen Brandt <joergen@cuneiform-lang.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# refresh package sources
bash "apt-get_update" do
    code "apt-get update"
end

include_recipe "phylogeny::hmmer"

package "phylip"
package "clustalw"
package "muscle"
package "ghostscript"
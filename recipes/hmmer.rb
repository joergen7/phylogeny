#
# Cookbook:: phylogeny
# Recipe:: hmmer
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

hmmer_link = "http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-linux-intel-x86_64.tar.gz"
hmmer_tar  = "#{node["dir"]["archive"]}/#{File.basename( hmmer_link )}"
hmmer_dir  = "#{node["dir"]["software"]}/hmmer-3.1b2-linux-intel-x86_64"

directory node["dir"]["software"]
directory node["dir"]["archive"]

remote_file hmmer_tar do
  action :create_if_missing
  source hmmer_link
  retries 1
end

bash "extract_hmmer" do
  code "tar xf #{hmmer_tar} -C #{node["dir"]["software"]}"
  not_if "#{Dir.exists?( hmmer_dir )}"
end

link "#{node["dir"]["bin"]}/hmmbuild" do
  to "#{hmmer_dir}/binaries/hmmbuild"
end

link "#{node["dir"]["bin"]}/hmmsearch" do
  to "#{hmmer_dir}/binaries/hmmsearch"
end

link "#{node["dir"]["bin"]}/esl-reformat" do
  to "#{hmmer_dir}/binaries/esl-reformat"
end


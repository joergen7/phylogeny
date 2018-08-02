#
# Cookbook:: phylogeny
# Recipe:: data
#
# Copyright:: 2016-2018 Jörgen Brandt
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


fa_dir = "#{node["dir"]["data"]}/fa"
seed_dir = "#{node["dir"]["data"]}/seed"

chase_seed = "#{seed_dir}/PF03924_seed.txt"

jgi_base_url = "ftp://ftp.jgi-psf.org/pub/JGI_data"
jgi_link_lst = [
  "Poplar/annotation/v1.1/Poptr1_1_GeneModels_AllModels_20081112_aa.fasta.gz",
  "Physcomitrella_patens/v1.1/proteins.Phypa1_1.AllModels.fasta.gz",
  "Volvox_carteri/annotation/v1.0/Volca1.GeneCatalog_2007_09_13.proteins.fasta.gz",
  "Selaginella_moellendorffii/v1.0/Selmo1_GeneModels_FilteredModels2_aa.fasta.gz",
  "Chlamy/v4.0/annotation/Chlre4_all_proteins.fasta.gz"
]

gramene_base_url = "ftp://ftp.gramene.org/pub/gramene/CURRENT_RELEASE/data/fasta"
gramene_link_lst = [
  "oryza_sativa/pep/Oryza_sativa.IRGSP-1.0.31.pep.all.fa.gz",
  "arabidopsis_thaliana/pep/Arabidopsis_thaliana.TAIR10.31.pep.all.fa.gz"
]

directory node["dir"]["data"]
directory fa_dir
directory seed_dir

jgi_link_lst.each { |link|

  remote_file "#{fa_dir}/#{File.basename( link )}" do
    action :create_if_missing
    source "#{jgi_base_url}/#{link}"
    retries 1
  end
}

gramene_link_lst.each { |link|

  remote_file "#{fa_dir}/#{File.basename( link )}" do
    action :create_if_missing
    source "#{gramene_base_url}/#{link}"
    retries 1
  end
}

cookbook_file chase_seed do
  source "PF03924_seed.txt"
end
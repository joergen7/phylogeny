#
# Cookbook Name:: phylogeny
# Recipe:: data
#
# Copyright (c) 2016 Jörgen Brandt, All Rights Reserved.


fa_dir = "#{node.dir.data}/fa"
seed_dir = "#{node.dir.data}/seed"

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

directory node.dir.data
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
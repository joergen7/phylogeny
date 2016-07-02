#
# Cookbook Name:: phylogeny
# Recipe:: data
#
# Copyright (c) 2016 Jörgen Brandt, All Rights Reserved.


fa_dir = "#{node.dir.data}/fa"
seed_dir = "#{node.dir.data}/seed"

chase_seed = "#{seed_dir}/PF03924_seed.txt"

link_lst = [
            "ftp://ftp.jgi-psf.org/pub/JGI_data/Chlamy/v4.0/annotation/Chlre4_all_proteins.fasta.gz",
            "ftp://ftp.jgi-psf.org/pub/JGI_data/Physcomitrella_patens/v1.1/proteins.Phypa1_1.AllModels.fasta.gz",
            "ftp://ftp.jgi-psf.org/pub/JGI_data/Aureococcus_anophageferrens/annotation/v1.0/proteins.Auran1_FilteredModels3.fasta.gz",
            "ftp://ftp.jgi-psf.org/pub/JGI_data/Chlorella_NC64A/annotation/v1.0/Chlorella_NC64A.all_proteins.fasta.gz",
            "ftp://ftp.jgi-psf.org/pub/JGI_data/Chlorella_vulgaris/annotation/v1.0/Chlvu1_all_proteins_3.fasta.gz",
            "ftp://ftp.jgi-psf.org/pub/JGI_data/Ehuxleyi/annotation/v1.0/Emihu1_all_proteins.fasta.gz",
            "ftp://ftp.jgi-psf.org/pub/JGI_data/Fragilariopsis_cylindrus/v1.0/Fracy1_GeneModels_FilteredModels2_aa.fasta.gz"
           ]

directory node.dir.data
directory fa_dir
directory seed_dir

link_lst.each { |link|

  remote_file "#{fa_dir}/#{File.basename( link )}" do
    action :create_if_missing
    source link
    retries 1
  end
}

cookbook_file chase_seed do
  source "PF03924_seed.txt"
end
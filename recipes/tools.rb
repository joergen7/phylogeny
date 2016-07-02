#
# Cookbook Name:: phylogeny
# Recipe:: tools
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "chef-bioinf-worker::hmmer"
include_recipe "chef-bioinf-worker::muscle"
include_recipe "chef-bioinf-worker::clustalw"
include_recipe "chef-bioinf-worker::phylip"

package "ghostscript"
#
# Cookbook Name:: phylogeny
# Recipe:: default
#
# Copyright (c) 2016 Jörgen Brandt, All Rights Reserved.

include_recipe "chef-cuneiform::default"

include_recipe "phylogeny::data"
include_recipe "phylogeny::tools"
include_recipe "phylogeny::workflow"

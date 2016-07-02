#
# Cookbook Name:: phylogeny
# Recipe:: workflow
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory node.dir.wf

# place workflow
template "#{node.dir.wf}/phylogeny.cf" do
  source "phylogeny.cf.erb"
end

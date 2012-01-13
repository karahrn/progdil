#!/usr/bin/ruby
# encoding: utf-8

require 'yaml'
require 'erb'

def yml2md(yaml_dosya, markdown_dosya_adi)
  File.open(markdown_dosya_adi, "w") do |f|
    f.puts "# #{yaml_dosya['title']}"
    yaml_dosya['q'].collect do |soru|
      f.puts "- #{File.read("_includes/q/#{soru}")}\n"
      f.puts "![resim](_includes/q/media/inceleme-kodu.gif)\n\n"
    end
    f.puts "#{ERB.new(File.read('_templates/exam.md.erb')).result}"
    f.puts "## #{yaml_dosya['footer']}"
  end
end

def md2pdf(sinav_adi)
  sh "markdown2pdf #{sinav_adi}.md > #{sinav_adi}.pdf"
end

task :exam => [:md, :pdf]

task :md do
  Dir["_exams/*.yml"].each do |yml|
    yaml_dosya = YAML.load(File.open(yml))
    markdown_dosya_adi = "_exams/#{File.basename(yml).split('.')[0]}.md"
    yml2md(yaml_dosya, markdown_dosya_adi)
  end
end

task :pdf do
  Dir["_exams/*.md"].each do |md|
    md2pdf("_exams/#{File.basename(md).split('.')[0]}")
  end
end

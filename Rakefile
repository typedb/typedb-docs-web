# ---- Rake tasks
desc 'Install dependencies to build project'
task :dependencies do
    # Install build dependencies
    sh 'bundle install'
end

desc 'Clean up generated files'
task :clean do
    rm_rf './_site'
end

desc 'Ruby buildpack to build jekyll'
task "assets:precompile" do
    jekyll('build')
end

desc 'Generate HTML and build site'
task :build => ['clean'] do
    jekyll('build')
end

task :serve => ['clean', 'build'] do
    jekyll('serve')
    :clean
end

task :test do
  require 'html-proofer'

  jekyll('build')
  options = {
      :assume_extension => true,
      :allow_hash_href => true,
      :url_ignore => [
          # The favicon is not in the repo
          '/favicon.ico',
          # This is the address of engine by default
          %r{.*://localhost:4567.*},
          # We generate links to the pages within our repo which may not exist yet
          %r{.*github\.com/graknlabs/grakn/tree/.*},
          %r{.*github\.com/graknlabs/sample-(projects|datasets).*},
          # These ones mysteriously go wrong even though they were fine when I last checked
          %r{https://javadoc.io/.*},
          'https://docs.docker.com/docker-for-windows/'
      ],
      # avoid SSL errors: https://github.com/gjtorikian/html-proofer/issues/376
      :typhoeus => {
        :ssl_verifypeer => false,
        :ssl_verifyhost => 0
      }
  }
  HTMLProofer.check_directory("./_site", options).run
end

# ---- Rake functions

# Run Jekyll
def jekyll(opts='')
   sh "bundle exec jekyll #{opts} --trace"
end


# NOTE: Requires `bundle install` from `pages` and --spawn_strategy=local to work properly
genrule(
    name = "pages",
    srcs = glob(["**"]),
    outs = ["pages.tar.gz"],
    cmd = "cd pages && bundle exec jekyll build && tar -czvf ../$@ --strip-components=1 ./_site",
    visibility = ["//visibility:public"],
)

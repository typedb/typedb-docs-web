load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def vaticle_dependencies():
    git_repository(
        name = "vaticle_dependencies",
        remote = "https://github.com/lolski/dependencies",
        commit = "573fc693d11144db5fa54d579eddfd7140b61be2", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_dependencies
    )

def vaticle_web_main():
    git_repository(
        name = "vaticle_web_main",
        remote = "git@github.com:vaticle/web-main.git",
        commit = "10dd017cdb31c5dab10836394402d6cd9e9208e9", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_web_main
    )

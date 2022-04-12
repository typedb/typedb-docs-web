load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def vaticle_dependencies():
    git_repository(
        name = "vaticle_dependencies",
        remote = "https://github.com/lolski/dependencies",
        commit = "984f7070d55fce7c72585301ca4017bb7991e2c4", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_dependencies
    )

def vaticle_web_main():
    git_repository(
        name = "vaticle_web_main",
        remote = "git@github.com:vaticle/web-main.git",
        commit = "c2e554e5cf557fa081ec3660a9c9f357cb2c1a8f", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_web_main
    )

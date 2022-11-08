load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def vaticle_dependencies():
    git_repository(
        name = "vaticle_dependencies",
        remote = "https://github.com/vaticle/dependencies",
        commit = "5be6d949ca1e04e4179ea6acb3432be713b9dfb8", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_dependencies
    )

def vaticle_web_main():
    git_repository(
        name = "vaticle_web_main",
        remote = "git@github.com:vaticle/web-main.git",
        commit = "c78d74a58974866e715a296c48ebd56f30860b27", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_web_main
    )

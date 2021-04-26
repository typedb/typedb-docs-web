load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def vaticle_dependencies():
    git_repository(
        name = "vaticle_dependencies",
        remote = "https://github.com/vaticle/dependencies",
        commit = "3a58ebd1f1e249b21b8d8bd07c7415d127aa9dc1", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_dependencies
    )

def vaticle_web_main():
    git_repository(
        name = "vaticle_web_main",
        remote = "git@github.com:vaticle/web-main.git",
        commit = "d944e3dbcf81d27e430c80113f03c1f1aeab9704", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_web_main
    )
